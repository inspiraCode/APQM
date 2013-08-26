using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Class for working with database for SIF.
/// </summary>
public class sifCRUD : ICRUD<SIF>
{
   
    ConnectionManager connectionManager = new ConnectionManager();
    Data_Mng.SQL_DTMG DM;

    public sifCRUD()
	{
	}
    
    #region ICRUD<SIF> Members

    public long create(SIF entity)
    {
        object idGenerated = -1;
        SqlConnection sqlConnection = connectionManager.getConnection();
        
        try
        {
            SqlCommand command = new SqlCommand("SIFHeader_NewSIF", sqlConnection);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@CustomerKey",entity.CustomerKey);
            command.Parameters.AddWithValue("@InquiryNumber", entity.InquiryNumber);
            command.Parameters.AddWithValue("@Priority", entity.Priority);
            command.Parameters.AddWithValue("@Revision", entity.Revision);
            command.Parameters.AddWithValue("@SalesPerson", entity.SalesPerson);
            command.Parameters.AddWithValue("@CostModelLoc", entity.CostModelLoc);
            command.Parameters.AddWithValue("@Contact", entity.Contact);
            command.Parameters.AddWithValue("@BussinesClass", entity.BussinesClass);
            command.Parameters.AddWithValue("@Product", entity.Product);
            command.Parameters.AddWithValue("@DivLoc", entity.DivLoc);
            command.Parameters.AddWithValue("@Department", entity.Department);
            command.Parameters.AddWithValue("@Reason4Quote", entity.Reason4Quote);
            command.Parameters.AddWithValue("@Application", entity.Application);
            command.Parameters.AddWithValue("@Specification", entity.Specification);
            command.Parameters.AddWithValue("@DrawingLevel", entity.DrawingLevel);
            command.Parameters.AddWithValue("@TaskDescription", entity.TaskDescription);
            command.Parameters.AddWithValue("@PartPrint", entity.PartPrint);
            command.Parameters.AddWithValue("@Sample", entity.Sample);
            command.Parameters.AddWithValue("@ToolingTarget", entity.ToolingTarget);
            command.Parameters.AddWithValue("@PrimaryCompetitors", entity.PrimaryCompetitors);
            command.Parameters.AddWithValue("@SpecificResourceRequirements", entity.SpecificResourceRequirements);
            command.Parameters.AddWithValue("@Technical", entity.Technical);
            sqlConnection.Open();
            idGenerated = command.ExecuteScalar();
        }
        catch(Exception e){
            return -1;
        }

        return 1;        
    }

    public SIF readById(long id)
    {
        SIF sif = new SIF();

        string query =   "SELECT     SIFHeaderKey, CustomerKey, InquiryNumber, Priority, Revision, SalesPerson, CostModelLoc, Contact, BussinesClass, Product, DivLoc, Depatment, Reason4Quote, " +
                        "Application, Specification, DrawingLevel, TaskDescription, PartPrint, Sample, ToolingTarget, PrimaryCompetitors, SpecificResourceRequirements, Technical" +
                        "FROM SIFHeader WHERE     (SIFHeaderKey = @key)";         
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key",id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);
            if(table.Rows.Count > 0){

                sif.Id = long.Parse(table.Rows[0][0].ToString());
                sif.CustomerKey = long.Parse(table.Rows[0][1].ToString());
                sif.InquiryNumber = table.Rows[0][2].ToString();
                sif.Priority = table.Rows[0][3].ToString();
                sif.Revision = table.Rows[0][4].ToString();
                sif.SalesPerson = table.Rows[0][5].ToString();
                sif.CostModelLoc = table.Rows[0][6].ToString();
                sif.Contact = table.Rows[0][7].ToString();
                sif.BussinesClass = table.Rows[0][8].ToString();
                sif.Product = table.Rows[0][9].ToString();
                sif.DivLoc = table.Rows[0][10].ToString();
                sif.Department = table.Rows[0][11].ToString();
                sif.Reason4Quote = table.Rows[0][12].ToString();
                sif.Application = table.Rows[0][13].ToString();
                sif.Specification = table.Rows[0][14].ToString();
                sif.DrawingLevel = table.Rows[0][15].ToString();
                sif.TaskDescription = table.Rows[0][16].ToString();
                sif.PartPrint = table.Rows[0][17].ToString();
                sif.Sample = table.Rows[0][18].ToString();
                sif.ToolingTarget = table.Rows[0][19].ToString();
                sif.PrimaryCompetitors = table.Rows[0][20].ToString();
                sif.SpecificResourceRequirements = table.Rows[0][21].ToString();
                sif.Technical = table.Rows[0][22].ToString();
                
                sqlConnection.Dispose();
                return sif;
            }
        }
        return null;
    }

    public IList<SIF> readAll()
    {
        List<SIF>  recordset = new List<SIF>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT     SIFHeaderKey, CustomerKey, InquiryNumber, Priority, Revision, SalesPerson, CostModelLoc, Contact, BussinesClass, Product, DivLoc, Depatment, Reason4Quote, " +
                        "Application, Specification, DrawingLevel, TaskDescription, PartPrint, Sample, ToolingTarget, PrimaryCompetitors, SpecificResourceRequirements, Technical" +
                        "FROM SIFHeader ORDER BY SIFHeaderKey";    

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
        for (int i = 0; i < table.Rows.Count; i++)
        {
            SIF sif = new SIF();
            sif.Id = long.Parse(table.Rows[i][0].ToString());
            sif.CustomerKey = long.Parse(table.Rows[i][1].ToString());
            sif.InquiryNumber = table.Rows[i][2].ToString();
            sif.Priority = table.Rows[i][3].ToString();
            sif.Revision = table.Rows[i][4].ToString();
            sif.SalesPerson = table.Rows[i][5].ToString();
            sif.CostModelLoc = table.Rows[i][6].ToString();
            sif.Contact = table.Rows[i][7].ToString();
            sif.BussinesClass = table.Rows[i][8].ToString();
            sif.Product = table.Rows[i][9].ToString();
            sif.DivLoc = table.Rows[i][10].ToString();
            sif.Department = table.Rows[i][11].ToString();
            sif.Reason4Quote = table.Rows[i][12].ToString();
            sif.Application = table.Rows[i][13].ToString();
            sif.Specification = table.Rows[i][14].ToString();
            sif.DrawingLevel = table.Rows[i][15].ToString();
            sif.TaskDescription = table.Rows[i][16].ToString();
            sif.PartPrint = table.Rows[i][17].ToString();
            sif.Sample = table.Rows[i][18].ToString();
            sif.ToolingTarget = table.Rows[i][19].ToString();
            sif.PrimaryCompetitors = table.Rows[i][20].ToString();
            sif.SpecificResourceRequirements = table.Rows[i][21].ToString();
            sif.Technical = table.Rows[i][22].ToString();

            recordset.Add(sif);
        }
       
        return recordset;
    }
    public bool update(SIF entity)
    {
        int rowsAffected = 0;
        SqlConnection sqlConnection = connectionManager.getConnection();

        try
        {
            SqlCommand command = new SqlCommand("SIFHeader_EditSIF", sqlConnection);
            command.CommandType = CommandType.StoredProcedure;

            command.Parameters.AddWithValue("@SIFHeaderKey", entity.Id);
            command.Parameters.AddWithValue("@CustomerKey", entity.CustomerKey);
            command.Parameters.AddWithValue("@InquiryNumber", entity.InquiryNumber);
            command.Parameters.AddWithValue("@Priority", entity.Priority);
            command.Parameters.AddWithValue("@Revision", entity.Revision);
            command.Parameters.AddWithValue("@SalesPerson", entity.SalesPerson);
            command.Parameters.AddWithValue("@CostModelLoc", entity.CostModelLoc);
            command.Parameters.AddWithValue("@Contact", entity.Contact);
            command.Parameters.AddWithValue("@BussinesClass", entity.BussinesClass);
            command.Parameters.AddWithValue("@Product", entity.Product);
            command.Parameters.AddWithValue("@DivLoc", entity.DivLoc);
            command.Parameters.AddWithValue("@Department", entity.Department);
            command.Parameters.AddWithValue("@Reason4Quote", entity.Reason4Quote);
            command.Parameters.AddWithValue("@Application", entity.Application);
            command.Parameters.AddWithValue("@Specification", entity.Specification);
            command.Parameters.AddWithValue("@DrawingLevel", entity.DrawingLevel);
            command.Parameters.AddWithValue("@TaskDescription", entity.TaskDescription);
            command.Parameters.AddWithValue("@PartPrint", entity.PartPrint);
            command.Parameters.AddWithValue("@Sample", entity.Sample);
            command.Parameters.AddWithValue("@ToolingTarget", entity.ToolingTarget);
            command.Parameters.AddWithValue("@PrimaryCompetitors", entity.PrimaryCompetitors);
            command.Parameters.AddWithValue("@SpecificResourceRequirements", entity.SpecificResourceRequirements);
            command.Parameters.AddWithValue("@Technical", entity.Technical);
            sqlConnection.Open();
            
            rowsAffected = command.ExecuteNonQuery();

            if (rowsAffected <= 0)
            {
                return false;
            }
        }
        catch (Exception e)
        {
            return false;
        }

        return true;      
    }

    public bool delete(long id)
    {
        int rowsAffected=0;
        string query = "DELETE FROM SIFHeader WHERE SIFHeaderKey=@key";
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            try
            {
                SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@key", id);
                rowsAffected = sqlCommand.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    return true;
                }
            }catch(Exception e){
                //using return false below
            }
           
        }
        return false;
    }

    #endregion
}
