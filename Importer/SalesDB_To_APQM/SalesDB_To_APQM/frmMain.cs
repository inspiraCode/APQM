using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SalesDB_To_APQM.entities;

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
            bomHeaderAccessCRUD bomHeaderAccess = new bomHeaderAccessCRUD();
            bomAccessCRUD bomAccessCRUD = new bomAccessCRUD();
            bomCRUD bomCRUD = new bomCRUD();
            bomDetailCRUD bomDetailCRUD = new bomDetailCRUD();
            itemCRUD item_CRUD = new itemCRUD();

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
                txtLog.AppendText("INFO: Found " + sifsInAccess.Count + " SIFs to import.\n");
                foreach (SIF sif in sifsInAccess)
                {
                    //if (sif.InquiryNumber == "120803701")
                    //{
                    //    MessageBox.Show("Here");
                    //}
                    txtLog.AppendText("INFO: Reading an active SIF: " + sif + "\n");
                    //Is this SIF imported before?:
                    if (sif_CRUD_APQM.readBySIF_IN_List(sif, sifsInAPQM) == null)
                    {
                        Customer customer = customer_CRUD.readByNameInList(sif.CustomerName, customersList);
                        if (customer == null) //Customer does not exist
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
                                }
                                catch (Exception ex)
                                {
                                    txtLog.AppendText("ERROR: " + ex.Message);
                                    summary.totalErrors++;
                                }
                            }
                        }
                        sif.CustomerKey = customer.Id;
                        txtLog.AppendText("INFO: Attempting to export SIF: " + sif + "\n");
                        string sifIDGenerated = sif_CRUD_APQM.createAndReturnIdGenerated(sif);
                        if (sifIDGenerated == "")
                        {
                            txtLog.AppendText("ERROR: Could not export SIF: " + sif + "\n");
                            summary.totalErrors++;
                            continue;
                        }
                        else
                        {
                            txtLog.AppendText("INFO: SIF exported, reading its BOMHeader.\n");

                            BOMHeaderAccess bomHeaderByActualSIF = bomHeaderAccess.readBySIF(sif);

                            if (bomHeaderByActualSIF != null)
                            {
                                BOM bomAPQM = new BOM();
                                bomAPQM.SifId = long.Parse(sifIDGenerated);
                                //bomAPQM.TopPartNumber = "";
                                bomAPQM.PartDescription = bomHeaderByActualSIF.PartDescription;
                                //bomAPQM.Revision = "";
                                txtLog.AppendText("INFO: Attempting to export its BOMHeader: " + bomAPQM + "\n");
                                string bomIDGenerated = bomCRUD.createAndReturnIdGenerated(bomAPQM);

                                if (bomIDGenerated == "")
                                {
                                    txtLog.AppendText("ERROR: Could not export BOMHeader: " + bomAPQM + "\n");
                                    summary.totalErrors++;
                                    continue;
                                }
                                else
                                {
                                    txtLog.AppendText("INFO: BOMHeader exported, reading Bom Lines.\n");
                                    List<BOMAccess> bomsByActualSIF = bomAccessCRUD.readBySIF(sif);
                                    if (bomsByActualSIF.Count > 0)
                                    {

                                        txtLog.AppendText("INFO: Found: " + bomsByActualSIF.Count + " BOM lines, attempting to export its Item.\n");
                                        foreach (BOMAccess bom in bomsByActualSIF)
                                        {
                                            Item item = new Item();
                                            item.PartNumber = bom.PartNumber;
                                            item.Description = bom.AssemblyDescription;
                                            item.Um = "";
                                            item.Material = bom.Material;

                                            string itemIDGenerated = item_CRUD.createAndReturnIdGenerated(item);
                                            if (itemIDGenerated == "")
                                            {
                                                txtLog.AppendText("ERROR: Could not export Item: " + item + "\n");
                                                summary.totalErrors++;
                                                continue;
                                            }
                                            else
                                            {
                                                txtLog.AppendText("INFO: Item exported: " + item);
                                                txtLog.AppendText("Attempting to export its BOMLine\n");

                                                if (bom.ImportComment != "")
                                                {
                                                    txtLog.AppendText("ERROR: " + bom.ImportComment + "\n");
                                                    summary.totalErrors++;
                                                    continue;
                                                }
                                                else
                                                {
                                                    BOMDetail bomDetail = new BOMDetail();
                                                    bomDetail.Description = bom.Material;
                                                    bomDetail.Qty = bom.NoRequired;
                                                    bomDetail.Cost = bom.PartCost;
                                                    bomDetail.SalesStatus = bom.Status;
                                                    bomDetail.BomHeaderKey = long.Parse(bomIDGenerated);
                                                    bomDetail.LinePosition = bom.MaterialPosition;
                                                    bomDetail.ItemMasterkey = long.Parse(itemIDGenerated);
                                                    if (!bomDetailCRUD.create(bomDetail))
                                                    {
                                                        txtLog.AppendText("ERROR: Could not export BOM Line: " + bomDetail + "\n");
                                                        summary.totalErrors++;
                                                        continue;
                                                    }
                                                    else
                                                    {
                                                        txtLog.AppendText("INFO: BOM Line exported: " + bomDetail + "\n");                                                        
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    else { 
                                        txtLog.AppendText("INFO: No BOM Line found for SIF: " + sif + "\n"); 
                                    }
                                }
                            }
                            else
                            {
                                txtLog.AppendText("ERROR: Could not export BOM of SIF: " + sif + "\n");
                                summary.totalErrors++;
                                continue;
                            }
                        }

                        txtLog.AppendText("SUCCESS: SIF exported: " + sif + "\n");
                        summary.totalSuccess++;
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
                txtLog.AppendText("INFO: No more SIF to export.\n\n");
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