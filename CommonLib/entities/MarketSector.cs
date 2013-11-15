using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;


public class MarketSector
{
    private long id;
    private string name = "";

    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    public string Name
    {
        get { return name; }
        set { name = value; }
    }
}