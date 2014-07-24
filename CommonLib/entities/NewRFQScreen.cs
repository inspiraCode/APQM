using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class NewRFQScreen
{
    public List<SIFDetail> SIFVolumesList;
    public List<BOMDetail> BomDetailList;
    public List<Supplier> SupplierList;
    public long SIFHeaderID = -1;
    public DateTime DueDate = new DateTime(1985, 2, 10);
    public long MarketSectorID = -1;
    public string DrawingLevel = "";
    public float TargetPrice = -1;
    public string CommentsToVendor = "";
    public string FolderAttachments="";
}
