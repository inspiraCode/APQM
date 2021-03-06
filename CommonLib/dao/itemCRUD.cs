﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Class for working with database for Item Master
/// </summary>
public class itemCRUD : ICRUD<Item>
{
   
    ConnectionManager connectionManager = new ConnectionManager();    
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public itemCRUD()
	{}
    
    #region ICRUD<Item> Members

    public bool create(Item entity)
    {
        ErrorOccur = false;
        bool result = false;        
        DM = connectionManager.getDataManager();       
        try
        {            
            DM.Load_SP_Parameters("@PartNumber", entity.PartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.Description);
            DM.Load_SP_Parameters("@UM", entity.Um);
            DM.Load_SP_Parameters("@PartMaterial", entity.Material);
            DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
            DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
            DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
            DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
            DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
            DM.Load_SP_Parameters("@CommCode", entity.CommCode);
            //DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());

            result = DM.Execute_StoreProcedure("ItemMaster_NewItem", true);

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

    public string createAndReturnIdGenerated(Item entity)
    {
        ErrorOccur = false;
        string idGenerated = "";
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@PartNumber", entity.PartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.Description);
            DM.Load_SP_Parameters("@UM", entity.Um);
            DM.Load_SP_Parameters("@PartMaterial", entity.Material);
            DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
            DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
            DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
            DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
            DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
            DM.Load_SP_Parameters("@CommCode", entity.CommCode);
            //DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());

            idGenerated = DM.Execute_StoreProcedure_Scalar("ItemMaster_NewItem", true);

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


    public string createAndReturnIdGenerated(Item entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string idGenerated = "";
        try
        {
            DM.Load_SP_Parameters("@PartNumber", entity.PartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.Description);
            DM.Load_SP_Parameters("@UM", entity.Um);
            DM.Load_SP_Parameters("@PartMaterial", entity.Material);
            DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
            DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
            DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
            DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
            DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
            DM.Load_SP_Parameters("@CommCode", entity.CommCode);
            //DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());

            idGenerated = DM.Execute_StoreProcedure_Scalar_Open_Conn("ItemMaster_NewItem", true);

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
    public Item readById(long id)
    {
        Item item = new Item();

        string query = "SELECT ItemMasterKey, PartNumber, Description, UM, Material, Cost, " +
                        "CapsonicPN, CustomerPN, ManufacturePN, SupplierPN, CommCode " +
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
                item.Cost = float.Parse(table.Rows[0][5].ToString());
                item.CapsonicPN = table.Rows[0][6].ToString();
                item.CustomerPN = table.Rows[0][7].ToString();
                item.ManufacturePN = table.Rows[0][8].ToString();
                item.SupplierPN = table.Rows[0][9].ToString();
                item.CommCode =table.Rows[0][10].ToString();
                //item.EAU = int.Parse(table.Rows[0][11].ToString());
                
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

        string query = "SELECT ItemMasterKey, PartNumber, Description, UM, Material, Cost, " +
                        "CapsonicPN, CustomerPN, ManufacturePN, SupplierPN, CommCode " +  
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
            item.Cost = float.Parse(table.Rows[i][5].ToString());
            item.CapsonicPN = table.Rows[i][6].ToString();
            item.CustomerPN = table.Rows[i][7].ToString();
            item.ManufacturePN = table.Rows[i][8].ToString();
            item.SupplierPN = table.Rows[i][9].ToString();
            item.CommCode = table.Rows[i][10].ToString();
            //item.EAU = int.Parse(table.Rows[i][11].ToString());

            recordset.Add(item);
        }
       
        return recordset;
    }

    public bool update(Item entity)
    {
        ErrorOccur = false;
        bool result = false;        
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@ItemMasterKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@PartNumber", entity.PartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.Description);
            DM.Load_SP_Parameters("@UM", entity.Um);
            DM.Load_SP_Parameters("@PartMaterial", entity.Material);
            DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
            DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
            DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
            DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
            DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
            DM.Load_SP_Parameters("@CommCode", entity.CommCode);
            //DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());

            result = DM.Execute_StoreProcedure("ItemMaster_EditItem", true);

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
    public bool update(Item entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@ItemMasterKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@PartNumber", entity.PartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.Description);
            DM.Load_SP_Parameters("@UM", entity.Um);
            DM.Load_SP_Parameters("@PartMaterial", entity.Material);
            DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
            DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
            DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
            DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
            DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
            DM.Load_SP_Parameters("@CommCode", entity.CommCode);
            //DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("ItemMaster_EditItem", true);

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
                else
                {
                    ErrorOccur = true;
                    ErrorMessage = "There were no rows affected for table: Item.";
                    return true;
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
