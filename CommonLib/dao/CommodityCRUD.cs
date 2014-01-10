using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Class for working with database for Commodity Master
/// </summary>
public class CommodityCRUD : ICRUD<Commodity>
{
   
    ConnectionManager connectionManager = new ConnectionManager();    
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public CommodityCRUD()
	{}
    
    #region ICRUD<Commodity> Members

    public bool create(Commodity entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@CommodityCode", entity.CommodityCode);
            DM.Load_SP_Parameters("@Commodity", entity.CommidityName);

            result = DM.Execute_StoreProcedure("CommodityMaster_NewCommodity", true);

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

    public string createAndReturnIdGenerated(Commodity entity)
    {
        ErrorOccur = false;
        string idGenerated = "";
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@CommodityCode", entity.CommodityCode);
            DM.Load_SP_Parameters("@Commodity", entity.CommidityName);

            idGenerated = DM.Execute_StoreProcedure_Scalar("CommodityMaster_NewCommodity", true);

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


    public string createAndReturnIdGenerated(Commodity entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string idGenerated = "";
        try
        {
            DM.Load_SP_Parameters("@CommodityCode", entity.CommodityCode);
            DM.Load_SP_Parameters("@Commodity", entity.CommidityName);

            idGenerated = DM.Execute_StoreProcedure_Scalar_Open_Conn("CommodityMaster_NewCommodity", true);

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
    public Commodity readById(long id)
    {
        Commodity commodity = new Commodity();

        string query = "SELECT      CommodityKey, CommodityCode, Commodity " +
                        "FROM       CommodityMaster " +
                        "WHERE      (CommodityKey = @key)";
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key",id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if(table.Rows.Count > 0){
                commodity.Id = long.Parse(table.Rows[0][0].ToString());
                commodity.CommodityCode = table.Rows[0][1].ToString();
                commodity.CommidityName = table.Rows[0][2].ToString();
                
                sqlConnection.Dispose();
                return commodity;
            }
        }
        return null;
    }

    public IList<Commodity> readAll()
    {
        List<Commodity>  recordset = new List<Commodity>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT      CommodityKey, CommodityCode, Commodity " +
                        "FROM       CommodityMaster ORDER BY Commodity";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
       
        for (int i = 0; i < table.Rows.Count; i++)
        {
            Commodity commodity = new Commodity();
            commodity.Id = long.Parse(table.Rows[i][0].ToString());
            commodity.CommodityCode = table.Rows[i][1].ToString();
            commodity.CommidityName = table.Rows[i][2].ToString();

            recordset.Add(commodity);
        }
       
        return recordset;
    }

    public bool update(Commodity entity)
    {
        ErrorOccur = false;
        bool result = false;        
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@ItemMasterKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@CommodityCode", entity.CommodityCode);
            DM.Load_SP_Parameters("@Commodity", entity.CommidityName);

            result = DM.Execute_StoreProcedure("CommodityMaster_EditCommodity", true);

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
    public bool update(Commodity entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@ItemMasterKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@CommodityCode", entity.CommodityCode);
            DM.Load_SP_Parameters("@Commodity", entity.CommidityName);

            result = DM.Execute_StoreProcedure_Open_Conn("CommodityMaster_EditCommodity", true);

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
        string query = "DELETE FROM Commodity WHERE CommodityKey=@key";
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
                    ErrorMessage = "There were no rows affected for table: Commodity.";
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