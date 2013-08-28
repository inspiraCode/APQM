using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for supplier
/// </summary>
public class BOM
{
    private long id;
    private long sifID;
    private string topPartNumber;
    private string partDescription;
    private string revision;

    public BOM()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public long Id
    {
        get { return id; }
        set { id = value; }
    }
    public long SifID
    {
        get { return sifID; }
        set { sifID = value; }
    }

    public string TopPartNumber
    {
        get { return topPartNumber; }
        set { topPartNumber = value; }
    }

    public string PartDescription
    {
        get { return partDescription; }
        set { partDescription = value; }
    }

    public string Revision
    {
        get { return revision; }
        set { revision = value; }
    }

}
