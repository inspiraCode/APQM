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
                bom.PartDescription = table[0]["Inquiry Number"].ToString();
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
    AccessConfigurationManager connectionManager = new AccessConfigurationManager();
    Data_Base_MNG.Access DM;

    static bool alreadyRetrieved = false;
    static List<BOMAccess> BOMAccessData;

    public List<BOMAccess> readBySIF(SIF sif)
    {
        //List<BOMAccess> recordset = readAll();
        List<BOMAccess> recordset = new List<BOMAccess>();
        
       // List<BOMAccess> recordsetBySIF = recordset.Where(bom => bom.

        string query = "SELECT [Material Position], [Part Number/Code ID], " +
                        "[Material/Assembly Description], [Part Cost ($)], [No Required], [Assembly Description], Status " +
                        "FROM [Mat Assm Tool Descrip Table] " +
                        "WHERE [Inquiry Number] = '" + sif.InquiryNumber + "' and Revision = '" + sif.Revision + "'";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
        if (DM.Error)
        {
            throw new Exception(DM.Exeption);
        }
        for (int i = 0; i < table.Rows.Count; i++)
        {
            BOMAccess bom = new BOMAccess();
            bom.MaterialPosition = table.Rows[i][0].ToString();
            bom.PartNumber = table.Rows[i][1].ToString();
            bom.Material = table.Rows[i][2].ToString();
            bom.AssemblyDescription = table.Rows[i][5].ToString();
            bom.Status = table.Rows[i][6].ToString();
            try
            {
                bom.PartCost = float.Parse(table.Rows[i][3].ToString());
                bom.NoRequired = float.Parse(table.Rows[i][4].ToString());
            }catch(Exception ex){
                bom.ImportComment = "BOM Line imported with error, please review it and export it agian if necessary. Error: " + ex.Message;
            }           
            recordset.Add(bom);
        }

        return recordset;
    }
    public List<BOMAccess> readAll()
    {
        if (alreadyRetrieved) return BOMAccessData;
        

        List<BOMAccess> recordset = new List<BOMAccess>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT [Material Position], [Part Number/Code ID], " +
                        "[Material/Assembly Description], [Part Cost ($)], [No Required], [Assembly Description], Status " +
                        "FROM [Mat Assm Tool Descrip Table]";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
        if (DM.Error)
        {
            throw new Exception(DM.Exeption);
        }
        for (int i = 0; i < table.Rows.Count; i++)
        {
            BOMAccess bom = new BOMAccess();
            bom.MaterialPosition = table.Rows[i][0].ToString();
            bom.PartNumber = table.Rows[i][1].ToString();
            bom.Material = table.Rows[i][2].ToString();
            bom.PartCost = float.Parse(table.Rows[i][3].ToString());
            bom.NoRequired = float.Parse(table.Rows[i][4].ToString());
            bom.AssemblyDescription = table.Rows[i][5].ToString();
            bom.Status = table.Rows[i][6].ToString();

            recordset.Add(bom);
        }

        alreadyRetrieved = true;
        return recordset;
    }
}