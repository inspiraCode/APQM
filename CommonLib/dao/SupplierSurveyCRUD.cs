using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class SupplierSurveyCRUD : ICRUD<SupplierSurvey>
{
   
    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public SupplierSurveyCRUD()
	{}
    
    #region ICRUD<SupplierSurvey> Members

    public string createAndReturnIdGenerated(SupplierSurvey entity)
    {
        ErrorOccur = false;
        string result = "";
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SupplierMasterKey", entity.SupplierMasterKey.ToString());
            DM.Load_SP_Parameters("@StreetAddress", entity.StreetAddress);
            DM.Load_SP_Parameters("@City", entity.City);
            DM.Load_SP_Parameters("@State", entity.State);
            DM.Load_SP_Parameters("@ZipCode", entity.ZipCode);
            DM.Load_SP_Parameters("@WebSite", entity.Website);
            DM.Load_SP_Parameters("@SentToVendor", entity.SentToVendor.ToString());
            DM.Load_SP_Parameters("@LastSurvey", entity.LastSurvey.ToString());
            DM.Load_SP_Parameters("@NDARec", entity.NDARec.ToString());
            DM.Load_SP_Parameters("@PrimaryBusiness", entity.PrimaryBusiness);
            DM.Load_SP_Parameters("@SecundaryBusiness", entity.SecundaryBusiness);
            DM.Load_SP_Parameters("@UnionYN", entity.UnionYN.ToString());
            DM.Load_SP_Parameters("@Local", entity.Local);
            DM.Load_SP_Parameters("@ContractExpiration", entity.ContractExpiration);
            DM.Load_SP_Parameters("@CurrentCapacity", entity.CurrentCapacity);
            DM.Load_SP_Parameters("@ManufacturingMetod", entity.ManufacturingMetod);
            DM.Load_SP_Parameters("@ToolingNewInHouseYN", entity.ToolingNewInHouseYN.ToString());
            DM.Load_SP_Parameters("@ToolingNewOutsourcedYN", entity.ToolingNewOutsourcedYN.ToString());
            DM.Load_SP_Parameters("@ToolingInHouseYN", entity.ToolingInHouseYN.ToString());
            DM.Load_SP_Parameters("@ToolingOutsourcedYN", entity.ToolingOutsourcedYN.ToString());
            DM.Load_SP_Parameters("@Notes", entity.Notes);

            result = DM.Execute_StoreProcedure_Scalar("SupplierSurvey_NewSurvey", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return "";
        }

        return result;
    }

    public string createAndReturnIdGenerated(SupplierSurvey entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string result = "";
        try
        {
            DM.Load_SP_Parameters("@SupplierMasterKey", entity.SupplierMasterKey.ToString());
            DM.Load_SP_Parameters("@StreetAddress", entity.StreetAddress);
            DM.Load_SP_Parameters("@City", entity.City);
            DM.Load_SP_Parameters("@State", entity.State);
            DM.Load_SP_Parameters("@ZipCode", entity.ZipCode);
            DM.Load_SP_Parameters("@WebSite", entity.Website);
            DM.Load_SP_Parameters("@SentToVendor", entity.SentToVendor.ToString());
            DM.Load_SP_Parameters("@LastSurvey", entity.LastSurvey.ToString());
            DM.Load_SP_Parameters("@NDARec", entity.NDARec.ToString());
            DM.Load_SP_Parameters("@PrimaryBusiness", entity.PrimaryBusiness);
            DM.Load_SP_Parameters("@SecundaryBusiness", entity.SecundaryBusiness);
            DM.Load_SP_Parameters("@UnionYN", entity.UnionYN.ToString());
            DM.Load_SP_Parameters("@Local", entity.Local);
            DM.Load_SP_Parameters("@ContractExpiration", entity.ContractExpiration);
            DM.Load_SP_Parameters("@CurrentCapacity", entity.CurrentCapacity);
            DM.Load_SP_Parameters("@ManufacturingMetod", entity.ManufacturingMetod);
            DM.Load_SP_Parameters("@ToolingNewInHouseYN", entity.ToolingNewInHouseYN.ToString());
            DM.Load_SP_Parameters("@ToolingNewOutsourcedYN", entity.ToolingNewOutsourcedYN.ToString());
            DM.Load_SP_Parameters("@ToolingInHouseYN", entity.ToolingInHouseYN.ToString());
            DM.Load_SP_Parameters("@ToolingOutsourcedYN", entity.ToolingOutsourcedYN.ToString());
            DM.Load_SP_Parameters("@Notes", entity.Notes);

            result = DM.Execute_StoreProcedure_Scalar_Open_Conn("SupplierSurvey_NewSurvey", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return "";
        }

        return result;
    }

    public bool create(SupplierSurvey entity)
    {
        ErrorOccur = false;
        bool result = false;        
        DM = connectionManager.getDataManager();
        try
        {            
            DM.Load_SP_Parameters("@SupplierMasterKey", entity.SupplierMasterKey.ToString());
            DM.Load_SP_Parameters("@StreetAddress", entity.StreetAddress);
            DM.Load_SP_Parameters("@City", entity.City);
            DM.Load_SP_Parameters("@State", entity.State);
            DM.Load_SP_Parameters("@ZipCode", entity.ZipCode);
            DM.Load_SP_Parameters("@WebSite", entity.Website);
            DM.Load_SP_Parameters("@SentToVendor", entity.SentToVendor.ToString());
            DM.Load_SP_Parameters("@LastSurvey", entity.LastSurvey.ToString());
            DM.Load_SP_Parameters("@NDARec", entity.NDARec.ToString());
            DM.Load_SP_Parameters("@PrimaryBusiness", entity.PrimaryBusiness);
            DM.Load_SP_Parameters("@SecundaryBusiness", entity.SecundaryBusiness);
            DM.Load_SP_Parameters("@UnionYN", entity.UnionYN.ToString());
            DM.Load_SP_Parameters("@Local", entity.Local);
            DM.Load_SP_Parameters("@ContractExpiration", entity.ContractExpiration);
            DM.Load_SP_Parameters("@CurrentCapacity", entity.CurrentCapacity);
            DM.Load_SP_Parameters("@ManufacturingMetod", entity.ManufacturingMetod);
            DM.Load_SP_Parameters("@ToolingNewInHouseYN", entity.ToolingNewInHouseYN.ToString());
            DM.Load_SP_Parameters("@ToolingNewOutsourcedYN", entity.ToolingNewOutsourcedYN.ToString());
            DM.Load_SP_Parameters("@ToolingInHouseYN", entity.ToolingInHouseYN.ToString());
            DM.Load_SP_Parameters("@ToolingOutsourcedYN", entity.ToolingOutsourcedYN.ToString());
            DM.Load_SP_Parameters("@Notes", entity.Notes);

            result = DM.Execute_StoreProcedure("SupplierSurvey_NewSurvey", true);

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

    public bool create(SupplierSurvey entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@SupplierMasterKey", entity.SupplierMasterKey.ToString());
            DM.Load_SP_Parameters("@StreetAddress", entity.StreetAddress);
            DM.Load_SP_Parameters("@City", entity.City);
            DM.Load_SP_Parameters("@State", entity.State);
            DM.Load_SP_Parameters("@ZipCode", entity.ZipCode);
            DM.Load_SP_Parameters("@WebSite", entity.Website);
            DM.Load_SP_Parameters("@SentToVendor", entity.SentToVendor.ToString());
            DM.Load_SP_Parameters("@LastSurvey", entity.LastSurvey.ToString());
            DM.Load_SP_Parameters("@NDARec", entity.NDARec.ToString());
            DM.Load_SP_Parameters("@PrimaryBusiness", entity.PrimaryBusiness);
            DM.Load_SP_Parameters("@SecundaryBusiness", entity.SecundaryBusiness);
            DM.Load_SP_Parameters("@UnionYN", entity.UnionYN.ToString());
            DM.Load_SP_Parameters("@Local", entity.Local);
            DM.Load_SP_Parameters("@ContractExpiration", entity.ContractExpiration);
            DM.Load_SP_Parameters("@CurrentCapacity", entity.CurrentCapacity);
            DM.Load_SP_Parameters("@ManufacturingMetod", entity.ManufacturingMetod);
            DM.Load_SP_Parameters("@ToolingNewInHouseYN", entity.ToolingNewInHouseYN.ToString());
            DM.Load_SP_Parameters("@ToolingNewOutsourcedYN", entity.ToolingNewOutsourcedYN.ToString());
            DM.Load_SP_Parameters("@ToolingInHouseYN", entity.ToolingInHouseYN.ToString());
            DM.Load_SP_Parameters("@ToolingOutsourcedYN", entity.ToolingOutsourcedYN.ToString());
            DM.Load_SP_Parameters("@Notes", entity.Notes);

            result = DM.Execute_StoreProcedure_Open_Conn("SupplierSurvey_NewSurvey", true);

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

    public SupplierSurvey readById(long id)
    {
        SupplierSurvey supplierSurvey = new SupplierSurvey();
        
        string query =  "SELECT SupplierSuveyKey, SupplierMasterKey, StreetAddress, City, State, ZipCode, Website, LastSurvey, NDARec, PrimaryBusiness, SecundaryBusiness, UnionYN, Local, " +
                        "ContractExpiration, CurrentCapacity, ManufacturingMetod, ToolingNewInHouseYN, ToolingNewOutsourcedYN, ToolingInHouseYN, ToolingOutsourcedYN, Notes, SentToVendor " +
                        "FROM SupplierSuvey WHERE (SupplierSuveyKey = @key)";
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key",id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if(table.Rows.Count > 0){              
                supplierSurvey.Id = long.Parse(table.Rows[0][0].ToString());
                supplierSurvey.SupplierMasterKey = long.Parse(table.Rows[0][1].ToString());
                supplierSurvey.StreetAddress = table.Rows[0][2].ToString();
                supplierSurvey.City = table.Rows[0][3].ToString();
                supplierSurvey.State= table.Rows[0][4].ToString();
                supplierSurvey.ZipCode= table.Rows[0][5].ToString();
                supplierSurvey.Website= table.Rows[0][6].ToString();
                supplierSurvey.LastSurvey= DateTime.Parse(table.Rows[0][7].ToString());
                supplierSurvey.NDARec = DateTime.Parse( table.Rows[0][8].ToString());
                supplierSurvey.PrimaryBusiness= table.Rows[0][9].ToString();
                supplierSurvey.SecundaryBusiness= table.Rows[0][10].ToString();
                supplierSurvey.UnionYN= bool.Parse(table.Rows[0][11].ToString());
                supplierSurvey.Local= table.Rows[0][12].ToString();
                supplierSurvey.ContractExpiration= table.Rows[0][13].ToString();
                supplierSurvey.CurrentCapacity = table.Rows[0][14].ToString();
                supplierSurvey.ManufacturingMetod = table.Rows[0][15].ToString();
                supplierSurvey.ToolingNewInHouseYN = bool.Parse(table.Rows[0][16].ToString());
                supplierSurvey.ToolingNewOutsourcedYN = bool.Parse(table.Rows[0][17].ToString());
                supplierSurvey.ToolingInHouseYN = bool.Parse(table.Rows[0][18].ToString());
                supplierSurvey.ToolingOutsourcedYN = bool.Parse(table.Rows[0][19].ToString());
                supplierSurvey.Notes = table.Rows[0][20].ToString();
                supplierSurvey.SentToVendor = DateTime.Parse(table.Rows[0][21].ToString());

                sqlConnection.Dispose();
                return supplierSurvey;
            }
        }
        return null;
    }

    public List<SupplierSurvey> readByParentId(long id)
    {
        List<SupplierSurvey> recordset = new List<SupplierSurvey>();
        recordset.Clear();
        DM = connectionManager.getDataManager();
        string query = "SELECT SupplierSuveyKey, SupplierMasterKey, StreetAddress, City, State, ZipCode, Website, LastSurvey, NDARec, PrimaryBusiness, SecundaryBusiness, UnionYN, Local, " +
                        "ContractExpiration, CurrentCapacity, ManufacturingMetod, ToolingNewInHouseYN, ToolingNewOutsourcedYN, ToolingInHouseYN, ToolingOutsourcedYN, Notes, SentToVendor " +
                        "FROM SupplierSuvey WHERE (SupplierMasterKey = @key) ORDER BY LastSurvey DESC";

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
                SupplierSurvey supplierSurvey = new SupplierSurvey();
                supplierSurvey.Id = long.Parse(table.Rows[i][0].ToString());
                supplierSurvey.SupplierMasterKey = long.Parse(table.Rows[i][1].ToString());
                supplierSurvey.StreetAddress = table.Rows[i][2].ToString();
                supplierSurvey.City = table.Rows[i][3].ToString();
                supplierSurvey.State = table.Rows[i][4].ToString();
                supplierSurvey.ZipCode = table.Rows[i][5].ToString();
                supplierSurvey.Website = table.Rows[i][6].ToString();
                supplierSurvey.LastSurvey = DateTime.Parse(table.Rows[i][7].ToString());
                supplierSurvey.NDARec = DateTime.Parse(table.Rows[i][8].ToString());
                supplierSurvey.PrimaryBusiness = table.Rows[i][9].ToString();
                supplierSurvey.SecundaryBusiness = table.Rows[i][10].ToString();
                supplierSurvey.UnionYN = bool.Parse(table.Rows[i][11].ToString());
                supplierSurvey.Local = table.Rows[i][12].ToString();
                supplierSurvey.ContractExpiration = table.Rows[i][13].ToString();
                supplierSurvey.CurrentCapacity = table.Rows[i][14].ToString();
                supplierSurvey.ManufacturingMetod = table.Rows[i][15].ToString();
                supplierSurvey.ToolingNewInHouseYN = bool.Parse(table.Rows[i][16].ToString());
                supplierSurvey.ToolingNewOutsourcedYN = bool.Parse(table.Rows[i][17].ToString());
                supplierSurvey.ToolingInHouseYN = bool.Parse(table.Rows[i][18].ToString());
                supplierSurvey.ToolingOutsourcedYN = bool.Parse(table.Rows[i][19].ToString());
                supplierSurvey.Notes = table.Rows[i][20].ToString();
                supplierSurvey.SentToVendor = DateTime.Parse(table.Rows[i][21].ToString());
                recordset.Add(supplierSurvey);
            }
        }

        return recordset;
    }

    public IList<SupplierSurvey> readAll()
    {
        List<SupplierSurvey> recordset = new List<SupplierSurvey>();
        recordset.Clear();
        DM = connectionManager.getDataManager();
        
        string query =  "SELECT SupplierSuveyKey, SupplierMasterKey, StreetAddress, City, State, ZipCode, Website, LastSurvey, NDARec, PrimaryBusiness, SecundaryBusiness, UnionYN, Local, " +
                        "ContractExpiration, CurrentCapacity, ManufacturingMetod, ToolingNewInHouseYN, ToolingNewOutsourcedYN, ToolingInHouseYN, ToolingOutsourcedYN, Notes, SentToVendor " +
                        "FROM SupplierSuvey ORDER BY LastSurvey DESC";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
       
        for (int i = 0; i < table.Rows.Count; i++)
        {
            SupplierSurvey supplierSurvey = new SupplierSurvey();
            supplierSurvey.Id = long.Parse(table.Rows[i][0].ToString());
            supplierSurvey.SupplierMasterKey = long.Parse(table.Rows[i][1].ToString());
            supplierSurvey.StreetAddress = table.Rows[i][2].ToString();
            supplierSurvey.City = table.Rows[i][3].ToString();
            supplierSurvey.State = table.Rows[i][4].ToString();
            supplierSurvey.ZipCode = table.Rows[i][5].ToString();
            supplierSurvey.Website = table.Rows[i][6].ToString();
            supplierSurvey.LastSurvey = DateTime.Parse(table.Rows[i][7].ToString());
            supplierSurvey.NDARec = DateTime.Parse(table.Rows[i][8].ToString());
            supplierSurvey.PrimaryBusiness = table.Rows[i][9].ToString();
            supplierSurvey.SecundaryBusiness = table.Rows[i][10].ToString();
            supplierSurvey.UnionYN = bool.Parse(table.Rows[i][11].ToString());
            supplierSurvey.Local = table.Rows[i][12].ToString();
            supplierSurvey.ContractExpiration = table.Rows[i][13].ToString();
            supplierSurvey.CurrentCapacity = table.Rows[i][14].ToString();
            supplierSurvey.ManufacturingMetod = table.Rows[i][15].ToString();
            supplierSurvey.ToolingNewInHouseYN = bool.Parse(table.Rows[i][16].ToString());
            supplierSurvey.ToolingNewOutsourcedYN = bool.Parse(table.Rows[i][17].ToString());
            supplierSurvey.ToolingInHouseYN = bool.Parse(table.Rows[i][18].ToString());
            supplierSurvey.ToolingOutsourcedYN = bool.Parse(table.Rows[i][19].ToString());
            supplierSurvey.Notes = table.Rows[i][20].ToString();
            supplierSurvey.SentToVendor = DateTime.Parse(table.Rows[i][21].ToString());
            recordset.Add(supplierSurvey);
        }       
        return recordset;
    }
    public bool update(SupplierSurvey entity)
    {
        ErrorOccur = false;
        bool result = false;        
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SupplierSuveyKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@SupplierMasterKey", entity.SupplierMasterKey.ToString());
            DM.Load_SP_Parameters("@StreetAddress", entity.StreetAddress);
            DM.Load_SP_Parameters("@City", entity.City);
            DM.Load_SP_Parameters("@State", entity.State);
            DM.Load_SP_Parameters("@ZipCode", entity.ZipCode);
            DM.Load_SP_Parameters("@WebSite", entity.Website);            
            DM.Load_SP_Parameters("@LastSurvey", entity.LastSurvey.ToString());
            DM.Load_SP_Parameters("@NDARec", entity.NDARec.ToString());
            DM.Load_SP_Parameters("@PrimaryBusiness", entity.PrimaryBusiness);
            DM.Load_SP_Parameters("@SecundaryBusiness", entity.SecundaryBusiness);
            DM.Load_SP_Parameters("@UnionYN", entity.UnionYN.ToString());
            DM.Load_SP_Parameters("@Local", entity.Local);
            DM.Load_SP_Parameters("@ContractExpiration", entity.ContractExpiration);
            DM.Load_SP_Parameters("@CurrentCapacity", entity.CurrentCapacity);
            DM.Load_SP_Parameters("@ManufacturingMetod", entity.ManufacturingMetod);
            DM.Load_SP_Parameters("@ToolingNewInHouseYN", entity.ToolingNewInHouseYN.ToString());
            DM.Load_SP_Parameters("@ToolingNewOutsourcedYN", entity.ToolingNewOutsourcedYN.ToString());
            DM.Load_SP_Parameters("@ToolingInHouseYN", entity.ToolingInHouseYN.ToString());
            DM.Load_SP_Parameters("@ToolingOutsourcedYN", entity.ToolingOutsourcedYN.ToString());
            DM.Load_SP_Parameters("@Notes", entity.Notes);

            result = DM.Execute_StoreProcedure("SupplierSurvey_EditSurvey", true);

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

    public bool update(SupplierSurvey entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@SupplierSuveyKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@SupplierMasterKey", entity.SupplierMasterKey.ToString());
            DM.Load_SP_Parameters("@StreetAddress", entity.StreetAddress);
            DM.Load_SP_Parameters("@City", entity.City);
            DM.Load_SP_Parameters("@State", entity.State);
            DM.Load_SP_Parameters("@ZipCode", entity.ZipCode);
            DM.Load_SP_Parameters("@WebSite", entity.Website);
            DM.Load_SP_Parameters("@LastSurvey", entity.LastSurvey.ToString());
            DM.Load_SP_Parameters("@NDARec", entity.NDARec.ToString());
            DM.Load_SP_Parameters("@PrimaryBusiness", entity.PrimaryBusiness);
            DM.Load_SP_Parameters("@SecundaryBusiness", entity.SecundaryBusiness);
            DM.Load_SP_Parameters("@UnionYN", entity.UnionYN.ToString());
            DM.Load_SP_Parameters("@Local", entity.Local);
            DM.Load_SP_Parameters("@ContractExpiration", entity.ContractExpiration);
            DM.Load_SP_Parameters("@CurrentCapacity", entity.CurrentCapacity);
            DM.Load_SP_Parameters("@ManufacturingMetod", entity.ManufacturingMetod);
            DM.Load_SP_Parameters("@ToolingNewInHouseYN", entity.ToolingNewInHouseYN.ToString());
            DM.Load_SP_Parameters("@ToolingNewOutsourcedYN", entity.ToolingNewOutsourcedYN.ToString());
            DM.Load_SP_Parameters("@ToolingInHouseYN", entity.ToolingInHouseYN.ToString());
            DM.Load_SP_Parameters("@ToolingOutsourcedYN", entity.ToolingOutsourcedYN.ToString());
            DM.Load_SP_Parameters("@Notes", entity.Notes);

            result = DM.Execute_StoreProcedure_Open_Conn("SupplierSurvey_EditSurvey", true);

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
        string query = "DELETE FROM SupplierSuvey WHERE SupplierSuveyKey=@key";
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
                    ErrorMessage = "There were no rows affected for table: Supplier_Survey";
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

public class SupplierSurveyIndustriesCRUD : ICRUD<SupplierSurveyIndustriesSupplied>
{

    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public SupplierSurveyIndustriesCRUD()
    { }

    #region ICRUD<SupplierSurveyIndustriesSupplied> Members

    public bool create(SupplierSurveyIndustriesSupplied entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@IndustriesSuplied", entity.IndustriesSupplied.ToString());
            DM.Load_SP_Parameters("@SupplierSurveyKey", entity.SupplierSurveyKey.ToString());

            result = DM.Execute_StoreProcedure("SupplierSurveyIndustriesSupplied_NewIndustry", true);

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

    public bool create(SupplierSurveyIndustriesSupplied entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@IndustriesSuplied", entity.IndustriesSupplied.ToString());
            DM.Load_SP_Parameters("@SupplierSurveyKey", entity.SupplierSurveyKey.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("SupplierSurveyIndustriesSupplied_NewIndustry", true);

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

    public SupplierSurveyIndustriesSupplied readById(long id)
    {
        SupplierSurveyIndustriesSupplied industrieSupplied = new SupplierSurveyIndustriesSupplied();

        string query = "SELECT  SupplierIndustriesSuppliedKey, SupplierSurveyKey, IndustriesSuplied " +
                        "FROM  SupplierSurveyIndustriesSupplied WHERE (SupplierIndustriesSuppliedKey = @key)";
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
                industrieSupplied.Id = long.Parse(table.Rows[0][0].ToString());
                industrieSupplied.SupplierSurveyKey = long.Parse(table.Rows[0][1].ToString());
                industrieSupplied.IndustriesSupplied = table.Rows[0][2].ToString();

                sqlConnection.Dispose();
                return industrieSupplied;
            }
        }
        return null;
    }

    public List<SupplierSurveyIndustriesSupplied> readByParentId(long id)
    {
        List<SupplierSurveyIndustriesSupplied> recordset = new List<SupplierSurveyIndustriesSupplied>();
        recordset.Clear();
        DM = connectionManager.getDataManager();
        string query = "SELECT  SupplierIndustriesSuppliedKey, SupplierSurveyKey, IndustriesSuplied " +
                        "FROM  SupplierSurveyIndustriesSupplied WHERE (SupplierSurveyKey = @key) ORDER BY IndustriesSuplied ASC";

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
                SupplierSurveyIndustriesSupplied industrieSupplied = new SupplierSurveyIndustriesSupplied();
                industrieSupplied.Id = long.Parse(table.Rows[i][0].ToString());
                industrieSupplied.SupplierSurveyKey = long.Parse(table.Rows[i][1].ToString());
                industrieSupplied.IndustriesSupplied = table.Rows[i][2].ToString();

                recordset.Add(industrieSupplied);
            }
        }

        return recordset;
    }

    public IList<SupplierSurveyIndustriesSupplied> readAll()
    {
        List<SupplierSurveyIndustriesSupplied> recordset = new List<SupplierSurveyIndustriesSupplied>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT SupplierIndustriesSuppliedKey, SupplierSurveyKey, IndustriesSuplied " +
                        "FROM  SupplierSurveyIndustriesSupplied ORDER BY IndustriesSuplied";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);

        for (int i = 0; i < table.Rows.Count; i++)
        {
            SupplierSurveyIndustriesSupplied industrieSupplied = new SupplierSurveyIndustriesSupplied();
            industrieSupplied.Id = long.Parse(table.Rows[i][0].ToString());
            industrieSupplied.SupplierSurveyKey = long.Parse(table.Rows[i][1].ToString());
            industrieSupplied.IndustriesSupplied = table.Rows[i][2].ToString();

            recordset.Add(industrieSupplied);
        }

        return recordset;
    }

    public bool update(SupplierSurveyIndustriesSupplied entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SupplierIndustriesSuppliedKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@IndustriesSuplied", entity.IndustriesSupplied.ToString());
            DM.Load_SP_Parameters("@SupplierSurveyKey", entity.SupplierSurveyKey.ToString());

            result = DM.Execute_StoreProcedure("SupplierSurveyIndustriesSupplied_EditIndustry", true);

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
        int rowsAffected = 0;
        string query = "DELETE FROM SupplierSurveyIndustriesSupplied WHERE SupplierIndustriesSuppliedKey=@key";
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
                    ErrorMessage = "There were no rows affected for table: Supplier_Survey_Industries_Supplied.";
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

    public bool deleteByParentId(long id)
    {
        ErrorOccur = false;
        int rowsAffected = 0;
        string query = "DELETE FROM SupplierSurveyIndustriesSupplied WHERE SupplierSurveyKey=@key";
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
                    ErrorMessage = "There were no rows affected for table: Supplier_Survey_Industries_Supplied.";
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

    public bool deleteByParentId(long id, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string query = "DELETE FROM SupplierSurveyIndustriesSupplied WHERE SupplierSurveyKey = " + id;
        if (DM.Execute_Command_Open_Connection(query))
        {
            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
            return true;
        } 
        ErrorOccur = DM.ErrorOccur;
        ErrorMessage = DM.Error_Mjs;
        return false;
    }
}

public class SupplierSurveyForecastSalesCRUD : ICRUD<SupplierSurveyForecastSales>
{

    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public SupplierSurveyForecastSalesCRUD()
    { }

    #region ICRUD<SupplierSurveyForecastSales> Members

    public bool create(SupplierSurveyForecastSales entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@ForecastSalesYear", entity.ForecastSalesYear.ToString());
            DM.Load_SP_Parameters("@ForecastSales", entity.ForecastSales.ToString());
            DM.Load_SP_Parameters("@SupplierSurveyKey", entity.SupplierSurveyKey.ToString());

            result = DM.Execute_StoreProcedure("SupplierSurveyForecastSales_NewForecast", true);

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

    public bool create(SupplierSurveyForecastSales entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@ForecastSalesYear", entity.ForecastSalesYear.ToString());
            DM.Load_SP_Parameters("@ForecastSales", entity.ForecastSales.ToString());
            DM.Load_SP_Parameters("@SupplierSurveyKey", entity.SupplierSurveyKey.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("SupplierSurveyForecastSales_NewForecast", true);

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

    public SupplierSurveyForecastSales readById(long id)
    {
        SupplierSurveyForecastSales forecastSales = new SupplierSurveyForecastSales();

        string query = "SELECT SurveyForecastedSalesKey, SupplierSurveyKey, ForecastSalesYear, ForecastSales " +
                        "FROM  SupplierSurveyForecastSales WHERE (SurveyForecastedSalesKey = @key)";

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
                forecastSales.Id = long.Parse(table.Rows[0][0].ToString());
                forecastSales.SupplierSurveyKey = long.Parse(table.Rows[0][1].ToString());
                forecastSales.ForecastSalesYear = table.Rows[0][2].ToString(); 
                forecastSales.ForecastSales = table.Rows[0][3].ToString();

                sqlConnection.Dispose();
                return forecastSales;
            }
        }
        return null;
    }

    public List<SupplierSurveyForecastSales> readByParentId(long id)
    {
        List<SupplierSurveyForecastSales> recordset = new List<SupplierSurveyForecastSales>();
        recordset.Clear();
        DM = connectionManager.getDataManager();
        string query = "SELECT SurveyForecastedSalesKey, SupplierSurveyKey, ForecastSalesYear, ForecastSales " +
                        "FROM  SupplierSurveyForecastSales WHERE (SupplierSurveyKey = @key) ORDER BY ForecastSalesYear DESC";

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
                SupplierSurveyForecastSales forecastSales = new SupplierSurveyForecastSales();
                forecastSales.Id = long.Parse(table.Rows[i][0].ToString());
                forecastSales.SupplierSurveyKey = long.Parse(table.Rows[i][1].ToString());
                forecastSales.ForecastSalesYear = table.Rows[i][2].ToString();
                forecastSales.ForecastSales = table.Rows[i][3].ToString();

                recordset.Add(forecastSales);
            }
        }

        return recordset;
    }

    public IList<SupplierSurveyForecastSales> readAll()
    {
        List<SupplierSurveyForecastSales> recordset = new List<SupplierSurveyForecastSales>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT SurveyForecastedSalesKey, SupplierSurveyKey, ForecastSalesYear, ForecastSales " +
                        "FROM  SupplierSurveyForecastSales ORDER BY ForecastSalesYear";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);

        for (int i = 0; i < table.Rows.Count; i++)
        {
            SupplierSurveyForecastSales forecastSales = new SupplierSurveyForecastSales();
            forecastSales.Id = long.Parse(table.Rows[i][0].ToString());
            forecastSales.SupplierSurveyKey = long.Parse(table.Rows[i][1].ToString());
            forecastSales.ForecastSalesYear = table.Rows[i][2].ToString();
            forecastSales.ForecastSales = table.Rows[i][3].ToString();

            recordset.Add(forecastSales);
        }

        return recordset;
    }

    public bool update(SupplierSurveyForecastSales entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SupplierForecastedSalesKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@SupplierSurveyKey", entity.SupplierSurveyKey.ToString());
            DM.Load_SP_Parameters("@ForecastSalesYear", entity.ForecastSalesYear.ToString());
            DM.Load_SP_Parameters("@ForecastSales", entity.ForecastSales.ToString());

            result = DM.Execute_StoreProcedure("SupplierSurveyForecastSales_EditForecast", true);

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
        int rowsAffected = 0;
        string query = "DELETE FROM SupplierSurveyForecastSales WHERE SurveyForecastedSalesKey=@key";
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
                    ErrorMessage = "There were no rows affected for table: Supplier_Survey_Forecast_Sales.";
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

    public bool deleteByParentId(long id)
    {
        ErrorOccur = false;
        int rowsAffected = 0;
        string query = "DELETE FROM SupplierSurveyForecastSales WHERE SupplierSurveyKey=@key";
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
                    ErrorMessage = "There were no rows affected for table: Supplier_Survey_Forecast_Sales.";
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

    public bool deleteByParentId(long id, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string query = "DELETE FROM SupplierSurveyForecastSales WHERE SupplierSurveyKey = " + id;
        if (DM.Execute_Command_Open_Connection(query))
        {
            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
            return true;
        }
        ErrorOccur = DM.ErrorOccur;
        ErrorMessage = DM.Error_Mjs;
        return false;
    }
}

public class SupplierSurveyContactsCRUD : ICRUD<SupplierSurveyContacts>
{

    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public SupplierSurveyContactsCRUD()
    { }

    #region ICRUD<SupplierSurveyContacts> Members

    public bool create(SupplierSurveyContacts entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SupplierSurveyKey", entity.SupplierSurveyKey.ToString());
            DM.Load_SP_Parameters("@Position", entity.Position.ToString());
            DM.Load_SP_Parameters("@Name", entity.Name.ToString());
            DM.Load_SP_Parameters("@Title", entity.Title.ToString());
            DM.Load_SP_Parameters("@Address", entity.Address.ToString());
            DM.Load_SP_Parameters("@Phone", entity.Phone.ToString());
            DM.Load_SP_Parameters("@Cell", entity.Cell.ToString());
            DM.Load_SP_Parameters("@Email", entity.Email.ToString());

            result = DM.Execute_StoreProcedure("SupplierSurveyContacts_NewContact", true);

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

    public bool create(SupplierSurveyContacts entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@SupplierSurveyKey", entity.SupplierSurveyKey.ToString());
            DM.Load_SP_Parameters("@Position", entity.Position.ToString());
            DM.Load_SP_Parameters("@Name", entity.Name.ToString());
            DM.Load_SP_Parameters("@Title", entity.Title.ToString());
            DM.Load_SP_Parameters("@Address", entity.Address.ToString());
            DM.Load_SP_Parameters("@Phone", entity.Phone.ToString());
            DM.Load_SP_Parameters("@Cell", entity.Cell.ToString());
            DM.Load_SP_Parameters("@Email", entity.Email.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("SupplierSurveyContacts_NewContact", true);

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

    public SupplierSurveyContacts readById(long id)
    {
        SupplierSurveyContacts contacts = new SupplierSurveyContacts();

        string query = "SELECT SupplierSuveryContactsKey, SupplierSurveyKey, Position, Name, Title, Address, Phone, Cell, Email " +
                       "FROM   SupplierSurveyContacts WHERE (SupplierSuveryContactsKey = @key)";

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
                contacts.Id = long.Parse(table.Rows[0][0].ToString());
                contacts.SupplierSurveyKey = long.Parse(table.Rows[0][1].ToString());
                contacts.Position = table.Rows[0][2].ToString();
                contacts.Name = table.Rows[0][3].ToString();
                contacts.Title = table.Rows[0][4].ToString();
                contacts.Address = table.Rows[0][5].ToString();
                contacts.Phone = table.Rows[0][6].ToString();
                contacts.Cell = table.Rows[0][7].ToString();
                contacts.Email = table.Rows[0][8].ToString();                

                sqlConnection.Dispose();
                return contacts;
            }
        }
        return null;
    }
    public List<SupplierSurveyContacts> readByParentId(long id)
    {
        List<SupplierSurveyContacts> recordset = new List<SupplierSurveyContacts>();
        recordset.Clear();
        DM = connectionManager.getDataManager();
        string query = "SELECT SupplierSuveryContactsKey, SupplierSurveyKey, Position, Name, Title, Address, Phone, Cell, Email " +
                       "FROM   SupplierSurveyContacts WHERE (SupplierSurveyKey = @key)";

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
                SupplierSurveyContacts contacts = new SupplierSurveyContacts();
                contacts.Id = long.Parse(table.Rows[i][0].ToString());
                contacts.SupplierSurveyKey = long.Parse(table.Rows[i][1].ToString());
                contacts.Position = table.Rows[i][2].ToString();
                contacts.Name= table.Rows[i][3].ToString();
                contacts.Title = table.Rows[i][4].ToString();
                contacts.Address = table.Rows[i][5].ToString();
                contacts.Phone = table.Rows[i][6].ToString();
                contacts.Cell = table.Rows[i][7].ToString();
                contacts.Email = table.Rows[i][8].ToString();

                recordset.Add(contacts);
            }
        }
        return recordset;
    }
    public IList<SupplierSurveyContacts> readAll()
    {
        //not required at this moment

        return null;
    }

    public bool update(SupplierSurveyContacts entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SupplierSuveryContactsKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@SupplierSurveyKey", entity.SupplierSurveyKey.ToString());
            DM.Load_SP_Parameters("@Position", entity.Position.ToString());
            DM.Load_SP_Parameters("@Name", entity.Name.ToString());
            DM.Load_SP_Parameters("@Title", entity.Title.ToString());
            DM.Load_SP_Parameters("@Address", entity.Address.ToString());
            DM.Load_SP_Parameters("@Phone", entity.Phone.ToString());
            DM.Load_SP_Parameters("@Cell", entity.Cell.ToString());
            DM.Load_SP_Parameters("@Email", entity.Email.ToString());

            result = DM.Execute_StoreProcedure("SupplierSurveyContacts_EditContact", true);

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
    public bool update(SupplierSurveyContacts entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@SupplierSuveryContactsKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@SupplierSurveyKey", entity.SupplierSurveyKey.ToString());
            DM.Load_SP_Parameters("@Position", entity.Position.ToString());
            DM.Load_SP_Parameters("@Name", entity.Name.ToString());
            DM.Load_SP_Parameters("@Title", entity.Title.ToString());
            DM.Load_SP_Parameters("@Address", entity.Address.ToString());
            DM.Load_SP_Parameters("@Phone", entity.Phone.ToString());
            DM.Load_SP_Parameters("@Cell", entity.Cell.ToString());
            DM.Load_SP_Parameters("@Email", entity.Email.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("SupplierSurveyContacts_EditContact", true);

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
        int rowsAffected = 0;
        string query = "DELETE FROM SupplierSurveyContacts WHERE SupplierSuveryContactsKey=@key";
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
                    ErrorMessage = "There were no rows affected for table: Supplier_Survey_Contacts.";
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

public class SupplierSurveyCertificationCRUD : ICRUD<SupplierSurveyCertification>
{

    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public SupplierSurveyCertificationCRUD()
    { }

    #region ICRUD<SupplierSurveyCertification> Members

    public bool create(SupplierSurveyCertification entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SupplierSurveyKey", entity.SupplierSurveyKey.ToString());
            DM.Load_SP_Parameters("@Certifications", entity.Certification.ToString());

            result = DM.Execute_StoreProcedure("SupplierSurveyCertification_NewCertification", true);

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

    public bool create(SupplierSurveyCertification entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@SupplierSurveyKey", entity.SupplierSurveyKey.ToString());
            DM.Load_SP_Parameters("@Certifications", entity.Certification.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("SupplierSurveyCertification_NewCertification", true);

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

    public SupplierSurveyCertification readById(long id)
    {
        SupplierSurveyCertification certification = new SupplierSurveyCertification();

        string query = "SELECT SupplierCertificationKey, SupplierSurveyKey, Certifications " +
                        "FROM  SupplierSurveyCertification WHERE (SupplierCertificationKey = @key)";

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
                certification.Id = long.Parse(table.Rows[0][0].ToString());
                certification.SupplierSurveyKey = long.Parse(table.Rows[0][1].ToString());
                certification.Certification = table.Rows[0][2].ToString();
                
                sqlConnection.Dispose();
                return certification;
            }
        }
        return null;
    }
    public List<SupplierSurveyCertification> readByParentId(long id)
    {
        List<SupplierSurveyCertification> recordset = new List<SupplierSurveyCertification>();
        recordset.Clear();
        DM = connectionManager.getDataManager();
        string query = "SELECT SupplierCertificationKey, SupplierSurveyKey, Certifications " +
                        "FROM  SupplierSurveyCertification WHERE (SupplierSurveyKey = @key) ORDER BY Certifications ASC";

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
                SupplierSurveyCertification certification = new SupplierSurveyCertification();
                certification.Id = long.Parse(table.Rows[i][0].ToString());
                certification.SupplierSurveyKey = long.Parse(table.Rows[i][1].ToString());
                certification.Certification = table.Rows[i][2].ToString();

                recordset.Add(certification);
            }
        }

        return recordset;
    }

    public IList<SupplierSurveyCertification> readAll()
    {
        List<SupplierSurveyCertification> recordset = new List<SupplierSurveyCertification>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT SupplierCertificationKey, SupplierSurveyKey, Certifications " +
                        "FROM  SupplierSurveyCertification ORDER BY Certifications";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);

        for (int i = 0; i < table.Rows.Count; i++)
        {
            SupplierSurveyCertification certification = new SupplierSurveyCertification();
            certification.Id = long.Parse(table.Rows[i][0].ToString());
            certification.SupplierSurveyKey = long.Parse(table.Rows[i][1].ToString());
            certification.Certification = table.Rows[i][2].ToString();

            recordset.Add(certification);
        }

        return recordset;
    }

    public bool update(SupplierSurveyCertification entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SupplierCertificationKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@SupplierSurveyKey", entity.SupplierSurveyKey.ToString());
            DM.Load_SP_Parameters("@Certifications", entity.Certification.ToString());

            result = DM.Execute_StoreProcedure("SupplierSurveyCertification_EditCertification", true);

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
        int rowsAffected = 0;
        string query = "DELETE FROM SupplierSurveyCertification WHERE SupplierCertificationKey=@key";
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
                    ErrorMessage = "There were no rows affected for table: Supplier_Survey_Certification.";
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
    public bool deleteByParentId(long id)
    {
        ErrorOccur = false;
        int rowsAffected = 0;
        string query = "DELETE FROM SupplierSurveyCertification WHERE SupplierSurveyKey=@key";
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
                    ErrorMessage = "There were no rows affected for table: Supplier_Survey_Certification.";
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
    public bool deleteByParentId(long id, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string query = "DELETE FROM SupplierSurveyCertification WHERE SupplierSurveyKey = " + id;
        if (DM.Execute_Command_Open_Connection(query))
        {
            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
            return true;
        }
        ErrorOccur = DM.ErrorOccur;
        ErrorMessage = DM.Error_Mjs;
        return false;
    }

    #endregion
}