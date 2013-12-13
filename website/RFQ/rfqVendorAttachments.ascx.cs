using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Configuration;

public partial class RFQ_rfqAttachmentsVendor : System.Web.UI.UserControl
{
    public event EventHandler AfterDeleteVendorAttachment;

    private List<RFQAttachments> rfqAttachments = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        rfqAttachments = (List<RFQAttachments>)Session["RFQInboxAttachmentsInbox"];
    }
    public void load()
    {
        loadDetail();
    }
    public void reset()
    {
        rfqAttachments = null;
        Session.Remove("RFQInboxAttachmentsInbox");
    }
    private void loadDetail()
    {
        repeaterRFQAttachments.DataSource = rfqAttachments;
        repeaterRFQAttachments.DataBind();
    }
    public void setEntity(List<RFQAttachments> detail)
    {
        if (detail != null)
        {
            rfqAttachments = detail;
        }
        else
        {
            rfqAttachments = new List<RFQAttachments>();
        }
        Session["RFQInboxAttachmentsInbox"] = rfqAttachments;
    }
    public List<RFQAttachments> getEntity()
    {
        return (List<RFQAttachments>)Session["RFQInboxAttachmentsInbox"];
    }
    public void R1_ItemDataBound(Object Sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            RFQAttachments rfqAttachment = (RFQAttachments)e.Item.DataItem;
            if (rfqAttachment != null)
            {
                ((LinkButton)e.Item.FindControl("downloadByName")).CommandArgument = rfqAttachment.Directory + "\\" + rfqAttachment.FileName;
                ((LinkButton)e.Item.FindControl("deleteByName")).CommandArgument = rfqAttachment.Directory + "\\" + rfqAttachment.FileName;
            }
        }
    }
    public void downloadByName(object sender, CommandEventArgs e)
    {
        string baseAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsInbox"];
        string filePath = baseAttachmentsPath + (string)e.CommandArgument;
        FileInfo file = new FileInfo(filePath);
        Response.AddHeader("Content-Disposition", "attachment;filename=" + file.Name);
        Response.TransmitFile(filePath);
        Response.End();
    }
    public void deleteByName(object sender, CommandEventArgs e)
    {
        string baseAttachmentsPath = ConfigurationManager.AppSettings["RFQAttachmentsInbox"];
        string filePath = baseAttachmentsPath + (string)e.CommandArgument;
        FileInfo file = new FileInfo(filePath);
        file.Delete();
        AfterDeleteVendorAttachment(null,null);
    }
}