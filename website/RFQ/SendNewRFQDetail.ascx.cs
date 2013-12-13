using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RFQ_SendNewRFQDetail : System.Web.UI.UserControl
{
    List<Material> materialList;
    protected void Page_Load(object sender, EventArgs e)
    {
        materialList = (List<Material>)Session["MaterialNewRFQ"];
    }
    public void load()
    {
        bindList();
    }
    private void bindList()
    {
        repeaterNewRFQDetail.DataSource = materialList;
        repeaterNewRFQDetail.DataBind();
    }
    private void reset()
    {
        materialList = null;
        Session.Remove("MaterialNewRFQ");
    }
    public void setEntity(List<BOMDetail> bomDetailList)
    {
        if (bomDetailList != null)
        {
            materialList.Clear();
            foreach (BOMDetail bomDetail in bomDetailList)
            {
                Material material = new Material();
                material.id = bomDetail.Id;
                material.partName = bomDetail.Material;
                material.partNumber = bomDetail.PartNumber;
                material.qtyRequired = bomDetail.Qty;
                materialList.Add(material);
            }
        }
        else
        {
            materialList = new List<Material>();
        }
        Session["MaterialNewRFQ"] = materialList;
    }
    public List<Material> getEntity()
    {
        return (List<Material>)Session["MaterialNewRFQ"];
    }
    public class Material
    {
        public long id;
        public string partNumber = "";
        public float qtyRequired = 0;
        public string partName = "";
    }
}