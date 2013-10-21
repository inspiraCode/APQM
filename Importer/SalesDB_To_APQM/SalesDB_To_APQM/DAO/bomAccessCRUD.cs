using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using SalesDB_To_APQM;
using SalesDB_To_APQM.entities;


public class bomHeaderAccessCRUD
{
    AccessConfigurationManager connectionManager = new AccessConfigurationManager();
    Data_Base_MNG.Access DM;

    public BOMHeaderAccess readBySIF(SIF sif)
    {
        BOMHeaderAccess bom = new BOMHeaderAccess();
        try
        {
            DataRow[] table = sifAccessCRUD.readAll().Select("[Inquiry Number] = '" + sif.InquiryNumber + "' and Revision = '" + sif.Revision + "'");
            if (table.Count() > 0)
            {
                bom.PartDescription = table[0]["Product"].ToString();
                //bom.Revision = table.Rows[0][0].ToString();
                //bom.TopPartNumber = table.Rows[0][0].ToString();
                return bom;
            }
        }catch{           
        }
        return null;
    }
}

public class bomAccessCRUD
{
    static AccessConfigurationManager connectionManager = new AccessConfigurationManager();
    static Data_Base_MNG.Access DM;

    static bool alreadyRetrieved = false;
    static DataTable BOMLineAccessData;

    static public List<BOMAccess> readBySIF(SIF sif)
    {


        List<BOMAccess> recordset = new List<BOMAccess>();
        try
        {
            DataRow[] table = readAll().Select("[Inquiry Number] = '" + sif.InquiryNumber + "' and Revision = '" + sif.Revision + "'");
            for (int i = 0; i < table.Count(); i++)
            {
                BOMAccess bom = new BOMAccess();
                bom.MaterialPosition = table[i]["Material Position"].ToString();
                bom.PartNumber = table[i]["Part Number/Code ID"].ToString();
                bom.Material = table[i]["Material/Assembly Description"].ToString();
                bom.AssemblyDescription = table[i]["Assembly Description"].ToString();
                bom.Status = table[i]["Status"].ToString();
                try
                {
                    bom.PartCost = float.Parse(table[i]["Part Cost ($)"].ToString());
                    bom.NoRequired = float.Parse(table[i]["No Required"].ToString());
                }
                catch (Exception ex)
                {
                    bom.ImportComment = "BOM Line imported with error, please review it and export it agian if necessary. Error: " + ex.Message;
                }
                recordset.Add(bom);
            }            
        }
        catch {}
        return recordset;
    }
    static public DataTable readAll()
    {
        if (alreadyRetrieved) return BOMLineAccessData;
        
        DM = connectionManager.getDataManager();

        string query = "SELECT [Material Position], [Part Number/Code ID], " +
                        "[Material/Assembly Description], [Part Cost ($)], [No Required], [Assembly Description], " + 
                        "Status, [Inquiry Number], Revision " +
                        "FROM [Mat Assm Tool Descrip Table]";

        BOMLineAccessData = DM.Execute_Query(query);
        alreadyRetrieved = true;
        return BOMLineAccessData;
    }
}