using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Class for working with database for Customer Master
/// </summary>
public class customerCRUD : ICRUD<Customer>
{   
    ConnectionManager connectionManager = new ConnectionManager();    
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public customerCRUD()
	{}
    
    #region ICRUD<Customer> Members

    public bool create(Customer entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@CustomerName", entity.CustomerName);

            result = DM.Execute_StoreProcedure("CustomerMaster_NewCustomer", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }

    public string createAndReturnIdGenerated(Customer entity)
    {
        ErrorOccur = false;
        string idGenerated = "";
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@CustomerName", entity.CustomerName);
            
            idGenerated = DM.Execute_StoreProcedure_Scalar("CustomerMaster_NewCustomer", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return "";
        }
        return idGenerated;
    }
    public string createAndReturnIdGenerated(Customer entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string idGenerated = "";
        try
        {
            DM.Load_SP_Parameters("@CustomerName", entity.CustomerName);
            idGenerated = DM.Execute_StoreProcedure_Scalar_Open_Conn("CustomerMaster_NewCustomer", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return "";
        }

        return idGenerated;
    }

    public Customer readByNameInList(string name, List<Customer> list)
    {
        foreach(Customer customer in list){
            if (customer.CustomerName.Trim().ToLower() == name.Trim().ToLower())
            {                
                return customer;
            }
        }
        return null;
    }

    public Customer readById(long id)
    {
        Customer customer = new Customer();

        string query = "SELECT CustomerKey, CustomerName FROM CustomerMaster WHERE (CustomerKey = @key)";
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key",id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if(table.Rows.Count > 0){
                customer.Id = long.Parse(table.Rows[0][0].ToString());
                customer.CustomerName = table.Rows[0][1].ToString();                
                
                sqlConnection.Dispose();
                return customer;
            }
        }
        return null;
    }

    public IList<Customer> readAll()
    {
        List<Customer>  recordset = new List<Customer>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT CustomerKey, CustomerName FROM CustomerMaster ORDER BY CustomerName";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
       
        for (int i = 0; i < table.Rows.Count; i++)
        {
            Customer customer = new Customer();
            customer.Id = long.Parse(table.Rows[i][0].ToString());
            customer.CustomerName = table.Rows[i][1].ToString();

            recordset.Add(customer);
        }
       
        return recordset;
    }

    public bool update(Customer entity)
    {
        ErrorOccur = false;
        bool result = false;        
        DM = connectionManager.getDataManager();
        try
        {            
            DM.Load_SP_Parameters("@CustomerKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@CustomerName", entity.CustomerName);            

            result = DM.Execute_StoreProcedure("CustomerMaster_EditCustomer", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }
    public bool delete(long id)
    {
        ErrorOccur = false;
        int rowsAffected=0;
        string query = "DELETE FROM CustomerMaster WHERE CustomerKey=@key";
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
                else
                {
                    ErrorOccur = true;
                    ErrorMessage = "Error. There were no rows affected for table: Customer.";
                }
            }
            catch (Exception e)
            {
                ErrorOccur = true;
                ErrorMessage = e.Message;
                //using return false below
            }
            finally
            {
                sqlConnection.Dispose();
                sqlCommand.Dispose();
            }
        }
        else
        {
            ErrorOccur = true;
            ErrorMessage = "Error. Could not connect to database.";
        }
        return false;
    }

    #endregion
}