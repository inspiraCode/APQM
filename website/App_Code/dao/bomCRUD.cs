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
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifID.ToString());
            DM.Load_SP_Parameters("@TopPartNumber", entity.TopPartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.PartDescription);
            DM.Load_SP_Parameters("@Revision", entity.Revision);

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
                    bom.SifID = long.Parse(table.Rows[0][1].ToString());
                }
                else
                {
                    bom.SifID = -1;
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

        string query = "SELECT BOMHeaderKey, SIFHeaderKey, TopPartNumber, PartDescription, Revision FROM BOMHeader ORDER BY PartDescription";
        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
       
        for (int i = 0; i < table.Rows.Count; i++)
        {
            BOM bom = new BOM();
            bom.Id = long.Parse(table.Rows[0][0].ToString());
            bom.SifID = (long)table.Rows[0][1];
            bom.TopPartNumber = table.Rows[0][2].ToString();
            bom.PartDescription = table.Rows[0][3].ToString();
            bom.Revision = table.Rows[0][4].ToString();

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
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifID.ToString());
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
