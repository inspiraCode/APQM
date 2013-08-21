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

    public long create()
    {
        throw new NotImplementedException();
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
    public bool update()
    {
        throw new NotImplementedException();
    }

    public bool delete()
    {
        throw new NotImplementedException();
    }

    #endregion
}
