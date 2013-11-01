using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using SalesDB_To_APQM;
using SalesDB_To_APQM.entities;

public class sifAccessCRUD
{
    static AccessConfigurationManager connectionManager = new AccessConfigurationManager();
    static Data_Base_MNG.Access DM;

    static DataTable SIFRecordset;
    static bool alreadyRetrieved = false;

    static public DataTable readAll()
    {
        if (alreadyRetrieved) return SIFRecordset;        

        DM = connectionManager.getDataManager();

        string query = "SELECT [Inquiry Number], Status, Priority, Revision, [Sales Person], [Cost Model Location], Contact, " +
            "[Business Class], Product, [Division/Location], Department, [Reason For Quote], [Application/Program], " +
            "Specification, [Task Description], [Part Print (Rev)], Samples, [Tooling Target (Incl Prototypes)], [Primary Competitors], " +
            "[Specific Response Requirements], [Technical/subsource Constraints], Customer, [Quote Due], SOP, " +
            "[DWG Level], ID, [Year 1], [Year 2], [Year 3], [Year 4], [Year 5], [Year 6], [Year 7], [Projected Annual Volume Yr 1], " +
            "[% of Volume per Award Yr 1], [Projected/Target Price Yr 1], [Annual Revenue Yr 1], [Projected annual Volume Yr 2], " +
            "[% of Volume Yr 2], [Projected/Target Price Yr 2], [Annual Revenue Yr 2], [Projected Annual Volume Yr 3], " +
            "[% of Volume per award Yr 3], [Projected/Target Price Yr 3], [Annual Revenue Yr 3], [Projected Annual Volume Yr 4], " +
            "[% of Volume Yr 4], [Projected/Target Price Yr 4], [Annual Revenue Yr 4], [Projected Annual Volume Yr 5], [% of Volume per Award Yr 5], " +
            "[Projected/Target Price Yr 5], [Annual Volume Yr 5], [Projected annual Volume Yr 6], [% Volume per Award Yr 6], " +
            "[Projected/Target Price Yr 6], [Annual Revenue Yr 6], [Projected Annual Volume Yr 7], [% Volume per Award Yr 7], " +
            "[Projected/Target Price Yr 7], [Annual Revenue Yr 7] FROM [Sales Inquiry Form Table] " +
            "ORDER BY [Inquiry Number], Revision;";

        
        SIFRecordset = DM.Execute_Query(query);
        alreadyRetrieved = true;
        return SIFRecordset;
    }
    //public DataTable readFilterd(string filter)
    //{
        
    //    DM = connectionManager.getDataManager();

    //    string query = "SELECT [Inquiry Number], Priority, Revision, [Sales Person], [Cost Model Location], Contact, " +
    //                    "[Business Class], Product, [Division/Location], Department, [Reason For Quote], [Application/Program], " +
    //                    "Specification, [Task Description], [Part Print (Rev)], Samples, [Tooling Target (Incl Prototypes)], " +
    //                    "[Primary Competitors], [Specific Response Requirements], [Technical/subsource Constraints], Status, Customer, [Quote Due], SOP, [DWG Level] " +
    //                    "FROM [Sales Inquiry Form Table] " + filter +
    //                    "ORDER BY [Inquiry Number], Revision;";

        
    //    DataTable table = DM.Execute_Query(query);

    //    return table;
    //}
    public DataTable distinctSalesPerson()
    {
        return new DataView(readAll()).ToTable(true, "Sales Person");        
    }
    public DataTable distinctStatus()
    {
        return new DataView(readAll()).ToTable(true, "Status");    
    }

    //public IList<SIF> readActive()
    //{
    //    List<SIF> recordset = new List<SIF>();
    //    recordset.Clear();
    //    DM = connectionManager.getDataManager();

    //    string query = "SELECT [Inquiry Number], Priority, Revision, [Sales Person], [Cost Model Location], Contact, " +
    //                    "[Business Class], Product, [Division/Location], Department, [Reason For Quote], [Application/Program], " +
    //                    "Specification, [Task Description], [Part Print (Rev)], Samples, [Tooling Target (Incl Prototypes)], " +
    //                    "[Primary Competitors], [Specific Response Requirements], [Technical/subsource Constraints], Customer, [Quote Due], SOP, [DWG Level]" +
    //                    "FROM [Sales Inquiry Form Table] WHERE ((([Inquiry Number])>\"050101001\") AND ((Status)=\"Active\")) " +
    //                    "ORDER BY [Inquiry Number], Revision;";

    //    DataTable table = new DataTable();
    //    table = DM.Execute_Query(query);
    //    if (DM.Error)
    //    {
    //        throw new Exception(DM.Exeption);
    //    }
    //    for (int i = 0; i < table.Rows.Count; i++)
    //    {
    //        SIF sif = new SIF();
    //        sif.InquiryNumber = table.Rows[i][0].ToString();
    //        sif.Priority = table.Rows[i][1].ToString();
    //        sif.Revision = table.Rows[i][2].ToString();
    //        sif.SalesPerson = table.Rows[i][3].ToString();
    //        sif.CostModelLoc = table.Rows[i][4].ToString();
    //        sif.Contact = table.Rows[i][5].ToString();
    //        sif.BussinesClass = table.Rows[i][6].ToString();
    //        sif.Product = table.Rows[i][7].ToString();
    //        sif.DivLoc = table.Rows[i][8].ToString();
    //        sif.Department = table.Rows[i][9].ToString();
    //        sif.Reason4Quote = table.Rows[i][10].ToString();
    //        sif.Application = table.Rows[i][11].ToString();
    //        sif.Specification = table.Rows[i][12].ToString();            
    //        sif.TaskDescription = table.Rows[i][13].ToString();
    //        sif.PartPrint = table.Rows[i][14].ToString();
    //        sif.Sample = table.Rows[i][15].ToString();
    //        sif.ToolingTarget = table.Rows[i][16].ToString();
    //        sif.PrimaryCompetitors = table.Rows[i][17].ToString();
    //        sif.SpecificResourceRequirements = table.Rows[i][18].ToString();
    //        sif.Technical = table.Rows[i][19].ToString();
    //        sif.CustomerName = table.Rows[i][20].ToString();
    //        try
    //        {
    //            sif.QuoteDue = DateTime.Parse(table.Rows[i][21].ToString());
    //        }catch { }
    //        try
    //        {
    //            sif.Sop = DateTime.Parse(table.Rows[i][22].ToString());
    //        }catch { }
    //        sif.DrawingLevel = table.Rows[i][23].ToString();
    //        recordset.Add(sif);
    //    }
    //    return recordset;
    //}
}