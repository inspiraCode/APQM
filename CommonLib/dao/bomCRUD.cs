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
            DM.Load_SP_Parameters("@TopPartNumber", entity.TopPartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.PartDescription);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@AnnualVolume", entity.AnnualVolume.ToString());
            DM.Load_SP_Parameters("@AutoAero", entity.AutoAero);

            result = DM.Execute_StoreProcedure("BOMHeader_NewBOM", true);
        }
        catch (Exception e)
        {
            return false;
        }       

        return result;
    }

    public string createAndReturnIdGenerated(BOM entity)
    {
        string idGenerated = "";
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifId.ToString());
            DM.Load_SP_Parameters("@TopPartNumber", entity.TopPartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.PartDescription);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@AnnualVolume", entity.AnnualVolume.ToString());
            DM.Load_SP_Parameters("@AutoAero", entity.AutoAero);

            idGenerated = DM.Execute_StoreProcedure_Scalar("BOMHeader_NewBOM", true);
        }
        catch (Exception e)
        {
            return "";
        }

        return idGenerated;
    }

    public string createAndReturnIdGenerated(BOM entity, ref Data_Base_MNG.SQL DM)
    {
        string idGenerated = "";
        try
        {
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifId.ToString());
            DM.Load_SP_Parameters("@TopPartNumber", entity.TopPartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.PartDescription);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@AnnualVolume", entity.AnnualVolume.ToString());
            DM.Load_SP_Parameters("@AutoAero", entity.AutoAero);

            idGenerated = DM.Execute_StoreProcedure_Scalar_Open_Conn("BOMHeader_NewBOM", true);
        }
        catch (Exception e)
        {
            return "";
        }

        return idGenerated;
    }

    public BOM readById(long id)
    {
        BOM bom = new BOM();

        string query = "SELECT BOMHeaderKey, SIFHeaderKey, TopPartNumber, PartDescription, Revision, " +
                        "InquiryNumber, AnnualVolume, AutoAero, SalesPerson, CustomerName FROM viewBOMHeader_ReadAll WHERE (BOMHeaderKey = @key)";
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
                bom.AutoAero = table.Rows[0][7].ToString();
                bom.SalesPerson = table.Rows[0][8].ToString();
                bom.CustomerName= table.Rows[0][9].ToString();
                
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
                        "Revision, InquiryNumber, AnnualVolume, AutoAero FROM viewBOMHeader_ReadAll ORDER BY PartDescription";
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
            bom.AutoAero = table.Rows[i][7].ToString();

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
            DM.Load_SP_Parameters("@AnnualVolume", entity.AnnualVolume.ToString());
            DM.Load_SP_Parameters("@AutoAero", entity.AutoAero);

            result = DM.Execute_StoreProcedure("BOMHeader_EditBOM", true);
        }
        catch (Exception e)
        {
            return false;
        }

        return result;
    }
    public bool update(BOM entity, ref Data_Base_MNG.SQL DM)
    {

        bool result = false;
        
        try
        {
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.SifId.ToString());
            DM.Load_SP_Parameters("@TopPartNumber", entity.TopPartNumber);
            DM.Load_SP_Parameters("@PartDescription", entity.PartDescription);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@AnnualVolume", entity.AnnualVolume.ToString());
            DM.Load_SP_Parameters("@AutoAero", entity.AutoAero);

            result = DM.Execute_StoreProcedure_Open_Conn("BOMHeader_EditBOM", true);
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
            DM.Load_SP_Parameters("@LinePosition", entity.LinePosition);
            DM.Load_SP_Parameters("@SalesStatus", entity.SalesStatus);
            DM.Load_SP_Parameters("@UserKey", entity.UserKey.ToString());
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
            DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());
            
            result = DM.Execute_StoreProcedure("BOMDetail_NewDetail", true);
        }
        catch (Exception e)
        {
            return false;
        }

        return result;
    }
    public bool create(BOMDetail entity, ref Data_Base_MNG.SQL DM)
    {
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
            DM.Load_SP_Parameters("@UserKey", entity.UserKey.ToString());
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
            DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("BOMDetail_NewDetail", true);
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

        string query =  "SELECT BOMDetailKey, BOMHeaderKey, ItemMasterKey, Qty, Cost, Status, Description, " +
                        "LinePosition, SalesStatus, UserKey, PurchasingStatus, DirectedBuy, Material, Um, " +
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
                bomDetail.Cost = long.Parse(table.Rows[0][4].ToString());
                bomDetail.Status = table.Rows[0][5].ToString();
                bomDetail.Description = table.Rows[0][6].ToString();
                bomDetail.LinePosition = table.Rows[0][7].ToString();
                bomDetail.SalesStatus = table.Rows[0][8].ToString();
                bomDetail.UserKey = long.Parse(table.Rows[0][9].ToString());
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
                bomDetail.EAU = int.Parse(table.Rows[0][23].ToString());

                sqlConnection.Dispose();
                return bomDetail;
            }
        }
        return null;
    }
    public List<BOMDetail> readByParentID(long id)
    {
        List<BOMDetail> recordset = new List<BOMDetail>();

        string query = "SELECT BOMDetailKey, BOMHeaderKey, ItemMasterKey, Qty, Cost, Status, Description, PartNumber, " +
                        "LinePosition, SalesStatus, UserKey, PurchasingStatus, DirectedBuy, Material, " +
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
                bomDetail.UserKey = long.Parse(table.Rows[i][10].ToString());
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
                bomDetail.EAU = int.Parse(table.Rows[i][24].ToString());
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

        string query = "SELECT BOMDetailKey, BOMHeaderKey, ItemMasterKey, Qty, Cost, Status, Description, LinePosition, " +
                        "SalesStatus, UserKey, PurchasingStatus, DirectedBuy, Material, Um, VendorQuoteEst, SalesComments, " +
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
                bomDetail.Cost = long.Parse(table.Rows[i][4].ToString());
            }
            else
            {
                bomDetail.Cost = -1;
            }
            bomDetail.Status = table.Rows[i][5].ToString();
            bomDetail.Description = table.Rows[i][6].ToString();
            bomDetail.LinePosition = table.Rows[i][7].ToString();
            bomDetail.SalesStatus = table.Rows[i][8].ToString();
            bomDetail.UserKey = long.Parse(table.Rows[i][9].ToString());
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
            bomDetail.EAU = int.Parse(table.Rows[i][23].ToString());
            bomDetail.Sequence = i;
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
            DM.Load_SP_Parameters("@LinePosition", entity.LinePosition);
            DM.Load_SP_Parameters("@SalesStatus", entity.SalesStatus);
            DM.Load_SP_Parameters("@UserKey", entity.UserKey.ToString());
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
            DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());

            result = DM.Execute_StoreProcedure("BOMDetail_EditDetail", true);
        }
        catch (Exception e)
        {
            return false;
        }

        return result;
    }

    public bool update(BOMDetail entity, ref Data_Base_MNG.SQL DM)
    {
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
            DM.Load_SP_Parameters("@UserKey", entity.UserKey.ToString());
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
            DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("BOMDetail_EditDetail", true);
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
    public bool delete(long id, ref Data_Base_MNG.SQL DM)
    {
        string query = "DELETE FROM BOMDetail WHERE BOMDetailKey=" + id;
        if (DM.Execute_Command_Open_Connection(query))
        {
            return true;
        }           
        return false;
    }
    public bool deleteByParentID(long id)
    {
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