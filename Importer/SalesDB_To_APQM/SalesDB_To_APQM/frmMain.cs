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
    public partial class frmMain : Form
    {
        structSummary summary = new structSummary();
        
        struct structSummary
        {
            public long totalSuccess;
            public long totalErrors;
            public long totalOmitted;

            public void reset()
            {
                totalSuccess = 0;
                totalErrors = 0;
                totalOmitted = 0;
            }
        }
        public frmMain()
        {
            InitializeComponent();
        }
        private void btnExport_Click(object sender, EventArgs e)
        {
            summary.reset();

            sifAccessCRUD sif_CRUD_Access = new sifAccessCRUD();
            sifCRUD sif_CRUD_APQM = new sifCRUD();
            customerCRUD customer_CRUD = new customerCRUD();

            List<SIF> sifsInAccess;
            List<SIF> sifsInAPQM;
            List<Customer> customersList;

            try
            {   
                sifsInAccess = (List<SIF>)sif_CRUD_Access.readActive();
                sifsInAPQM = (List<SIF>)sif_CRUD_APQM.readAll();
                customersList = (List<Customer>)customer_CRUD.readAll();
            }catch(Exception ex){
                txtLog.AppendText("ERROR: " + ex.Message + "\n");
                summary.totalErrors++;
                refreshSummary();
                return;
            }

            if (sifsInAccess.Count > 0)
            {
                progressBar1.Maximum = sifsInAccess.Count;
                progressBar1.Minimum = 0;
                progressBar1.Value = 0;

                foreach (SIF sif in sifsInAccess)
                {
                    txtLog.AppendText("Reading an active SIF: " + sif + "\n");
                    if (sif_CRUD_APQM.readBySIF_IN_List(sif, sifsInAPQM) == null)
                    {
                        Customer customer = customer_CRUD.readByNameInList(sif.CustomerName, customersList);
                        if (customer == null)
                        {
                            customer = new Customer();
                            customer.CustomerName = sif.CustomerName;
                            string idGenerated = customer_CRUD.createAndReturnIdGenerated(customer);
                            if (idGenerated == "")
                            {
                                txtLog.AppendText("ERROR: Could not create Customer: " + customer.CustomerName + " for SIF with Inquiry Number: " + sif.InquiryNumber + "\n");
                                summary.totalErrors++;
                            }
                            else
                            {
                                customer.Id = long.Parse(idGenerated);
                                txtLog.AppendText("INFO: Customer created in APQM database: " + customer.CustomerName + "\n");
                                try
                                {
                                    customersList = (List<Customer>)customer_CRUD.readAll();
                                }catch(Exception ex){
                                    txtLog.AppendText("ERROR: " + ex.Message);
                                    summary.totalErrors++;
                                }
                            }
                        }
                        sif.CustomerKey = customer.Id;
                        txtLog.AppendText("Attempting to export: " + sif + "\n");
                        if (!sif_CRUD_APQM.create(sif))
                        {
                            txtLog.AppendText("ERROR: Could not export SIF: " + sif + "\n");
                            summary.totalErrors++;
                            continue;
                        }
                        else
                        {
                            txtLog.AppendText("SUCCESS: SIF exported: " + sif + "\n");
                            summary.totalSuccess++;
                        }
                    }
                    else
                    {
                        txtLog.AppendText("OMITTED: SIF already exported: " + sif + "\n");
                        summary.totalOmitted++;
                    }                                     
                    progressBar1.Value += 1;
                }
            }
            else
            {
                txtLog.AppendText("No more SIF to export.\n\n");
            }
            refreshSummary();
        }

        private void refreshSummary()
        {
            lblTotalErrors.Text = summary.totalErrors.ToString();
            lblTotalOmitted.Text = summary.totalOmitted.ToString();
            lblTotalSuccess.Text = summary.totalSuccess.ToString();
        }
    }
}