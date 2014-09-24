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
            "[Projected/Target Price Yr 7], [Annual Revenue Yr 7], [Market Sector] FROM [Sales Inquiry Form Table] " +
            "ORDER BY [Inquiry Number], Revision;";

        
        SIFRecordset = DM.Execute_Query(query);
        alreadyRetrieved = true;
        return SIFRecordset;
    }
    public DataTable distinctSalesPerson()
    {
        return new DataView(readAll()).ToTable(true, "Sales Person");
    }
    public DataTable distinctStatus()
    {
        return new DataView(readAll()).ToTable(true, "Status");    
    }
}