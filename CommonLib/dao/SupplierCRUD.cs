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
    Data_Base_MNG.SQL DM;
    public string error = "";


    public SupplierCRUD()
	{}
    
    #region ICRUD<Supplier> Members

    public bool create(Supplier entity)
    {
        bool result = false;

        //if (DM == null) 
        DM = connectionManager.getDataManager();
        
        try
        {            
            DM.Load_SP_Parameters("@SupplierName", entity.SupplierName);
            DM.Load_SP_Parameters("@ContactName", entity.ContactName);
            DM.Load_SP_Parameters("@ContactPhoneNumber", entity.ContactPhone);
            DM.Load_SP_Parameters("@ContactEmail", entity.ContactEmail);
            DM.Load_SP_Parameters("@ManufacturingLocation", entity.ManufacturingLocation);
            DM.Load_SP_Parameters("@ShipLocation", entity.ShipLocation);
            DM.Load_SP_Parameters("@QuotedCurrency", entity.QuotedCurrency);
            DM.Load_SP_Parameters("@Capabilities", entity.Capabilities);
            DM.Load_SP_Parameters("@Comments", entity.Comments);
            DM.Load_SP_Parameters("@Visible", entity.Visible.ToString());
            DM.Load_SP_Parameters("@Commodity", entity.Commodity);
            DM.Load_SP_Parameters("@ContactCellPhoneNumber", entity.ContactCellPhone);

            result = DM.Execute_StoreProcedure("SupplierMaster_NewSupplier", true);

            //if (DM.ErrorOccur) { 
            //    this.error = DM.Error_Mjs;
            //    return false;
            //}
        }
        catch (Exception e)
        {
            return false;
        }       

        return result;
    }
    public string createAndReturnIdGenerated(Supplier entity)
    {
        string idGenerated = "";
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SupplierName", entity.SupplierName);
            DM.Load_SP_Parameters("@ContactName", entity.ContactName);
            DM.Load_SP_Parameters("@ContactPhoneNumber", entity.ContactPhone);
            DM.Load_SP_Parameters("@ContactEmail", entity.ContactEmail);
            DM.Load_SP_Parameters("@ManufacturingLocation", entity.ManufacturingLocation);
            DM.Load_SP_Parameters("@ShipLocation", entity.ShipLocation);
            DM.Load_SP_Parameters("@QuotedCurrency", entity.QuotedCurrency);
            DM.Load_SP_Parameters("@Capabilities", entity.Capabilities);
            DM.Load_SP_Parameters("@Comments", entity.Comments);
            DM.Load_SP_Parameters("@Visible", entity.Visible.ToString());
            DM.Load_SP_Parameters("@Commodity", entity.Commodity);
            DM.Load_SP_Parameters("@ContactCellPhoneNumber", entity.ContactCellPhone);

            idGenerated = DM.Execute_StoreProcedure_Scalar("SupplierMaster_NewSupplier", true);
        }
        catch (Exception e)
        {
            return "";
        }

        return idGenerated;
    }
    public Supplier readById(long id)
    {
        Supplier supplier = new Supplier();
        
        string query = "SELECT SupplierMasterKey, SupplierName, ManufacturingLocation, " + 
            "ShipLocation, QuotedCurrency, ContactName, ContactPhoneNumber, ContactEmail, " +
            "Capabilities, Comments, Visible, Commodity, ContactCellPhoneNumber " +
            "FROM SupplierMaster WHERE SupplierMasterKey=@key";
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
                supplier.Capabilities = table.Rows[0][8].ToString();
                supplier.Comments = table.Rows[0][9].ToString();
                supplier.Visible = bool.Parse(table.Rows[0][10].ToString());
                supplier.Commodity = table.Rows[0][11].ToString();
                supplier.ContactCellPhone = table.Rows[0][12].ToString();

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
        
        string query = "SELECT SupplierMasterKey, SupplierName, ManufacturingLocation, " +
            "ShipLocation, QuotedCurrency, ContactName, ContactPhoneNumber, ContactEmail, " +
            "Capabilities, Comments, Visible, Commodity, ContactCellPhoneNumber " +
            "FROM SupplierMaster ORDER BY SupplierName";
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
            supplier.Capabilities = table.Rows[i][8].ToString();
            supplier.Comments = table.Rows[i][9].ToString();
            supplier.Visible = bool.Parse(table.Rows[i][10].ToString());
            supplier.Commodity = table.Rows[i][11].ToString();
            supplier.ContactCellPhone = table.Rows[i][12].ToString();
            recordset.Add(supplier);
        }
       
        return recordset;
    }

    public bool update(Supplier entity)
    {

        bool result = false;        
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SupplierKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@SupplierName", entity.SupplierName);
            DM.Load_SP_Parameters("@ContactName", entity.ContactName);
            DM.Load_SP_Parameters("@ContactPhoneNumber", entity.ContactPhone);
            DM.Load_SP_Parameters("@ContactEmail", entity.ContactEmail);
            DM.Load_SP_Parameters("@ManufacturingLocation", entity.ManufacturingLocation);
            DM.Load_SP_Parameters("@ShipLocation", entity.ShipLocation);
            DM.Load_SP_Parameters("@QuotedCurrency", entity.QuotedCurrency);
            DM.Load_SP_Parameters("@Capabilities", entity.Capabilities);
            DM.Load_SP_Parameters("@Comments", entity.Comments);
            DM.Load_SP_Parameters("@Visible", entity.Visible.ToString());
            DM.Load_SP_Parameters("@Commodity", entity.Commodity);
            DM.Load_SP_Parameters("@ContactCellPhoneNumber", entity.ContactCellPhone);

            result = DM.Execute_StoreProcedure("SupplierMaster_EditSupplier", true);
        }
        catch (Exception e)
        {
            return false;
        }

        return result;
    }
    public bool delete(long id)
    {
        int rowsAffected=0;
        string query = "DELETE FROM SupplierMaster WHERE SupplierMasterKey=@key";
        SqlConnection sqlConnection = connectionManager.getConnection();
        SqlCommand sqlCommand = null;
        if (sqlConnection != null)
        {
            try
            {
                sqlCommand = new SqlCommand(query, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@key", id);
                sqlConnection.Open();
                rowsAffected = sqlCommand.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    return true;
                }
            }
            catch (Exception e)
            {
                //using return false below
            }
            finally
            {
                sqlConnection.Dispose();
                sqlCommand.Dispose();               
            }           
        }
        return false;
    }

    #endregion
}
