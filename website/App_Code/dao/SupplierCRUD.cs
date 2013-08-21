using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Class for working with database for Supplier.
/// </summary>
public class SupplierCRUD : ICRUD<Supplier>
{
   
    ConnectionManager connectionManager = new ConnectionManager();
    Data_Mng.SQL_DTMG DM;

    public SupplierCRUD()
	{
	}
    
    #region ICRUD<Supplier> Members

    public long create(Supplier entity)
    {
        object idGenerated = -1;
        SqlConnection sqlConnection = connectionManager.getConnection();
        
        try
        {
            SqlCommand command = new SqlCommand("SuppierMaster_NewSupplier", sqlConnection);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@SupplierName",entity.SupplierName);
            command.Parameters.AddWithValue("@ContactName", entity.ContactName);
            command.Parameters.AddWithValue("@ContactPhoneNumber", entity.ContactPhone);
            command.Parameters.AddWithValue("@ContactEmail", entity.ContactEmail);
            command.Parameters.AddWithValue("@ManufacturingLocation", entity.ManufacturingLocation);
            command.Parameters.AddWithValue("@ShipLocation", entity.ShipLocation);
            command.Parameters.AddWithValue("@QuotedCurrency", entity.QuotedCurrency);
            sqlConnection.Open();
            idGenerated = command.ExecuteScalar();
        }
        catch(Exception e){
            return -1;
        }

        return 1;        
    }

    public Supplier readById(long id)
    {
        Supplier supplier = new Supplier();
        string query = "SELECT SupplierMasterKey, SupplierName, ManufacturingLocation, ShipLocation, QuotedCurrency, ContactName, ContactPhoneNumber, ContactEmail FROM SupplierMaster WHERE SupplierMasterKey=@key";
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key",id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);
            if(table.Rows.Count > 0){
                supplier.Id = long.Parse(table.Rows[0][0].ToString());
                supplier.SupplierName = table.Rows[0][1].ToString();
                supplier.ManufacturingLocation = table.Rows[0][2].ToString();
                supplier.ShipLocation = table.Rows[0][3].ToString();
                supplier.QuotedCurrency = table.Rows[0][4].ToString();
                supplier.ContactName = table.Rows[0][5].ToString();
                supplier.ContactPhone = table.Rows[0][6].ToString();
                supplier.ContactEmail = table.Rows[0][7].ToString();
                sqlConnection.Dispose();
                return supplier;
            }
        }
        return null;
    }

    public IList<Supplier> readAll()
    {
        List<Supplier>  recordset = new List<Supplier>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT SupplierMasterKey, SupplierName, ManufacturingLocation, ShipLocation, QuotedCurrency, ContactName, ContactPhoneNumber, ContactEmail FROM SupplierMaster ORDER BY SupplierName";
        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
        for (int i = 0; i < table.Rows.Count; i++)
        {
            Supplier supplier = new Supplier();
            supplier.Id = long.Parse(table.Rows[i][0].ToString());
            supplier.SupplierName = table.Rows[i][1].ToString();
            supplier.ManufacturingLocation = table.Rows[i][2].ToString();
            supplier.ShipLocation = table.Rows[i][3].ToString();
            supplier.QuotedCurrency = table.Rows[i][4].ToString();
            supplier.ContactName = table.Rows[i][5].ToString();
            supplier.ContactPhone = table.Rows[i][6].ToString();
            supplier.ContactEmail = table.Rows[i][7].ToString();
            recordset.Add(supplier);
        }
       
        return recordset;
    }
    public bool update(Supplier entity)
    {
        int rowsAffected = 0;
        SqlConnection sqlConnection = connectionManager.getConnection();

        try
        {
            SqlCommand command = new SqlCommand("SuppierMaster_EditSupplier", sqlConnection);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@SupplierKey", entity.Id);
            command.Parameters.AddWithValue("@SupplierName", entity.SupplierName);
            command.Parameters.AddWithValue("@ContactName", entity.ContactName);
            command.Parameters.AddWithValue("@ContactPhoneNumber", entity.ContactPhone);
            command.Parameters.AddWithValue("@ContactEmail", entity.ContactEmail);
            command.Parameters.AddWithValue("@ManufacturingLocation", entity.ManufacturingLocation);
            command.Parameters.AddWithValue("@ShipLocation", entity.ShipLocation);
            command.Parameters.AddWithValue("@QuotedCurrency", entity.QuotedCurrency);
            sqlConnection.Open();
            rowsAffected = command.ExecuteNonQuery();
            
            if (rowsAffected <= 0)
            {
                return false;
            }
        }
        catch (Exception e)
        {
            return false;
        }

        return true;      
    }

    public bool delete(long id)
    {
        throw new NotImplementedException();
    }

    #endregion
}
