﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class SIF
{
    private long id;
    private long customerKey = -1;
    private string customerName = "";
    private long bomId = -1;
    private string inquiryNumber = "";
    private string priority = "";
    private string revision = "";
    private string salesPerson = "";
    private string costModelLoc = "";
    private string contact = "";
    private string bussinesClass = "";
    private string product = "";
    private string divLoc = "";
    private string department = "";
    private string reason4Quote = "";
    private string application = "";
    private string specification = "";
    private string drawingLevel = "";
    private string taskDescription = "";
    private string partPrint = "";
    private string sample = "";
    private string toolingTarget = "";
    private string primaryCompetitors = "";
    private string specificResourceRequirements = "";
    private string technical = "";
    private string topPartNumber = "";
    private DateTime quoteDue = new DateTime(1985, 2, 10);
    private DateTime sop = new DateTime(1985, 2, 10);

    public string CustomerName
    {
        get { return customerName; }
        set { customerName = value; }
    }
    public string TopPartNumber
    {
        get { return topPartNumber; }
        set { topPartNumber = value; }
    }
    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    public long CustomerKey
    {
        get { return customerKey; }
        set { customerKey = value; }
    }
    public long BomId
    {
        get { return bomId; }
        set { bomId = value; }
    }
    public string InquiryNumber
    {
        get { return inquiryNumber; }
        set { inquiryNumber = value; }
    }
    public string Priority
    {
        get { return priority; }
        set { priority = value; }
    }
    public string Revision
    {
        get { return revision; }
        set { revision = value; }
    }
    public string SalesPerson
    {
        get { return salesPerson; }
        set { salesPerson = value; }
    }
    public string CostModelLoc
    {
        get { return costModelLoc; }
        set { costModelLoc = value; }
    }
    public string Contact
    {
        get { return contact; }
        set { contact = value; }
    }
    public string BussinesClass
    {
        get { return bussinesClass; }
        set { bussinesClass = value; }
    }
    public string Product
    {
        get { return product; }
        set { product = value; }
    }
    public string DivLoc
    {
        get { return divLoc; }
        set { divLoc = value; }
    }
    public string Department
    {
        get { return department; }
        set { department = value; }
    }
    public string Reason4Quote
    {
        get { return reason4Quote; }
        set { reason4Quote = value; }
    }
    public string Application
    {
        get { return application; }
        set { application = value; }
    }
    public string Specification
    {
        get { return specification; }
        set { specification = value; }
    }
    public string DrawingLevel
    {
        get { return drawingLevel; }
        set { drawingLevel = value; }
    }
    public string TaskDescription
    {
        get { return taskDescription; }
        set { taskDescription = value; }
    }
    public string PartPrint
    {
        get { return partPrint; }
        set { partPrint = value; }
    }
    public string Sample
    {
        get { return sample; }
        set { sample = value; }
    }
    public string ToolingTarget
    {
        get { return toolingTarget; }
        set { toolingTarget = value; }
    }
    public string PrimaryCompetitors
    {
        get { return primaryCompetitors; }
        set { primaryCompetitors = value; }
    }
    public string SpecificResourceRequirements
    {
        get { return specificResourceRequirements; }
        set { specificResourceRequirements = value; }
    }
    public string Technical
    {
        get { return technical; }
        set { technical = value; }
    }
    public DateTime QuoteDue
    {
        get { return quoteDue; }
        set { quoteDue = value; }
    }
    public DateTime Sop
    {
        get { return sop; }
        set { sop = value; }
    }
}