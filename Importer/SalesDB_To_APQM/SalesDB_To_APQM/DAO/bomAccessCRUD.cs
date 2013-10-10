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

    public BOMHeader readBySIF(SIF sif)
    {
        BOMHeader bom = new BOMHeader();
       
        DM = connectionManager.getDataManager();

        string query = "SELECT [Material Position], [Part Number/Code ID], " +
                        "[Material/Assembly Description], [Part Cost ($)], [No Required], [Assembly Description], Status " +
                        "FROM [Mat Assm Tool Descrip Table] WHERE ";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
        if (DM.Error)
        {
            throw new Exception(DM.Exeption);
        }
        if(table.Rows.Count > 0)
        {            
            bom.PartDescription = table.Rows[0][0].ToString();
            bom.Revision = table.Rows[0][0].ToString();
            bom.TopPartNumber = table.Rows[0][0].ToString();
            return bom;
        }
        return null;
    }
}

public class bomAccessCRUD
{
    AccessConfigurationManager connectionManager = new AccessConfigurationManager();
    Data_Base_MNG.Access DM;

    public List<BOMAccess> readBySIF(SIF sif)
    {
        List<BOMAccess> recordset = new List<BOMAccess>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT [Material Position], [Part Number/Code ID], " +
                        "[Material/Assembly Description], [Part Cost ($)], [No Required], [Assembly Description], Status " +
                        "FROM [Mat Assm Tool Descrip Table] " +
                        "WHERE [Inquiry Number] = " + sif.InquiryNumber + " and Revision = " + sif.Revision;

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
        if (DM.Error)
        {
            throw new Exception(DM.Exeption);
        }
        for (int i = 0; i < table.Rows.Count; i++)
        {
            BOMAccess bom = new BOMAccess();
            bom.MaterialPosition = table.Rows[0][0].ToString();
            bom.PartNumber = table.Rows[0][1].ToString();
            bom.Material = table.Rows[0][2].ToString();
            bom.PartCost = float.Parse(table.Rows[0][3].ToString());
            bom.NoRequired = float.Parse(table.Rows[0][4].ToString());
            bom.AssemblyDescription = table.Rows[0][5].ToString();
            bom.Status = table.Rows[0][6].ToString();

            recordset.Add(bom);
        }

        return recordset;
    }
    public List<BOMAccess> readAll()
    {
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
            bom.MaterialPosition = table.Rows[0][0].ToString();
            bom.PartNumber = table.Rows[0][1].ToString();
            bom.Material = table.Rows[0][2].ToString();
            bom.PartCost = float.Parse(table.Rows[0][3].ToString());
            bom.NoRequired = float.Parse(table.Rows[0][4].ToString());
            bom.AssemblyDescription = table.Rows[0][5].ToString();
            bom.Status = table.Rows[0][6].ToString();

            recordset.Add(bom);
        }
        return recordset;
    }
}