using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;


public class MarketSectorCRUD: ICRUD<MarketSector>
{

ConnectionManager connectionManager = new ConnectionManager();    
Data_Base_MNG.SQL DM;

public MarketSectorCRUD()
{ }

#region ICRUD<MarketSector> Members

public bool create(MarketSector entity)
{
    bool result = false;
    DM = connectionManager.getDataManager();
    try
    {
        DM.Load_SP_Parameters("@Name", entity.Name);

        result = DM.Execute_StoreProcedure("MarketSector_NewMarket", true);
    }
    catch (Exception e)
    {
        return false;
    }

    return result;
}

public string createAndReturnIdGenerated(MarketSector entity)
{
    string idGenerated = "";
    DM = connectionManager.getDataManager();
    try
    {
        DM.Load_SP_Parameters("@Name", entity.Name);

        idGenerated = DM.Execute_StoreProcedure_Scalar("MarketSector_NewMarket", true);
    }
    catch (Exception e)
    {
        return "";
    }

    return idGenerated;
}

public string createAndReturnIdGenerated(MarketSector entity, ref Data_Base_MNG.SQL DM)
{
    string idGenerated = "";
    try
    {
        DM.Load_SP_Parameters("@Name", entity.Name);

        idGenerated = DM.Execute_StoreProcedure_Scalar_Open_Conn("MarketSector_NewMarket", true);
    }
    catch (Exception e)
    {
        return "";
    }

    return idGenerated;
}
public MarketSector readByNameInList(string name, List<MarketSector> list)
{
    foreach (MarketSector marketSector in list)
    {
        if (marketSector.Name.Trim() == name.Trim())
        {
            return marketSector;
        }
    }
    return null;
}
public MarketSector readById(long id)
{
    //MarketSector marketSector = new MarketSector();

    //string query = "SELECT ItemMasterKey, PartNumber, Description, UM, Material, Cost, " +
    //                "CapsonicPN, CustomerPN, ManufacturePN, SupplierPN, CommCode, EAU " +
    //                "FROM  ItemMaster WHERE (ItemMasterKey = @key)";
    //DataTable table = new DataTable();
    //SqlConnection sqlConnection = connectionManager.getConnection();
    //if (sqlConnection != null)
    //{
    //    SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
    //    sqlCommand.Parameters.AddWithValue("@key",id);
    //    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
    //    sqlDataAdapter.Fill(table);

    //    if(table.Rows.Count > 0){
    //        marketSector.Id = long.Parse(table.Rows[0][0].ToString());
    //        marketSector.PartNumber = table.Rows[0][1].ToString();    
    //        marketSector.Description= table.Rows[0][2].ToString();
    //        marketSector.Um= table.Rows[0][3].ToString();
    //        marketSector.Material= table.Rows[0][4].ToString();
    //        marketSector.Cost = float.Parse(table.Rows[0][5].ToString());
    //        marketSector.CapsonicPN = table.Rows[0][6].ToString();
    //        marketSector.CustomerPN = table.Rows[0][7].ToString();
    //        marketSector.ManufacturePN = table.Rows[0][8].ToString();
    //        marketSector.SupplierPN = table.Rows[0][9].ToString();
    //        marketSector.CommCode =table.Rows[0][10].ToString();
    //        marketSector.EAU = int.Parse(table.Rows[0][11].ToString());
            
    //        sqlConnection.Dispose();
    //        return marketSector;
    //    }
    //}
    return null;
}

public IList<MarketSector> readAll()
{
    List<MarketSector>  recordset = new List<MarketSector>();
    recordset.Clear();
    DM = connectionManager.getDataManager();

    string query = "SELECT MarketSectorID, Name " +
                    "FROM MarketSector " +
                    "ORDER BY Name";

    DataTable table = new DataTable();
    table = DM.Execute_Query(query);
   
    for (int i = 0; i < table.Rows.Count; i++)
    {
        MarketSector marketSector = new MarketSector();
        marketSector.Id = long.Parse(table.Rows[i][0].ToString());
        marketSector.Name = table.Rows[i][1].ToString();
       
        recordset.Add(marketSector);
    }
   
    return recordset;
}

public bool update(MarketSector entity)
{

    bool result = false;        
    DM = connectionManager.getDataManager();
    try
    {
        DM.Load_SP_Parameters("@MarketSectorID", entity.Id.ToString());
        DM.Load_SP_Parameters("@Name", entity.Name);

        result = DM.Execute_StoreProcedure("MarketSector_EditMarket", true);
    }
    catch (Exception e)
    {
        return false;
    }

    return result;
}
public bool update(MarketSector entity, ref Data_Base_MNG.SQL DM)
{

    bool result = false;
    try
    {
        DM.Load_SP_Parameters("@MarketSectorID", entity.Id.ToString());
        DM.Load_SP_Parameters("@Name", entity.Name);

        result = DM.Execute_StoreProcedure_Open_Conn("MarketSector_EditMarket", true);
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
    string query = "DELETE FROM MarketSector WHERE MarketSectorID=@key";
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