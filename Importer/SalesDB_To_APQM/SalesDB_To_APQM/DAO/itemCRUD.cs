using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using SalesDB_To_APQM;

/// <summary>
/// Class for working with database for Item Master
/// </summary>
public class itemCRUD : ICRUD<Item>
{
   
    ConnectionManager connectionManager = new ConnectionManager();    
    Data_Base_MNG.SQL DM;

    public itemCRUD()
	{}
    
    #region ICRUD<Item> Members

    public bool create(Item entity)
    {
        bool result = false;        
        DM = connectionManager.getDataManager();       
        try
        {            
            DM.Load_SP_Parameters("@PartNumber", entity.PartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.Description);
            DM.Load_SP_Parameters("@UM", entity.Um);
            DM.Load_SP_Parameters("@PartMaterial", entity.Material);

            result = DM.Execute_StoreProcedure("ItemMaster_NewItem", true);
        }
        catch (Exception e)
        {
            return false;
        }       

        return result;
    }

    public string createAndReturnIdGenerated(Item entity)
    {
        string idGenerated = "";
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@PartNumber", entity.PartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.Description);
            DM.Load_SP_Parameters("@UM", entity.Um);
            DM.Load_SP_Parameters("@PartMaterial", entity.Material);

            idGenerated = DM.Execute_StoreProcedure_Scalar("ItemMaster_NewItem", true);
        }
        catch (Exception e)
        {
            return "";
        }

        return idGenerated;
    }

    public Item readById(long id)
    {
        Item item = new Item();

        string query = "SELECT ItemMasterKey, PartNumber, Description, UM, Material " +
                        "FROM  ItemMaster WHERE (ItemMasterKey = @key)";
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key",id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if(table.Rows.Count > 0){
                item.Id = long.Parse(table.Rows[0][0].ToString());
                item.PartNumber = table.Rows[0][1].ToString();    
                item.Description= table.Rows[0][2].ToString();
                item.Um= table.Rows[0][3].ToString();
                item.Material= table.Rows[0][4].ToString();
                
                sqlConnection.Dispose();
                return item;
            }
        }
        return null;
    }

    public IList<Item> readAll()
    {
        List<Item>  recordset = new List<Item>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT ItemMasterKey, PartNumber, Description, UM, Material " +
                        "FROM  ItemMaster ORDER BY PartNumber";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
       
        for (int i = 0; i < table.Rows.Count; i++)
        {
            Item item = new Item();
            item.Id = long.Parse(table.Rows[i][0].ToString());
            item.PartNumber = table.Rows[i][1].ToString();
            item.Description = table.Rows[i][2].ToString();
            item.Um = table.Rows[i][3].ToString();
            item.Material = table.Rows[i][4].ToString();

            recordset.Add(item);
        }
       
        return recordset;
    }

    public bool update(Item entity)
    {

        bool result = false;        
        DM = connectionManager.getDataManager();
        try
        {            
            DM.Load_SP_Parameters("@PartNumber", entity.PartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.Description);
            DM.Load_SP_Parameters("@UM", entity.Um);
            DM.Load_SP_Parameters("@PartMaterial", entity.Material);

            result = DM.Execute_StoreProcedure("ItemMaster_EditItem", true);
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
        string query = "DELETE FROM ItemMaster WHERE ItemMasterKey=@key";
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

    public Item readByPartNumberInList(string name, List<Item> list)
    {
        foreach (Item item in list)
        {
            if (item.PartNumber.Trim() == name.Trim())
            {
                return item;
            }
        }
        return null;
    }
}
