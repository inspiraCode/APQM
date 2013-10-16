﻿using System;
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
    Data_Base_MNG.SQL DM;

    public sifCRUD()
    {
    }

    #region ICRUD<SIF> Members

    public bool create(SIF entity)
    {
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@CustomerKey", entity.CustomerKey.ToString());
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.BomId.ToString());
            DM.Load_SP_Parameters("@InquiryNumber", entity.InquiryNumber);
            DM.Load_SP_Parameters("@Priority", entity.Priority);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@SalesPerson", entity.SalesPerson);
            DM.Load_SP_Parameters("@CostModelLoc", entity.CostModelLoc);
            DM.Load_SP_Parameters("@Contact", entity.Contact);
            DM.Load_SP_Parameters("@BussinesClass", entity.BussinesClass);
            DM.Load_SP_Parameters("@Product", entity.Product);
            DM.Load_SP_Parameters("@DivLoc", entity.DivLoc);
            DM.Load_SP_Parameters("@Department", entity.Department);
            DM.Load_SP_Parameters("@Reason4Quote", entity.Reason4Quote);
            DM.Load_SP_Parameters("@Application", entity.Application);
            DM.Load_SP_Parameters("@Specification", entity.Specification);
            DM.Load_SP_Parameters("@DrawingLevel", entity.DrawingLevel);
            DM.Load_SP_Parameters("@TaskDescription", entity.TaskDescription);
            DM.Load_SP_Parameters("@PartPrint", entity.PartPrint);
            DM.Load_SP_Parameters("@Sample", entity.Sample);
            DM.Load_SP_Parameters("@ToolingTarget", entity.ToolingTarget);
            DM.Load_SP_Parameters("@PrimaryCompetitors", entity.PrimaryCompetitors);
            DM.Load_SP_Parameters("@SpecificResourceRequirements", entity.SpecificResourceRequirements);
            DM.Load_SP_Parameters("@Technical", entity.Technical);
            DM.Load_SP_Parameters("@QuoteDue", entity.QuoteDue.ToString());
            DM.Load_SP_Parameters("@Sop", entity.Sop.ToString());

            result = DM.Execute_StoreProcedure("SIFHeader_NewSIF", true);
        }
        catch (Exception e)
        {
            return false;
        }

        return result;
    }
    public bool create(SIF entity, ref Data_Base_MNG.SQL DM)
    {
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@CustomerKey", entity.CustomerKey.ToString());
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.BomId.ToString());
            DM.Load_SP_Parameters("@InquiryNumber", entity.InquiryNumber);
            DM.Load_SP_Parameters("@Priority", entity.Priority);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@SalesPerson", entity.SalesPerson);
            DM.Load_SP_Parameters("@CostModelLoc", entity.CostModelLoc);
            DM.Load_SP_Parameters("@Contact", entity.Contact);
            DM.Load_SP_Parameters("@BussinesClass", entity.BussinesClass);
            DM.Load_SP_Parameters("@Product", entity.Product);
            DM.Load_SP_Parameters("@DivLoc", entity.DivLoc);
            DM.Load_SP_Parameters("@Department", entity.Department);
            DM.Load_SP_Parameters("@Reason4Quote", entity.Reason4Quote);
            DM.Load_SP_Parameters("@Application", entity.Application);
            DM.Load_SP_Parameters("@Specification", entity.Specification);
            DM.Load_SP_Parameters("@DrawingLevel", entity.DrawingLevel);
            DM.Load_SP_Parameters("@TaskDescription", entity.TaskDescription);
            DM.Load_SP_Parameters("@PartPrint", entity.PartPrint);
            DM.Load_SP_Parameters("@Sample", entity.Sample);
            DM.Load_SP_Parameters("@ToolingTarget", entity.ToolingTarget);
            DM.Load_SP_Parameters("@PrimaryCompetitors", entity.PrimaryCompetitors);
            DM.Load_SP_Parameters("@SpecificResourceRequirements", entity.SpecificResourceRequirements);
            DM.Load_SP_Parameters("@Technical", entity.Technical);
            DM.Load_SP_Parameters("@QuoteDue", entity.QuoteDue.ToString());
            DM.Load_SP_Parameters("@Sop", entity.Sop.ToString());

            result = DM.Execute_StoreProcedure_Open_Conn("SIFHeader_NewSIF", true);
        }
        catch (Exception e)
        {
            return false;
        }

        return result;
    }
    public string createAndReturnIdGenerated(SIF entity)
    {
        string idGenerated = "";
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@CustomerKey", entity.CustomerKey.ToString());
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.BomId.ToString());
            DM.Load_SP_Parameters("@InquiryNumber", entity.InquiryNumber);
            DM.Load_SP_Parameters("@Priority", entity.Priority);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@SalesPerson", entity.SalesPerson);
            DM.Load_SP_Parameters("@CostModelLoc", entity.CostModelLoc);
            DM.Load_SP_Parameters("@Contact", entity.Contact);
            DM.Load_SP_Parameters("@BussinesClass", entity.BussinesClass);
            DM.Load_SP_Parameters("@Product", entity.Product);
            DM.Load_SP_Parameters("@DivLoc", entity.DivLoc);
            DM.Load_SP_Parameters("@Department", entity.Department);
            DM.Load_SP_Parameters("@Reason4Quote", entity.Reason4Quote);
            DM.Load_SP_Parameters("@Application", entity.Application);
            DM.Load_SP_Parameters("@Specification", entity.Specification);
            DM.Load_SP_Parameters("@DrawingLevel", entity.DrawingLevel);
            DM.Load_SP_Parameters("@TaskDescription", entity.TaskDescription);
            DM.Load_SP_Parameters("@PartPrint", entity.PartPrint);
            DM.Load_SP_Parameters("@Sample", entity.Sample);
            DM.Load_SP_Parameters("@ToolingTarget", entity.ToolingTarget);
            DM.Load_SP_Parameters("@PrimaryCompetitors", entity.PrimaryCompetitors);
            DM.Load_SP_Parameters("@SpecificResourceRequirements", entity.SpecificResourceRequirements);
            DM.Load_SP_Parameters("@Technical", entity.Technical);
            DM.Load_SP_Parameters("@QuoteDue", entity.QuoteDue.ToString());
            DM.Load_SP_Parameters("@Sop", entity.Sop.ToString());

            idGenerated = DM.Execute_StoreProcedure_Scalar("SIFHeader_NewSIF", true);
        }
        catch (Exception e)
        {
            return "";
        }

        return idGenerated;
    }
    public string createAndReturnIdGenerated(SIF entity, ref Data_Base_MNG.SQL DM)
    {
        string idGenerated = "";
        try
        {
            DM.Load_SP_Parameters("@CustomerKey", entity.CustomerKey.ToString());
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.BomId.ToString());
            DM.Load_SP_Parameters("@InquiryNumber", entity.InquiryNumber);
            DM.Load_SP_Parameters("@Priority", entity.Priority);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@SalesPerson", entity.SalesPerson);
            DM.Load_SP_Parameters("@CostModelLoc", entity.CostModelLoc);
            DM.Load_SP_Parameters("@Contact", entity.Contact);
            DM.Load_SP_Parameters("@BussinesClass", entity.BussinesClass);
            DM.Load_SP_Parameters("@Product", entity.Product);
            DM.Load_SP_Parameters("@DivLoc", entity.DivLoc);
            DM.Load_SP_Parameters("@Department", entity.Department);
            DM.Load_SP_Parameters("@Reason4Quote", entity.Reason4Quote);
            DM.Load_SP_Parameters("@Application", entity.Application);
            DM.Load_SP_Parameters("@Specification", entity.Specification);
            DM.Load_SP_Parameters("@DrawingLevel", entity.DrawingLevel);
            DM.Load_SP_Parameters("@TaskDescription", entity.TaskDescription);
            DM.Load_SP_Parameters("@PartPrint", entity.PartPrint);
            DM.Load_SP_Parameters("@Sample", entity.Sample);
            DM.Load_SP_Parameters("@ToolingTarget", entity.ToolingTarget);
            DM.Load_SP_Parameters("@PrimaryCompetitors", entity.PrimaryCompetitors);
            DM.Load_SP_Parameters("@SpecificResourceRequirements", entity.SpecificResourceRequirements);
            DM.Load_SP_Parameters("@Technical", entity.Technical);
            DM.Load_SP_Parameters("@QuoteDue", entity.QuoteDue.ToString());
            DM.Load_SP_Parameters("@Sop", entity.Sop.ToString());

            idGenerated = DM.Execute_StoreProcedure_Scalar_Open_Conn("SIFHeader_NewSIF", true);
        }
        catch (Exception e)
        {
            return "";
        }

        return idGenerated;
    }

    public SIF readById(long id)
    {
        SIF sif = new SIF();

        string query = "SELECT SIFHeaderKey, CustomerKey, BOMHeaderKey, InquiryNumber, Priority, Revision, SalesPerson, CostModelLoc, Contact, BussinesClass, Product, DivLoc, Department, Reason4Quote, " +
                        "Application, Specification, DrawingLevel, TaskDescription, PartPrint, Sample, ToolingTarget, PrimaryCompetitors, SpecificResourceRequirements, Technical, QuoteDue, SOP " +
                        "FROM viewSIF_ReadAll WHERE(SIFHeaderKey = @key)";
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
                sif.Id = long.Parse(table.Rows[0][0].ToString());
                sif.CustomerKey = long.Parse(table.Rows[0][1].ToString());

                if (table.Rows[0][2].ToString() != "")
                {
                    sif.BomId = long.Parse(table.Rows[0][2].ToString());
                }
                else
                {
                    sif.BomId = -1;
                }

                sif.InquiryNumber = table.Rows[0][3].ToString();
                sif.Priority = table.Rows[0][4].ToString();
                sif.Revision = table.Rows[0][5].ToString();
                sif.SalesPerson = table.Rows[0][6].ToString();
                sif.CostModelLoc = table.Rows[0][7].ToString();
                sif.Contact = table.Rows[0][8].ToString();
                sif.BussinesClass = table.Rows[0][9].ToString();
                sif.Product = table.Rows[0][10].ToString();
                sif.DivLoc = table.Rows[0][11].ToString();
                sif.Department = table.Rows[0][12].ToString();
                sif.Reason4Quote = table.Rows[0][13].ToString();
                sif.Application = table.Rows[0][14].ToString();
                sif.Specification = table.Rows[0][15].ToString();
                sif.DrawingLevel = table.Rows[0][16].ToString();
                sif.TaskDescription = table.Rows[0][17].ToString();
                sif.PartPrint = table.Rows[0][18].ToString();
                sif.Sample = table.Rows[0][19].ToString();
                sif.ToolingTarget = table.Rows[0][20].ToString();
                sif.PrimaryCompetitors = table.Rows[0][21].ToString();
                sif.SpecificResourceRequirements = table.Rows[0][22].ToString();
                sif.Technical = table.Rows[0][23].ToString();
                sif.QuoteDue = DateTime.Parse(table.Rows[0][24].ToString());
                sif.Sop = DateTime.Parse(table.Rows[0][25].ToString());

                sqlConnection.Dispose();
                return sif;
            }
        }
        return null;
    }
    public SIF readBySIF_IN_List(SIF sifParameter, List<SIF> list)
    {
        foreach (SIF sifLocal in list)
        {
            if (sifLocal.InquiryNumber.Trim() == sifParameter.InquiryNumber.Trim() &&
                sifLocal.Revision.Trim() == sifParameter.Revision.Trim())
            {
                return sifLocal;
            }
        }
        return null;
    }

    public IList<SIF> readAll()
    {
        List<SIF> recordset = new List<SIF>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT SIFHeaderKey, CustomerKey, BOMHeaderKey, InquiryNumber, Priority, Revision, SalesPerson, CostModelLoc, Contact, BussinesClass, Product, DivLoc, Department, Reason4Quote, " +
                        "Application, Specification, DrawingLevel, TaskDescription, PartPrint, Sample, ToolingTarget, PrimaryCompetitors, SpecificResourceRequirements, Technical, TopPartNumber, CustomerName, QuoteDue, SOP " +
                        "FROM viewSIF_ReadAll ORDER BY SIFHeaderKey ASC";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
        if (DM.ErrorOccur)
        {
            throw new Exception(DM.Error_Mjs);
        }
        for (int i = 0; i < table.Rows.Count; i++)
        {
            SIF sif = new SIF();
            sif.Id = long.Parse(table.Rows[i][0].ToString());
            sif.CustomerKey = long.Parse(table.Rows[i][1].ToString());

            if (table.Rows[i][2].ToString() != "")
            {
                sif.BomId = long.Parse(table.Rows[i][2].ToString());
            }
            else
            {
                sif.BomId = -1;
            }
            sif.InquiryNumber = table.Rows[i][3].ToString();
            sif.Priority = table.Rows[i][4].ToString();
            sif.Revision = table.Rows[i][5].ToString();
            sif.SalesPerson = table.Rows[i][6].ToString();
            sif.CostModelLoc = table.Rows[i][7].ToString();
            sif.Contact = table.Rows[i][8].ToString();
            sif.BussinesClass = table.Rows[i][9].ToString();
            sif.Product = table.Rows[i][10].ToString();
            sif.DivLoc = table.Rows[i][11].ToString();
            sif.Department = table.Rows[i][12].ToString();
            sif.Reason4Quote = table.Rows[i][13].ToString();
            sif.Application = table.Rows[i][14].ToString();
            sif.Specification = table.Rows[i][15].ToString();
            sif.DrawingLevel = table.Rows[i][16].ToString();
            sif.TaskDescription = table.Rows[i][17].ToString();
            sif.PartPrint = table.Rows[i][18].ToString();
            sif.Sample = table.Rows[i][19].ToString();
            sif.ToolingTarget = table.Rows[i][20].ToString();
            sif.PrimaryCompetitors = table.Rows[i][21].ToString();
            sif.SpecificResourceRequirements = table.Rows[i][22].ToString();
            sif.Technical = table.Rows[i][23].ToString();
            sif.TopPartNumber = table.Rows[i][24].ToString();
            sif.CustomerName = table.Rows[i][25].ToString();
            sif.QuoteDue = DateTime.Parse(table.Rows[i][26].ToString());
            sif.Sop = DateTime.Parse(table.Rows[i][27].ToString());

            recordset.Add(sif);
        }

        return recordset;
    }

    public bool update(SIF entity)
    {
        bool result = false;
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@SIFHeaderKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@CustomerKey", entity.CustomerKey.ToString());
            DM.Load_SP_Parameters("@BOMHeaderKey", entity.BomId.ToString());
            DM.Load_SP_Parameters("@InquiryNumber", entity.InquiryNumber);
            DM.Load_SP_Parameters("@Priority", entity.Priority);
            DM.Load_SP_Parameters("@Revision", entity.Revision);
            DM.Load_SP_Parameters("@SalesPerson", entity.SalesPerson);
            DM.Load_SP_Parameters("@CostModelLoc", entity.CostModelLoc);
            DM.Load_SP_Parameters("@Contact", entity.Contact);
            DM.Load_SP_Parameters("@BussinesClass", entity.BussinesClass);
            DM.Load_SP_Parameters("@Product", entity.Product);
            DM.Load_SP_Parameters("@DivLoc", entity.DivLoc);
            DM.Load_SP_Parameters("@Department", entity.Department);
            DM.Load_SP_Parameters("@Reason4Quote", entity.Reason4Quote);
            DM.Load_SP_Parameters("@Application", entity.Application);
            DM.Load_SP_Parameters("@Specification", entity.Specification);
            DM.Load_SP_Parameters("@DrawingLevel", entity.DrawingLevel);
            DM.Load_SP_Parameters("@TaskDescription", entity.TaskDescription);
            DM.Load_SP_Parameters("@PartPrint", entity.PartPrint);
            DM.Load_SP_Parameters("@Sample", entity.Sample);
            DM.Load_SP_Parameters("@ToolingTarget", entity.ToolingTarget);
            DM.Load_SP_Parameters("@PrimaryCompetitors", entity.PrimaryCompetitors);
            DM.Load_SP_Parameters("@SpecificResourceRequirements", entity.SpecificResourceRequirements);
            DM.Load_SP_Parameters("@Technical", entity.Technical);
            DM.Load_SP_Parameters("@QuoteDue", entity.QuoteDue.ToString());
            DM.Load_SP_Parameters("@Sop", entity.Sop.ToString());

            result = DM.Execute_StoreProcedure("SIFHeader_EditSIF", true);
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
        string query = "DELETE FROM SIFHeader WHERE SIFHeaderKey=@key";
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