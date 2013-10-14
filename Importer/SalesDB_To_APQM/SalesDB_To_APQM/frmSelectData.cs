using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SalesDB_To_APQM
{
    public partial class frmSelectData : Form
    {
        AccessConfigurationManager accessConnection = new AccessConfigurationManager();
        sifAccessCRUD sifAccess_CRUD = new sifAccessCRUD();        
        string filter = "";

        public frmSelectData()
        {
            InitializeComponent();
        }

        private void frmSelectData_Load(object sender, EventArgs e)
        {
            clearFilter();
            loadSalesPersonList();
            loadStatus();
        }
        private void loadSalesPersonList()
        {
            DataTable salesPersonList = sifAccess_CRUD.distinctSalesPerson();
            chkListSalesPerson.Items.Clear();
            for (var i = 0; i < salesPersonList.Rows.Count; i++)
            {
                chkListSalesPerson.Items.Add(salesPersonList.Rows[i][0].ToString());
            }
        }
        private void loadStatus()
        {
            DataTable statusList = sifAccess_CRUD.distinctStatus();
            chkListStatus.Items.Clear();
            for (var i = 0; i < statusList.Rows.Count; i++)
            {
                chkListStatus.Items.Add(statusList.Rows[i][0].ToString());
            }
        }
        private void chkListSalesPerson_SelectedIndexChanged(object sender, EventArgs e)
        {
            filterData();
        }
        private void chkListStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            filterData();
        }
        private void filterData()
        {
            filter = "";
            CheckedListBox.CheckedItemCollection listSalesPersonSelected = chkListSalesPerson.CheckedItems;
            CheckedListBox.CheckedItemCollection listStatusSelected = chkListStatus.CheckedItems;

            if (txtInquiryNumber.Text.Trim() != "" || listSalesPersonSelected.Count > 0 || listStatusSelected.Count > 0)
            {
                filter = "WHERE ";

                if (txtInquiryNumber.Text.Trim() != "")
                {
                    filter += "[Inquiry Number] = '" + txtInquiryNumber.Text.Trim() + "' AND ";
                }

                if (listSalesPersonSelected.Count > 0)
                {
                    for (var i = 0; i < listSalesPersonSelected.Count; i++)
                    {
                        filter += "([Sales Person] = '" + listSalesPersonSelected[i].ToString() + "' OR ";
                    }
                    filter = filter.Substring(0, filter.Length - 4);
                    filter += ") AND ";
                }

                if (listStatusSelected.Count > 0)
                {
                    filter += "( ";
                    for (var i = 0; i < listStatusSelected.Count; i++)
                    {
                        filter += "[Status] = '" + listStatusSelected[i].ToString() + "' OR ";
                    }
                    filter = filter.Substring(0, filter.Length - 4);
                    filter += ") AND ";
                }
                filter = filter.Substring(0, filter.Length - 4);
            }

            gridSIF.DataSource = sifAccess_CRUD.readFilterd(filter);
            lblTotalRecords.Text = gridSIF.RowCount.ToString();
            gridSIF.ClearSelection();
        }

        private void btnClearFilter_Click(object sender, EventArgs e)
        {
            clearFilter();
        }

        private void clearFilter()
        {
            filter = "";

            for (int i = 0; i < chkListStatus.Items.Count; i++)
            {
                chkListStatus.SetItemChecked(i, false);
            }
            for (int i = 0; i < chkListSalesPerson.Items.Count; i++)
            {
                chkListSalesPerson.SetItemChecked(i, false);
            }
            chkListStatus.ClearSelected();
            chkListSalesPerson.ClearSelected();
            txtInquiryNumber.Text = "";
            
            filterData();
            gridSIF.ClearSelection();
        }
        private void txtInquiryNumber_TextChanged(object sender, EventArgs e)
        {
            filterData();
        }
        private void btnExportSelected_Click(object sender, EventArgs e)
        {
            if (gridSIF.SelectedRows.Count > 0)
            {
                List<SIF> recordset = new List<SIF>();
                foreach (DataGridViewRow row in gridSIF.SelectedRows)
                {
                    SIF sif = new SIF();
                    sif.InquiryNumber = row.Cells["Inquiry Number"].Value.ToString();
                    sif.Priority = row.Cells["Priority"].Value.ToString();
                    sif.Revision = row.Cells["Revision"].Value.ToString();
                    sif.SalesPerson = row.Cells["Sales Person"].Value.ToString();
                    sif.CostModelLoc = row.Cells["Cost Model Location"].Value.ToString();
                    sif.Contact = row.Cells["Contact"].Value.ToString();
                    sif.BussinesClass = row.Cells["Business Class"].Value.ToString();
                    sif.Product = row.Cells["Product"].Value.ToString();
                    sif.DivLoc = row.Cells["Division/Location"].Value.ToString();
                    sif.Department = row.Cells["Department"].Value.ToString();
                    sif.Reason4Quote = row.Cells["Reason For Quote"].Value.ToString();
                    sif.Application = row.Cells["Application/Program"].Value.ToString();
                    sif.Specification = row.Cells["Specification"].Value.ToString();
                    sif.TaskDescription = row.Cells["Task Description"].Value.ToString();
                    sif.PartPrint = row.Cells["Part Print (Rev)"].Value.ToString();
                    sif.Sample = row.Cells["Samples"].Value.ToString();
                    sif.ToolingTarget = row.Cells["Tooling Target (Incl Prototypes)"].Value.ToString();
                    sif.PrimaryCompetitors = row.Cells["Primary Competitors"].Value.ToString();
                    sif.SpecificResourceRequirements = row.Cells["Specific Response Requirements"].Value.ToString();
                    sif.Technical = row.Cells["Technical/subsource Constraints"].Value.ToString();
                    sif.CustomerName = row.Cells["Customer"].Value.ToString();
                    sif.SalesStatus = row.Cells["Status"].Value.ToString();
                    try
                    {
                        sif.QuoteDue = DateTime.Parse(row.Cells["Quote Due"].Value.ToString());
                    }
                    catch { }
                    try
                    {
                        sif.Sop = DateTime.Parse(row.Cells["SOP"].Value.ToString());
                    }
                    catch { }
                    sif.DrawingLevel = row.Cells["DWG Level"].Value.ToString();
                    recordset.Add(sif);
                }
                frmExport frmExportDialog = new frmExport();
                frmExportDialog.SifsInAccessToExport = recordset;
                frmExportDialog.ShowDialog(this);
            }
            else
            {
                MessageBox.Show("No SIFs selected.", "Error.");
            }
        }

        private void gridSIF_SelectionChanged(object sender, EventArgs e)
        {
            lblTotalSelected.Text = gridSIF.SelectedRows.Count.ToString();
        }
    }
}