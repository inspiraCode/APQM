using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Item
{
    private long id;
    private string partNumber = "";
    private string description = "";
    private string um = "";
    private string material = "";
    private float cost;
    private string capsonicPN = "";
    private string customerPN = "";
    private string manufacturePN = "";
    private string supplierPN = "";
    private string commCode = "";
    //private int eau;   

    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    public string PartNumber
    {
        get { return partNumber; }
        set { partNumber = value; }
    }
    public string Description
    {
        get { return description; }
        set { description = value; }
    }
    public string Um
    {
        get { return um; }
        set { um = value; }
    }
    public string Material
    {
        get { return material; }
        set { material = value; }
    }
    public float Cost
    {
        get { return cost; }
        set { cost = value; }
    }
    public string CapsonicPN
    {
        get { return capsonicPN; }
        set { capsonicPN = value; }
    }
    public string CustomerPN
    {
        get { return customerPN; }
        set { customerPN = value; }
    }
    public string ManufacturePN
    {
        get { return manufacturePN; }
        set { manufacturePN = value; }
    }
    public string SupplierPN
    {
        get { return supplierPN; }
        set { supplierPN = value; }
    }
    public string CommCode
    {
        get { return commCode; }
        set { commCode = value; }
    }
    //public int EAU
    //{
    //    get { return eau; }
    //    set { eau = value; }
    //}
    public override string ToString()
    {
        return "{Part Number: " + this.partNumber + " Description: " + this.description + " Material: " + this.material + "}";
    }
}