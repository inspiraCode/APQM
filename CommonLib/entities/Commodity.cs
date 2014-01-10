using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class Commodity
{
    private long id;
    private string commodityCode = "";
    private string commidityName = "";

    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    public string CommodityCode
    {
        get { return commodityCode; }
        set { commodityCode = value; }
    }
    public string CommidityName
    {
        get { return commidityName; }
        set { commidityName = value; }
    }
}