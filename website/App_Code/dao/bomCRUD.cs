using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Class for working with database for BOM.
/// </summary>
public class bomCRUD : ICRUD<BOM>
{
   
    ConnectionManager connectionManager = new ConnectionManager();    
    Data_Base_MNG.SQL DM;

    public bomCRUD()
	{}
    
    #region ICRUD<BOM> Members

    public bool create(BOM entity)
    {
        bool result = false;        
        DM = connectionManager.getDataManager();       
        try
        {            
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifId.ToString());
            if (entity.TopPartNumber != null)
            {
                DM.Load_SP_Parameters("@TopPartNumber", entity.TopPartNumber);
            }
            else
            {
                DM.Load_SP_Parameters("@TopPartNumber", "");
            }
            if (entity.PartDescription != null)
            {
                DM.Load_SP_Parameters("@PartDescription", entity.PartDescription);
            }
            else
            {
                DM.Load_SP_Parameters("@PartDescription", "");
            }
            if (entity.Revision != null)
            {
                DM.Load_SP_Parameters("@Revision", entity.Revision);
            }
            else
            {
                DM.Load_SP_Parameters("@Revision", "");
            }
           
            result = DM.Execute_StoreProcedure("BOMHeader_NewBOM", true);
        }
        catch (Exception e)
        {
            return false;
        }       

        return result;
    }

    public BOM readById(long id)
    {
        BOM bom = new BOM();

        string query = "SELECT BOMHeaderKey, SIFHeaderKey, TopPartNumber, PartDescription, Revision FROM BOMHeader WHERE (BOMHeaderKey = @key)";
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key",id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if(table.Rows.Count > 0){
                bom.Id = long.Parse(table.Rows[0][0].ToString());                
                if (table.Rows[0][1].ToString() != "")
                {
                    bom.SifId = long.Parse(table.Rows[0][1].ToString());
                }
                else
                {
                    bom.SifId = -1;
                }                
                bom.TopPartNumber = table.Rows[0][2].ToString();
                bom.PartDescription = table.Rows[0][3].ToString();
                bom.Revision = table.Rows[0][4].ToString();
                
                sqlConnection.Dispose();
                return bom;
            }
        }
        return null;
    }

    public IList<BOM> readAll()
    {
        List<BOM>  recordset = new List<BOM>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT BOMHeaderKey, SIFHeaderKey, TopPartNumber, PartDescription, Revision FROM view_BOMHeader_ReadAll ORDER BY PartDescription";
        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
       
        for (int i = 0; i < table.Rows.Count; i++)
        {
            BOM bom = new BOM();
            bom.Id = long.Parse(table.Rows[i][0].ToString());
            bom.SifId = long.Parse(table.Rows[i][1].ToString());
            bom.TopPartNumber = table.Rows[i][2].ToString();
            bom.PartDescription = table.Rows[i][3].ToString();
            bom.Revision = table.Rows[i][4].ToString();

            recordset.Add(bom);
        }
       
        return recordset;
    }

    public bool update(BOM entity)
    {

        bool result = false;        
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifId.ToString());
            DM.Load_SP_Parameters("@TopPartNumber", entity.TopPartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.PartDescription);
            DM.Load_SP_Parameters("@Revision", entity.Revision);

            result = DM.Execute_StoreProcedure("BOMHeader_EditBOM", true);
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
        string query = "DELETE FROM BOMHeader WHERE BOMHeaderKey=@key";
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

public class bomDetailCRUD : ICRUD<BOMDetail>
{

    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;

    public bomDetailCRUD()
    { }

    #region ICRUD<BOMDetail> Members

    public bool create(BOMDetail entity)
    {
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.BomHeaderKey.ToString());
            DM.Load_SP_Parameters("@ItemMasterKey", entity.ItemMasterkey.ToString());
            DM.Load_SP_Parameters("@Qty", entity.Qty.ToString());
            DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
            DM.Load_SP_Parameters("@Status", entity.Status);
            DM.Load_SP_Parameters("@Description", entity.Description);

            result = DM.Execute_StoreProcedure("BOMDetail_NewDetail", true);
        }
        catch (Exception e)
        {
            return false;
        }

        return result;
    }

    public BOMDetail readById(long id)
    {
        BOMDetail bomDetail = new BOMDetail();

        string query = "SELECT BOMDetailKey, BOMHeaderKey, ItemMasterKey, Qty, Cost, Status, Description " +
                        "FROM BOMDetail WHERE (BOMDetailKey = @key) ORDER BY BOMDetailKey";

        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if (table.Rows.Count > 0)
            {
                bomDetail.Id = long.Parse(table.Rows[0][0].ToString());
                if (table.Rows[0][1].ToString() != "")
                {
                    bomDetail.BomHeaderKey = long.Parse(table.Rows[0][1].ToString());
                }
                else
                {
                    bomDetail.BomHeaderKey = -1;
                }
                if (table.Rows[0][2].ToString() != "")
                {
                    bomDetail.ItemMasterkey = long.Parse(table.Rows[0][2].ToString());
                }
                else
                {
                    bomDetail.ItemMasterkey = -1;
                }
                if (table.Rows[0][3].ToString() != "")
                {
                    bomDetail.Qty = long.Parse(table.Rows[0][3].ToString());
                }
                else
                {
                    bomDetail.Qty = -1;
                }
                if (table.Rows[0][4].ToString() != "")
                {
                    bomDetail.Cost = long.Parse(table.Rows[0][4].ToString());
                }
                else
                {
                    bomDetail.Cost = -1;
                }
                bomDetail.Status = table.Rows[0][5].ToString();
                bomDetail.Description = table.Rows[0][6].ToString();

                sqlConnection.Dispose();
                return bomDetail;
            }
        }
        return null;
    }
    public List<BOMDetail> readByParentID(long id)
    {
        List<BOMDetail> recordset = new List<BOMDetail>();
        
        string query = "SELECT BOMDetailKey, BOMHeaderKey, ItemMasterKey, Qty, Cost, Status, Description " +
                        "FROM BOMDetail WHERE (BOMHeaderKey = @key) ORDER BY BOMDetailKey";

        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            for (int i = 0; i < table.Rows.Count; i++)
            {
                BOMDetail bomDetail = new BOMDetail();
                bomDetail.Id = long.Parse(table.Rows[i][0].ToString());
                if (table.Rows[i][1].ToString() != "")
                {
                    bomDetail.BomHeaderKey = long.Parse(table.Rows[i][1].ToString());
                }
                else
                {
                    bomDetail.BomHeaderKey = -1;
                }
                if (table.Rows[i][2].ToString() != "")
                {
                    bomDetail.ItemMasterkey = long.Parse(table.Rows[i][2].ToString());
                }
                else
                {
                    bomDetail.ItemMasterkey = -1;
                }
                if (table.Rows[i][3].ToString() != "")
                {
                    bomDetail.Qty = long.Parse(table.Rows[i][3].ToString());
                }
                else
                {
                    bomDetail.Qty = -1;
                }
                if (table.Rows[i][4].ToString() != "")
                {
                    bomDetail.Cost = long.Parse(table.Rows[i][4].ToString());
                }
                else
                {
                    bomDetail.Cost = -1;
                }
                bomDetail.Status = table.Rows[i][5].ToString();
                bomDetail.Description = table.Rows[i][6].ToString();

                recordset.Add(bomDetail);
            }
        }
        return recordset;
    }

    public IList<BOMDetail> readAll()
    {
        List<BOMDetail> recordset = new List<BOMDetail>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT BOMDetailKey, BOMHeaderKey, ItemMasterKey, Qty, Cost, Status, Description " +
                        "FROM BOMDetail ORDER BY BOMDetailKey";
        DataTable table = new DataTable();
        table = DM.Execute_Query(query);

        for (int i = 0; i < table.Rows.Count; i++)
        {
            BOMDetail bomDetail = new BOMDetail();
            bomDetail.Id = long.Parse(table.Rows[0][0].ToString());
            if (table.Rows[0][1].ToString() != "")
            {
                bomDetail.BomHeaderKey = long.Parse(table.Rows[0][1].ToString());
            }
            else
            {
                bomDetail.BomHeaderKey = -1;
            }
            if (table.Rows[0][2].ToString() != "")
            {
                bomDetail.ItemMasterkey = long.Parse(table.Rows[0][2].ToString());
            }
            else
            {
                bomDetail.ItemMasterkey = -1;
            }
            if (table.Rows[0][3].ToString() != "")
            {
                bomDetail.Qty = long.Parse(table.Rows[0][3].ToString());
            }
            else
            {
                bomDetail.Qty = -1;
            }
            if (table.Rows[0][4].ToString() != "")
            {
                bomDetail.Cost = long.Parse(table.Rows[0][4].ToString());
            }
            else
            {
                bomDetail.Cost = -1;
            }
            bomDetail.Status = table.Rows[0][5].ToString();
            bomDetail.Description = table.Rows[0][6].ToString();

            recordset.Add(bomDetail);
        }

        return recordset;
    }

    public bool update(BOMDetail entity)
    {

        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@BOMDetailKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.BomHeaderKey.ToString());
            DM.Load_SP_Parameters("@ItemMasterKey", entity.ItemMasterkey.ToString());
            DM.Load_SP_Parameters("@Qty", entity.Qty.ToString());
            DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
            DM.Load_SP_Parameters("@Status", entity.Status);
            DM.Load_SP_Parameters("@Description", entity.Description);

            result = DM.Execute_StoreProcedure("BOMDetail_EditDetail", true);
        }
        catch (Exception e)
        {
            return false;
        }

        return result;
    }
    public bool delete(long id)
    {
        int rowsAffected = 0;
        string query = "DELETE FROM BOMDetail WHERE BOMDetailKey=@key";
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
