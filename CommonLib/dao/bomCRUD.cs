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
    
    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public bomCRUD()
	{}
    
    #region ICRUD<BOM> Members

    public bool create(BOM entity)
    {
        ErrorOccur = false;
        bool result = false;
        
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifId.ToString());
            DM.Load_SP_Parameters("@TopPartNumber", entity.TopPartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.PartDescription);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@AnnualVolume", entity.AnnualVolume.ToString());

            result = DM.Execute_StoreProcedure("BOMHeader_NewBOM", true);

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

    public bool create(BOM entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        
        try
        {
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifId.ToString());
            DM.Load_SP_Parameters("@TopPartNumber", entity.TopPartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.PartDescription);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@AnnualVolume", entity.AnnualVolume.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("BOMHeader_NewBOM", true);

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

    public string createAndReturnIdGenerated(BOM entity)
    {
        ErrorOccur = false;
        
        string idGenerated = "";
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifId.ToString());
            DM.Load_SP_Parameters("@TopPartNumber", entity.TopPartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.PartDescription);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@AnnualVolume", entity.AnnualVolume.ToString());

            idGenerated = DM.Execute_StoreProcedure_Scalar("BOMHeader_NewBOM", true);

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

    public string createAndReturnIdGenerated(BOM entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string idGenerated = "";
        try
        {
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifId.ToString());
            DM.Load_SP_Parameters("@TopPartNumber", entity.TopPartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.PartDescription);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@AnnualVolume", entity.AnnualVolume.ToString());

            idGenerated = DM.Execute_StoreProcedure_Scalar_Open_Conn("BOMHeader_NewBOM", true);

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

    public BOM readById(long id)
    {
        BOM bom = new BOM();

        string query = "SELECT BOMHeaderKey, SIFHeaderKey, TopPartNumber, PartDescription, Revision, " +
                        "InquiryNumber, AnnualVolume, SalesPerson, CustomerName, MarketSector, AssignedTo " +
                        "FROM viewBOMHeader_ReadAll WHERE (BOMHeaderKey = @key)";
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
                bom.InquiryNumber = table.Rows[0][5].ToString();
                bom.AnnualVolume = int.Parse(table.Rows[0][6].ToString());
                bom.SalesPerson = table.Rows[0][7].ToString();
                bom.CustomerName= table.Rows[0][8].ToString();
                bom.MarketSector = table.Rows[0][9].ToString();
                bom.AssignedTo = table.Rows[0][10].ToString();
                
                sqlConnection.Dispose();
                return bom;
            }
        }
        return null;
    }
    public BOM readBySIFId(long id)
    {
        BOM bom = new BOM();

        string query = "SELECT BOMHeaderKey, SIFHeaderKey, TopPartNumber, PartDescription, Revision, " +
                        "InquiryNumber, AnnualVolume, SalesPerson, CustomerName, MarketSector, AssignedTo " +
                        "FROM viewBOMHeader_ReadAll WHERE (SIFHeaderKey = @key)";
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
                bom.InquiryNumber = table.Rows[0][5].ToString();
                bom.AnnualVolume = int.Parse(table.Rows[0][6].ToString());
                bom.SalesPerson = table.Rows[0][7].ToString();
                bom.CustomerName = table.Rows[0][8].ToString();
                bom.MarketSector = table.Rows[0][9].ToString();
                bom.AssignedTo = table.Rows[0][10].ToString();

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

        string query = "SELECT BOMHeaderKey, SIFHeaderKey, TopPartNumber, PartDescription, " +
                        "Revision, InquiryNumber, AnnualVolume,  MarketSector, SalesPerson, CustomerName, AssignedTo " +
                        "FROM viewBOMHeader_ReadAll ORDER BY PartDescription";
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
            bom.InquiryNumber = table.Rows[i][5].ToString();
            bom.AnnualVolume = int.Parse(table.Rows[i][6].ToString());
            bom.MarketSector = table.Rows[0][7].ToString();
            bom.SalesPerson = table.Rows[0][8].ToString();
            bom.CustomerName = table.Rows[0][9].ToString();
            bom.AssignedTo = table.Rows[0][10].ToString();
            
            recordset.Add(bom);
        }
       
        return recordset;
    }

    public IList<BOM> readAll(string filter)
    {
        List<BOM> recordset = new List<BOM>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT BOMHeaderKey, SIFHeaderKey, TopPartNumber, PartDescription, " +
                        "Revision, InquiryNumber, AnnualVolume,  MarketSector, SalesPerson, CustomerName, AssignedTo " +
                        "FROM viewBOMHeader_ReadAll " + filter + " ORDER BY PartDescription";
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
            bom.InquiryNumber = table.Rows[i][5].ToString();
            bom.AnnualVolume = int.Parse(table.Rows[i][6].ToString());
            bom.MarketSector = table.Rows[0][7].ToString();
            bom.SalesPerson = table.Rows[0][8].ToString();
            bom.CustomerName = table.Rows[0][9].ToString();
            bom.AssignedTo = table.Rows[0][10].ToString();

            recordset.Add(bom);
        }

        return recordset;
    }

    public bool update(BOM entity)
    {
        ErrorOccur = false;
        bool result = false;        
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifId.ToString());
            DM.Load_SP_Parameters("@TopPartNumber", entity.TopPartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.PartDescription);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@AnnualVolume", entity.AnnualVolume.ToString());
            
            result = DM.Execute_StoreProcedure("BOMHeader_EditBOM", true);

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
    public bool update(BOM entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        
        try
        {
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifId.ToString());
            DM.Load_SP_Parameters("@TopPartNumber", entity.TopPartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.PartDescription);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@AnnualVolume", entity.AnnualVolume.ToString());
            
            result = DM.Execute_StoreProcedure_Open_Conn("BOMHeader_EditBOM", true);

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
                else
                {
                    ErrorOccur = true;
                    ErrorMessage = "There were no rows affected for table: BOM Header";
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

public class bomDetailCRUD : ICRUD<BOMDetail>
{
    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;
    
    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public bomDetailCRUD()
    { }

    #region ICRUD<BOMDetail> Members

    public bool create(BOMDetail entity)
    {
        ErrorOccur = false;
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
            DM.Load_SP_Parameters("@LinePosition", entity.LinePosition);
            DM.Load_SP_Parameters("@SalesStatus", entity.SalesStatus);
            DM.Load_SP_Parameters("@User", entity.User);
            DM.Load_SP_Parameters("@PurchasingStatus", entity.PurchasingStatus);
            DM.Load_SP_Parameters("@DirectedBuy", entity.DirectedBuy.ToString());
            DM.Load_SP_Parameters("@Material", entity.Material);
            DM.Load_SP_Parameters("@Um", entity.Um);
            DM.Load_SP_Parameters("@VendorQuoteEst", entity.VendorQuoteEst);
            DM.Load_SP_Parameters("@SalesComments", entity.SalesComments);
            DM.Load_SP_Parameters("@PurchasingComments", entity.PurchasingComments);
            DM.Load_SP_Parameters("@CapComAssm", entity.CapComAssm);
            DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
            DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
            DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
            DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
            DM.Load_SP_Parameters("@CommCode", entity.CommCode);
            DM.Load_SP_Parameters("@EAU", entity.EAU);
            
            result = DM.Execute_StoreProcedure("BOMDetail_NewDetail", true);

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
    public bool create(BOMDetail entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        
        try
        {
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.BomHeaderKey.ToString());
            DM.Load_SP_Parameters("@ItemMasterKey", entity.ItemMasterkey.ToString());
            DM.Load_SP_Parameters("@Qty", entity.Qty.ToString());
            DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
            DM.Load_SP_Parameters("@Status", entity.Status);
            DM.Load_SP_Parameters("@Description", entity.Description);
            DM.Load_SP_Parameters("@LinePosition", entity.LinePosition);
            DM.Load_SP_Parameters("@SalesStatus", entity.SalesStatus);
            DM.Load_SP_Parameters("@User", entity.User);
            DM.Load_SP_Parameters("@PurchasingStatus", entity.PurchasingStatus);
            DM.Load_SP_Parameters("@DirectedBuy", entity.DirectedBuy.ToString());
            DM.Load_SP_Parameters("@Material", entity.Material);
            DM.Load_SP_Parameters("@Um", entity.Um);
            DM.Load_SP_Parameters("@VendorQuoteEst", entity.VendorQuoteEst);
            DM.Load_SP_Parameters("@SalesComments", entity.SalesComments);
            DM.Load_SP_Parameters("@PurchasingComments", entity.PurchasingComments);
            DM.Load_SP_Parameters("@CapComAssm", entity.CapComAssm);
            DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
            DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
            DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
            DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
            DM.Load_SP_Parameters("@CommCode", entity.CommCode);
            DM.Load_SP_Parameters("@EAU", entity.EAU);

            result = DM.Execute_StoreProcedure_Open_Conn("BOMDetail_NewDetail", true);

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
    public string createAndReturnIdGenerated(BOMDetail entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string idGenerated = "";
        try
        {
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.BomHeaderKey.ToString());
            DM.Load_SP_Parameters("@ItemMasterKey", entity.ItemMasterkey.ToString());
            DM.Load_SP_Parameters("@Qty", entity.Qty.ToString());
            DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
            DM.Load_SP_Parameters("@Status", entity.Status);
            DM.Load_SP_Parameters("@Description", entity.Description);
            DM.Load_SP_Parameters("@LinePosition", entity.LinePosition);
            DM.Load_SP_Parameters("@SalesStatus", entity.SalesStatus);
            DM.Load_SP_Parameters("@User", entity.User);
            DM.Load_SP_Parameters("@PurchasingStatus", entity.PurchasingStatus);
            DM.Load_SP_Parameters("@DirectedBuy", entity.DirectedBuy.ToString());
            DM.Load_SP_Parameters("@Material", entity.Material);
            DM.Load_SP_Parameters("@Um", entity.Um);
            DM.Load_SP_Parameters("@VendorQuoteEst", entity.VendorQuoteEst);
            DM.Load_SP_Parameters("@SalesComments", entity.SalesComments);
            DM.Load_SP_Parameters("@PurchasingComments", entity.PurchasingComments);
            DM.Load_SP_Parameters("@CapComAssm", entity.CapComAssm);
            DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
            DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
            DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
            DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
            DM.Load_SP_Parameters("@CommCode", entity.CommCode);
            DM.Load_SP_Parameters("@EAU", entity.EAU);

            idGenerated = DM.Execute_StoreProcedure_Scalar_Open_Conn("BOMDetail_NewDetail", true);

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
    public BOMDetail readById(long id)
    {
        BOMDetail bomDetail = new BOMDetail();

        string query =  "SELECT BOMDetailKey, BOMHeaderKey, ItemMasterKey, Qty, Cost, [Status], Description, " +
                        "LinePosition, SalesStatus, [User], PurchasingStatus, DirectedBuy, Material, Um, " +
                        "VendorQuoteEst, SalesComments, PurchasingComments, CapComAssm, " +
                        "CapsonicPN, CustomerPN, ManufacturePN, SupplierPN, CommCode, EAU " +
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
                bomDetail.BomHeaderKey = long.Parse(table.Rows[0][1].ToString());
                bomDetail.ItemMasterkey = long.Parse(table.Rows[0][2].ToString());
                bomDetail.Qty = float.Parse(table.Rows[0][3].ToString());
                bomDetail.Cost = float.Parse(table.Rows[0][4].ToString());
                bomDetail.Status = table.Rows[0][5].ToString();
                bomDetail.Description = table.Rows[0][6].ToString();
                bomDetail.LinePosition = table.Rows[0][7].ToString();
                bomDetail.SalesStatus = table.Rows[0][8].ToString();
                bomDetail.User = table.Rows[0][9].ToString();
                bomDetail.PurchasingStatus = table.Rows[0][10].ToString();
                bomDetail.DirectedBuy = bool.Parse(table.Rows[0][11].ToString());
                bomDetail.Material = table.Rows[0][12].ToString();
                bomDetail.Um = table.Rows[0][13].ToString();
                bomDetail.VendorQuoteEst = table.Rows[0][14].ToString();
                bomDetail.SalesComments = table.Rows[0][15].ToString();
                bomDetail.PurchasingComments = table.Rows[0][16].ToString();
                bomDetail.CapComAssm = table.Rows[0][17].ToString();
                bomDetail.CapsonicPN =table.Rows[0][18].ToString();
                bomDetail.CustomerPN = table.Rows[0][19].ToString();
                bomDetail.ManufacturePN = table.Rows[0][20].ToString();
                bomDetail.SupplierPN = table.Rows[0][21].ToString();
                bomDetail.CommCode = table.Rows[0][22].ToString();
                bomDetail.EAU = table.Rows[0][23].ToString();

                sqlConnection.Dispose();
                return bomDetail;
            }
        }
        return null;
    }
    public List<BOMDetail> readByParentID(long id)
    {
        List<BOMDetail> recordset = new List<BOMDetail>();

        string query = "SELECT BOMDetailKey, BOMHeaderKey, ItemMasterKey, Qty, Cost, [Status], [Description], PartNumber, " +
                        "LinePosition, SalesStatus, [User], PurchasingStatus, DirectedBuy, Material, " +
                        "Um, VendorQuoteEst, SalesComments, PurchasingComments, CapComAssm, " +
                        "CapsonicPN, CustomerPN, ManufacturePN, SupplierPN, CommCode, EAU " +
                        "FROM viewBOMDetail_ReadAll WHERE (BOMHeaderKey = @key) ORDER BY BOMDetailKey";

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
                bomDetail.BomHeaderKey = long.Parse(table.Rows[i][1].ToString());
                bomDetail.ItemMasterkey = long.Parse(table.Rows[i][2].ToString());
                bomDetail.Qty = float.Parse(table.Rows[i][3].ToString());
                bomDetail.Cost = float.Parse(table.Rows[i][4].ToString());
                bomDetail.Status = table.Rows[i][5].ToString();
                bomDetail.Description = table.Rows[i][6].ToString();
                bomDetail.PartNumber = table.Rows[i][7].ToString();
                bomDetail.LinePosition = table.Rows[i][8].ToString();
                bomDetail.SalesStatus = table.Rows[i][9].ToString();
                bomDetail.User = table.Rows[i][10].ToString();
                bomDetail.PurchasingStatus = table.Rows[i][11].ToString();
                bomDetail.DirectedBuy = bool.Parse(table.Rows[i][12].ToString());
                bomDetail.Material = table.Rows[i][13].ToString();
                bomDetail.Um = table.Rows[i][14].ToString();
                bomDetail.VendorQuoteEst = table.Rows[i][15].ToString();
                bomDetail.SalesComments = table.Rows[i][16].ToString();
                bomDetail.PurchasingComments = table.Rows[i][17].ToString();
                bomDetail.CapComAssm = table.Rows[i][18].ToString();
                bomDetail.CapsonicPN = table.Rows[i][19].ToString();
                bomDetail.CustomerPN = table.Rows[i][20].ToString();
                bomDetail.ManufacturePN = table.Rows[i][21].ToString();
                bomDetail.SupplierPN = table.Rows[i][22].ToString();
                bomDetail.CommCode = table.Rows[i][23].ToString();
                bomDetail.EAU = table.Rows[i][24].ToString();
                bomDetail.Sequence = i;
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

        string query = "SELECT BOMDetailKey, BOMHeaderKey, ItemMasterKey, Qty, Cost, [Status], Description, LinePosition, " +
                        "SalesStatus, [User], PurchasingStatus, DirectedBuy, Material, Um, VendorQuoteEst, SalesComments, " +
                        "PurchasingComments, CapComAssm, " +
                        "CapsonicPN, CustomerPN, ManufacturePN, SupplierPN, CommCode, EAU " +
                        "FROM BOMDetail ORDER BY BOMDetailKey";
        DataTable table = new DataTable();
        table = DM.Execute_Query(query);

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
                bomDetail.Qty = float.Parse(table.Rows[i][3].ToString());
            }
            else
            {
                bomDetail.Qty = -1;
            }
            if (table.Rows[i][4].ToString() != "")
            {
                bomDetail.Cost = float.Parse(table.Rows[i][4].ToString());
            }
            else
            {
                bomDetail.Cost = -1;
            }
            bomDetail.Status = table.Rows[i][5].ToString();
            bomDetail.Description = table.Rows[i][6].ToString();
            bomDetail.LinePosition = table.Rows[i][7].ToString();
            bomDetail.SalesStatus = table.Rows[i][8].ToString();
            bomDetail.User = table.Rows[i][9].ToString();
            bomDetail.PurchasingStatus = table.Rows[i][10].ToString();
            bomDetail.DirectedBuy = bool.Parse(table.Rows[i][11].ToString());
            bomDetail.Material = table.Rows[i][12].ToString();
            bomDetail.Um = table.Rows[i][13].ToString();
            bomDetail.VendorQuoteEst = table.Rows[i][14].ToString();
            bomDetail.SalesComments = table.Rows[i][15].ToString();
            bomDetail.PurchasingComments = table.Rows[i][16].ToString();
            bomDetail.CapComAssm = table.Rows[i][17].ToString();
            bomDetail.CapsonicPN = table.Rows[i][18].ToString();
            bomDetail.CustomerPN = table.Rows[i][19].ToString();
            bomDetail.ManufacturePN = table.Rows[i][20].ToString();
            bomDetail.SupplierPN = table.Rows[i][21].ToString();
            bomDetail.CommCode = table.Rows[i][22].ToString();
            bomDetail.EAU = table.Rows[i][23].ToString();
            bomDetail.Sequence = i;
            recordset.Add(bomDetail);
        }

        return recordset;
    }
    public bool update(BOMDetail entity)
    {
        ErrorOccur = false;
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
            DM.Load_SP_Parameters("@LinePosition", entity.LinePosition);
            DM.Load_SP_Parameters("@SalesStatus", entity.SalesStatus);
            DM.Load_SP_Parameters("@User", entity.User);
            DM.Load_SP_Parameters("@PurchasingStatus", entity.PurchasingStatus);
            DM.Load_SP_Parameters("@DirectedBuy", entity.DirectedBuy.ToString());
            DM.Load_SP_Parameters("@Material", entity.Material);
            DM.Load_SP_Parameters("@Um", entity.Um);
            DM.Load_SP_Parameters("@VendorQuoteEst", entity.VendorQuoteEst);
            DM.Load_SP_Parameters("@SalesComments", entity.SalesComments);
            DM.Load_SP_Parameters("@PurchasingComments", entity.PurchasingComments);
            DM.Load_SP_Parameters("@CapComAssm", entity.CapComAssm);
            DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
            DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
            DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
            DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
            DM.Load_SP_Parameters("@CommCode", entity.CommCode);
            DM.Load_SP_Parameters("@EAU", entity.EAU);

            result = DM.Execute_StoreProcedure("BOMDetail_EditDetail", true);

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

    public bool update(BOMDetail entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@BOMDetailKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.BomHeaderKey.ToString());
            DM.Load_SP_Parameters("@ItemMasterKey", entity.ItemMasterkey.ToString());
            DM.Load_SP_Parameters("@Qty", entity.Qty.ToString());
            DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
            DM.Load_SP_Parameters("@Status", entity.Status);
            DM.Load_SP_Parameters("@Description", entity.Description);
            DM.Load_SP_Parameters("@LinePosition", entity.LinePosition);
            DM.Load_SP_Parameters("@SalesStatus", entity.SalesStatus);
            DM.Load_SP_Parameters("@User", entity.User);
            DM.Load_SP_Parameters("@PurchasingStatus", entity.PurchasingStatus);
            DM.Load_SP_Parameters("@DirectedBuy", entity.DirectedBuy.ToString());
            DM.Load_SP_Parameters("@Material", entity.Material);
            DM.Load_SP_Parameters("@Um", entity.Um);
            DM.Load_SP_Parameters("@VendorQuoteEst", entity.VendorQuoteEst);
            DM.Load_SP_Parameters("@SalesComments", entity.SalesComments);
            DM.Load_SP_Parameters("@PurchasingComments", entity.PurchasingComments);
            DM.Load_SP_Parameters("@CapComAssm", entity.CapComAssm);
            DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
            DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
            DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
            DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
            DM.Load_SP_Parameters("@CommCode", entity.CommCode);
            DM.Load_SP_Parameters("@EAU", entity.EAU);

            result = DM.Execute_StoreProcedure_Open_Conn("BOMDetail_EditDetail", true);

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
                else
                {
                    ErrorOccur = true;
                    ErrorMessage = "There were no rows affected for table: BOM Detail.";
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
    public bool delete(long id, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string query = "DELETE FROM BOMDetail WHERE BOMDetailKey=" + id;
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
    public bool deleteByParentID(long id)
    {
        ErrorOccur = false;
        int rowsAffected = 0;
        string query = "DELETE FROM BOMDetail WHERE BOMHeaderKey=@key";
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
                return true;
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

public class bomDetailVolumeCRUD : ICRUD<BOMDetailVolume>
{
    ConnectionManager connectionManager = new ConnectionManager();
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public bomDetailVolumeCRUD()
    { }

    #region ICRUD<BOMDetailVolume> Members

    public bool create(BOMDetailVolume entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();

        try
        {
            DM.Load_SP_Parameters("@BOMDetailKey", entity.BomDetailKey.ToString());
            DM.Load_SP_Parameters("@Volume", entity.Volume.ToString());

            result = DM.Execute_StoreProcedure("BOMDetailVolume_NewVolume", true);
            
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
    public bool create(BOMDetailVolume entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;

        try
        {
            DM.Load_SP_Parameters("@BOMDetailKey", entity.BomDetailKey.ToString());
            DM.Load_SP_Parameters("@Volume", entity.Volume.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("BOMDetailVolume_NewVolume", true);

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

    public BOMDetailVolume readById(long id)
    {
        BOMDetailVolume bomDetailVolume = new BOMDetailVolume();

        string query =  "SELECT     BOMDetailVolumeKey, BOMDetailKey, Volume " +
                        "FROM       BOMDetailVolume " +
                        "WHERE      (BOMDetailVolumeKey = @key) " +
                        "ORDER BY Volume";

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
                bomDetailVolume.Id = long.Parse(table.Rows[0][0].ToString());
                bomDetailVolume.BomDetailKey = long.Parse(table.Rows[0][1].ToString());
                bomDetailVolume.Volume = float.Parse(table.Rows[0][2].ToString());

                sqlConnection.Dispose();
                return bomDetailVolume;
            }
        }
        return null;
    }
    public List<BOMDetailVolume> readByParentID(long id)
    {
        List<BOMDetailVolume> recordset = new List<BOMDetailVolume>();

        string query = "SELECT     BOMDetailVolumeKey, BOMDetailKey, Volume " +
                        "FROM       BOMDetailVolume " +
                        "WHERE      (BOMDetailKey = @key) " +
                        "ORDER BY Volume";

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
                BOMDetailVolume bomDetail = new BOMDetailVolume();
                bomDetail.Id = long.Parse(table.Rows[i][0].ToString());
                bomDetail.BomDetailKey = long.Parse(table.Rows[i][1].ToString());
                bomDetail.Volume = float.Parse(table.Rows[i][2].ToString());
                
                recordset.Add(bomDetail);
            }
        }
        return recordset;
    }
    public IList<BOMDetailVolume> readAll()
    {
        List<BOMDetailVolume> recordset = new List<BOMDetailVolume>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT     BOMDetailVolumeKey, BOMDetailKey, Volume " +
                       "FROM       BOMDetailVolume " +
                       "ORDER BY Volume";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);

        for (int i = 0; i < table.Rows.Count; i++)
        {
            BOMDetailVolume bomDetailVolume = new BOMDetailVolume();
            bomDetailVolume.Id = long.Parse(table.Rows[i][0].ToString());
            if (table.Rows[i][1].ToString() != "")
            {
                bomDetailVolume.BomDetailKey = long.Parse(table.Rows[i][1].ToString());
            }
            else
            {
                bomDetailVolume.BomDetailKey = -1;
            }
            if (table.Rows[i][2].ToString() != "")
            {
                bomDetailVolume.Volume = float.Parse(table.Rows[i][2].ToString());
            }
            else
            {
                bomDetailVolume.Volume = -1;
            }
            
            recordset.Add(bomDetailVolume);
        }

        return recordset;
    }
    public bool update(BOMDetailVolume entity)
    {
        ErrorOccur = false;
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@BOMDetailVolumeKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@BOMDetailKey", entity.BomDetailKey.ToString());
            DM.Load_SP_Parameters("@Volume", entity.Volume.ToString());

            result = DM.Execute_StoreProcedure("BOMDetailVolume_EditVolume", true);

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

    public bool update(BOMDetailVolume entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@BOMDetailVolumeKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@BOMDetailKey", entity.BomDetailKey.ToString());
            DM.Load_SP_Parameters("@Volume", entity.Volume.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("BOMDetailVolume_EditVolume", true);
            
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
        string query = "DELETE FROM BOMDetailVolume WHERE BOMDetailVolumeKey=@key";
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
                    ErrorMessage = "There were no rows affected for table: BOM Detail Volume.";
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
            ErrorMessage = "Could not connect to database.";
        }
        return false;
    }
    public bool delete(long id, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string query = "DELETE FROM BOMDetailVolume WHERE BOMDetailVolumeKey = " + id;
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
    public bool deleteByParentID(long id)
    {
        ErrorOccur = false;
        int rowsAffected = 0;
        string query = "DELETE FROM BOMDetailVolume WHERE BOMDetailKey=@key";
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
                return true;
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
            ErrorMessage = "Error. Could not connecto to database.";
        }
        return false;
    }
    public bool deleteByParentID(long id, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string query = "DELETE FROM BOMDetailVolume WHERE BOMDetailKey=" + id;
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