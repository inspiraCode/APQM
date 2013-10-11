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
            gridSIF.DataSource = sifAccess_CRUD.readAll();
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
        }

        private void btnClearFilter_Click(object sender, EventArgs e)
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
        }

        private void txtInquiryNumber_TextChanged(object sender, EventArgs e)
        {
            filterData();
        }

        
    }
}