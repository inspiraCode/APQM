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
}