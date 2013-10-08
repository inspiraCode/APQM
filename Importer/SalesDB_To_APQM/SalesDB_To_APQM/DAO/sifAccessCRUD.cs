using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using SalesDB_To_APQM;

/// <summary>
/// Class for working with database for SIF.
/// </summary>
public class sifAccessCRUD : ICRUD<SIF>
{
    AccessConfigurationManager connectionManager = new AccessConfigurationManager();
    Data_Base_MNG.Access DM;

     
    #region ICRUD<SIF> Members

    public bool create(SIF entity)
    {
        bool result = false;
        
        return result;        
    }
    public string createAndReturnIdGenerated(SIF entity)
    {
        string idGenerated = "";
        

        return idGenerated;
    }

    public SIF readById(long id)
    {
        return null;
    }

    public IList<SIF> readAll()
    {
        List<SIF>  recordset = new List<SIF>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT [Inquiry Number], Priority, Revision, [Sales Person], [Cost Model Location], Contact, " +
                        "[Business Class], Product, [Division/Location], Department, [Reason For Quote], [Application/Program], " + 
                        "Specification, [Task Description], [Part Print (Rev)], Samples, [Tooling Target (Incl Prototypes)], " +
                        "[Primary Competitors], [Specific Response Requirements], [Technical/subsource Constraints], Status " +
                        "FROM [Sales Inquiry Form Table] WHERE ((([Inquiry Number])>\"050101001\") AND ((Status)=\"Active\")) " +
                        "ORDER BY [Inquiry Number], Revision;";    

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
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
            //sif.DrawingLevel = table.Rows[i][13].ToString();
            sif.TaskDescription = table.Rows[i][13].ToString();
            sif.PartPrint = table.Rows[i][14].ToString();
            sif.Sample = table.Rows[i][15].ToString();
            sif.ToolingTarget = table.Rows[i][16].ToString();
            sif.PrimaryCompetitors = table.Rows[i][17].ToString();
            sif.SpecificResourceRequirements = table.Rows[i][18].ToString();
            sif.Technical = table.Rows[i][19].ToString();
            recordset.Add(sif);
        }
       
        return recordset;
    }
    public IList<SIF> readActive()
    {
        List<SIF> recordset = new List<SIF>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT [Inquiry Number], Priority, Revision, [Sales Person], [Cost Model Location], Contact, " +
                        "[Business Class], Product, [Division/Location], Department, [Reason For Quote], [Application/Program], " +
                        "Specification, [Task Description], [Part Print (Rev)], Samples, [Tooling Target (Incl Prototypes)], " +
                        "[Primary Competitors], [Specific Response Requirements], [Technical/subsource Constraints], Customer " +
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
            //sif.DrawingLevel = table.Rows[i][13].ToString();
            sif.TaskDescription = table.Rows[i][13].ToString();
            sif.PartPrint = table.Rows[i][14].ToString();
            sif.Sample = table.Rows[i][15].ToString();
            sif.ToolingTarget = table.Rows[i][16].ToString();
            sif.PrimaryCompetitors = table.Rows[i][17].ToString();
            sif.SpecificResourceRequirements = table.Rows[i][18].ToString();
            sif.Technical = table.Rows[i][19].ToString();
            sif.CustomerName = table.Rows[i][20].ToString();
            recordset.Add(sif);
        }

        return recordset;
    }

    public bool update(SIF entity)
    {
        bool result = false;

        return result;
    }
    public bool delete(long id)
    {
       return false;
    }

    #endregion
}
