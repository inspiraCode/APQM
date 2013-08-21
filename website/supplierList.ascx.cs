using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class supplierList : System.Web.UI.UserControl
{
    private SupplierCRUD supplierCRUD = new SupplierCRUD();
    protected void Page_Load(object sender, EventArgs e)
    {
        string result = "";
        result = "<table cellspacing='0' style='width: 900px' border='1'>";

        //Header:
        result += "<tr>" +
            "<th>Supplier Name</th>" +
            "<th>Manufacturing Location</th>" +
            "<th>Ship Location</th>" +
            "<th>Quoted Currency</th>" +
            "<th>Contact Name</th>" +
            "<th>Contact Phone</th>" +
            "<th>Contact Email</th>" +
            "</tr>";

        List<Supplier> recordset = (List<Supplier>) supplierCRUD.readAll();

        if (recordset.Count > 0)
        {
            //Body:
            foreach (Supplier record in recordset)
            {
                
                result += "<tr height=40px;>" +
                   "<td><a href=default.aspx?section=popupSupplier&id=" + record.Id + ">" + record.SupplierName + "</a></td>" +
                   "<td>" + record.ManufacturingLocation + "</td>" +
                   "<td>" + record.ShipLocation + "</td>" +
                   "<td>" + record.QuotedCurrency + "</td>" +
                   "<td>" + record.ContactName + "</td>" +
                   "<td>" + record.ContactPhone + "</td>" +
                   "<td>" + record.ContactEmail + "</td>" +
                   "</tr>";
            }
        }
        result += "</table>";
        
        result += "<br />" + recordset.Count + " records.";

        divSupplierList.InnerHtml = result;
        
    }
    
}