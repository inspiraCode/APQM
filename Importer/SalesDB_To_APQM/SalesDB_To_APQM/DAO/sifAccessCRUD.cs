using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using SalesDB_To_APQM;

public class sifAccessCRUD
{
    AccessConfigurationManager connectionManager = new AccessConfigurationManager();
    Data_Base_MNG.Access DM;

    public DataTable readAll()
    {
       
        DM = connectionManager.getDataManager();

        string query = "SELECT [Inquiry Number], Priority, Revision, [Sales Person], [Cost Model Location], Contact, " +
                        "[Business Class], Product, [Division/Location], Department, [Reason For Quote], [Application/Program], " + 
                        "Specification, [Task Description], [Part Print (Rev)], Samples, [Tooling Target (Incl Prototypes)], " +
                        "[Primary Competitors], [Specific Response Requirements], [Technical/subsource Constraints], Status, [Quote Due], SOP " +
                        "FROM [Sales Inquiry Form Table] " +
                        "ORDER BY [Inquiry Number], Revision;";    

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
        
       
        return table;
    }
    public DataTable readFilterd(string filter)
    {

        DM = connectionManager.getDataManager();

        string query = "SELECT [Inquiry Number], Priority, Revision, [Sales Person], [Cost Model Location], Contact, " +
                        "[Business Class], Product, [Division/Location], Department, [Reason For Quote], [Application/Program], " +
                        "Specification, [Task Description], [Part Print (Rev)], Samples, [Tooling Target (Incl Prototypes)], " +
                        "[Primary Competitors], [Specific Response Requirements], [Technical/subsource Constraints], Status, [Quote Due], SOP " +
                        "FROM [Sales Inquiry Form Table] " + filter +
                        "ORDER BY [Inquiry Number], Revision;";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);

        return table;
    }
    public DataTable distinctSalesPerson()
    {

        DM = connectionManager.getDataManager();

        string query = "SELECT DISTINCT [Sales Person] " +
                        "FROM [Sales Inquiry Form Table] " +
                        "ORDER BY [Sales Person];";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);

        return table;
    }
    public DataTable distinctStatus()
    {

        DM = connectionManager.getDataManager();

        string query = "SELECT DISTINCT [Status] " +
                        "FROM [Sales Inquiry Form Table] " +
                        "ORDER BY [Status];";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);

        return table;
    }


    public IList<SIF> readActive()
    {
        List<SIF> recordset = new List<SIF>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT [Inquiry Number], Priority, Revision, [Sales Person], [Cost Model Location], Contact, " +
                        "[Business Class], Product, [Division/Location], Department, [Reason For Quote], [Application/Program], " +
                        "Specification, [Task Description], [Part Print (Rev)], Samples, [Tooling Target (Incl Prototypes)], " +
                        "[Primary Competitors], [Specific Response Requirements], [Technical/subsource Constraints], Customer, [Quote Due], SOP, [DWG Level]" +
                        "FROM [Sales Inquiry Form Table] WHERE ((([Inquiry Number])>\"050101001\") AND ((Status)=\"Active\")) " +
                        "ORDER BY [Inquiry Number], Revision;";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
        if (DM.Error)
        {
            throw new Exception(DM.Exeption);
        }
        for (int i = 0; i < table.Rows.Count; i++)
        {
            SIF sif = new SIF();
            sif.InquiryNumber = table.Rows[i][0].ToString();
            sif.Priority = table.Rows[i][1].ToString();
            sif.Revision = table.Rows[i][2].ToString();
            sif.SalesPerson = table.Rows[i][3].ToString();
            sif.CostModelLoc = table.Rows[i][4].ToString();
            sif.Contact = table.Rows[i][5].ToString();
            sif.BussinesClass = table.Rows[i][6].ToString();
            sif.Product = table.Rows[i][7].ToString();
            sif.DivLoc = table.Rows[i][8].ToString();
            sif.Department = table.Rows[i][9].ToString();
            sif.Reason4Quote = table.Rows[i][10].ToString();
            sif.Application = table.Rows[i][11].ToString();
            sif.Specification = table.Rows[i][12].ToString();            
            sif.TaskDescription = table.Rows[i][13].ToString();
            sif.PartPrint = table.Rows[i][14].ToString();
            sif.Sample = table.Rows[i][15].ToString();
            sif.ToolingTarget = table.Rows[i][16].ToString();
            sif.PrimaryCompetitors = table.Rows[i][17].ToString();
            sif.SpecificResourceRequirements = table.Rows[i][18].ToString();
            sif.Technical = table.Rows[i][19].ToString();
            sif.CustomerName = table.Rows[i][20].ToString();
            try
            {
                sif.QuoteDue = DateTime.Parse(table.Rows[i][21].ToString());
            }catch { }
            try
            {
                sif.Sop = DateTime.Parse(table.Rows[i][22].ToString());
            }catch { }
            sif.DrawingLevel = table.Rows[i][23].ToString();
            recordset.Add(sif);
        }
        return recordset;
    }
}