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
    public partial class frmExport : Form
    {
        private string log = "";

        private List<SIF> sifsInAccessToExport;        
        public List<SIF> SifsInAccessToExport
        {
            get { return sifsInAccessToExport; }
            set
            {
                sifsInAccessToExport = value;
                progressBar1.Maximum = sifsInAccessToExport.Count;
                progressBar1.Minimum = 0;
                progressBar1.Value = 0;
            }
        }

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

        public frmExport()
        {
            InitializeComponent();
        }

        public void export(){
            summary.reset();

            sifAccessCRUD sif_CRUD_Access = new sifAccessCRUD();
            sifCRUD sif_CRUD_APQM = new sifCRUD();
            customerCRUD customer_CRUD = new customerCRUD();
            bomHeaderAccessCRUD bomHeaderAccess = new bomHeaderAccessCRUD();
            bomAccessCRUD bomAccessCRUD = new bomAccessCRUD();
            bomCRUD bomCRUD = new bomCRUD();
            bomDetailCRUD bomDetailCRUD = new bomDetailCRUD();
            itemCRUD item_CRUD = new itemCRUD();

            List<SIF> sifsInAPQM;
            List<Customer> customersList;
            List<Item> itemList;

            int progress = 0;
            
            try
            {
                //sifsInAccess = (List<SIF>)sif_CRUD_Access.readActive();
                sifsInAPQM = (List<SIF>)sif_CRUD_APQM.readAll();
                customersList = (List<Customer>)customer_CRUD.readAll();
                itemList = (List<Item>) item_CRUD.readAll();
            }
            catch (Exception ex)
            {
                log = "ERROR: " + ex.Message + "\n\n";
                backgroundWorker1.ReportProgress(progress);
                System.Threading.Thread.Sleep(10);
                //txtLog.AppendText("ERROR: " + ex.Message + "\n");
                summary.totalErrors++;
                refreshSummary();
                return;
            }
            
            if (sifsInAccessToExport.Count > 0)
            {
                ConnectionManager CM = new ConnectionManager();
                Data_Base_MNG.SQL DM = CM.getDataManager();
               
                log = "INFO: Attempting to export " + sifsInAccessToExport.Count + " SIFs.\n\n\n";
                backgroundWorker1.ReportProgress(progress);
                System.Threading.Thread.Sleep(10);
                //txtLog.AppendText("INFO: Found " + sifsInAccessToExport.Count + " SIFs to import.\n");
                foreach (SIF sif in sifsInAccessToExport)
                {                    
                    log = "INFO: Reading an active SIF: " + sif + "\n";
                    backgroundWorker1.ReportProgress(progress);
                    System.Threading.Thread.Sleep(10);
                    //txtLog.AppendText("INFO: Reading an active SIF: " + sif + "\n");
                    //Was this SIF imported before?:
                    if (sif_CRUD_APQM.readBySIF_IN_List(sif, sifsInAPQM) == null)
                    {
                        /*Begin Transaction*/
                        DM.Open_Connection("ImportingSIF");

                        Customer customer = customer_CRUD.readByNameInList(sif.CustomerName, customersList);
                        if (customer == null) //Customer does not exist
                        {
                            customer = new Customer();
                            customer.CustomerName = sif.CustomerName;
                            string idGenerated = customer_CRUD.createAndReturnIdGenerated(customer, ref DM);
                            if (idGenerated == "")
                            {
                                summary.totalErrors++;
                                log = "ERROR: Could not create Customer: " + customer.CustomerName + " for SIF with Inquiry Number: " + sif.InquiryNumber + "\n" +
                                      "Error Description: " + DM.Error_Mjs + "\n\n";
                                backgroundWorker1.ReportProgress(++progress);
                                System.Threading.Thread.Sleep(10);
                                continue;
                            }
                            else
                            {
                                customer.Id = long.Parse(idGenerated);
                                log = "INFO: Customer created in APQM database: " + customer.CustomerName + "\n";
                                backgroundWorker1.ReportProgress(progress);
                                System.Threading.Thread.Sleep(10);
                                //txtLog.AppendText("INFO: Customer created in APQM database: " + customer.CustomerName + "\n");
                                customersList.Add(customer);
                            }
                        }
                        sif.CustomerKey = customer.Id;
                        log = "INFO: Attempting to export SIF: " + sif + "\n";
                        backgroundWorker1.ReportProgress(progress);
                        System.Threading.Thread.Sleep(10);
                        //txtLog.AppendText("INFO: Attempting to export SIF: " + sif + "\n");
                        string sifIDGenerated = sif_CRUD_APQM.createAndReturnIdGenerated(sif, ref DM);
                        if (sifIDGenerated == "")
                        {
                            summary.totalErrors++;
                            log = "ERROR: Could not export SIF: " + sif + "\n" +
                                    "Error Description: " + DM.Error_Mjs + "\n\n";
                            backgroundWorker1.ReportProgress(++progress);
                            System.Threading.Thread.Sleep(10);                            
                            continue;
                        }
                        else
                        {
                            log = "INFO: SIF exported, reading its BOMHeader.\n";
                            backgroundWorker1.ReportProgress(progress);
                            System.Threading.Thread.Sleep(10);
                            //txtLog.AppendText("INFO: SIF exported, reading its BOMHeader.\n");

                            BOMHeaderAccess bomHeaderByActualSIF = bomHeaderAccess.readBySIF(sif);

                            if (bomHeaderByActualSIF != null)
                            {
                                BOM bomAPQM = new BOM();
                                bomAPQM.SifId = long.Parse(sifIDGenerated);
                                //bomAPQM.TopPartNumber = "";
                                bomAPQM.PartDescription = bomHeaderByActualSIF.PartDescription;
                                //bomAPQM.Revision = "";
                                log = "INFO: Attempting to export its BOMHeader: " + bomAPQM + "\n";
                                backgroundWorker1.ReportProgress(progress);
                                System.Threading.Thread.Sleep(10);
                                //txtLog.AppendText("INFO: Attempting to export its BOMHeader: " + bomAPQM + "\n");
                                string bomIDGenerated = bomCRUD.createAndReturnIdGenerated(bomAPQM, ref DM);

                                if (bomIDGenerated == "")
                                {
                                    summary.totalErrors++;
                                    log = "ERROR: Could not export BOMHeader: " + bomAPQM + "\n" + 
                                            "Error Description: " + DM.Error_Mjs + "\n\n";
                                    backgroundWorker1.ReportProgress(++progress);
                                    System.Threading.Thread.Sleep(10);
                                    continue;
                                }
                                else
                                {
                                    log = "INFO: BOMHeader exported, reading Bom Lines.\n";
                                    backgroundWorker1.ReportProgress(progress);
                                    System.Threading.Thread.Sleep(10);
                                    //txtLog.AppendText("INFO: BOMHeader exported, reading Bom Lines.\n");
                                    List<BOMAccess> bomsByActualSIF = bomAccessCRUD.readBySIF(sif);
                                    if (bomsByActualSIF.Count > 0)
                                    {
                                        log = "INFO: Found: " + bomsByActualSIF.Count + " BOM lines, attempting to export its Item.\n";
                                        backgroundWorker1.ReportProgress(progress);
                                        System.Threading.Thread.Sleep(10);
                                        //txtLog.AppendText("INFO: Found: " + bomsByActualSIF.Count + " BOM lines, attempting to export its Item.\n");
                                        bool errorInBOM = false;
                                        foreach (BOMAccess bom in bomsByActualSIF)
                                        {
                                            if (bom.ImportComment != "")
                                            {
                                                summary.totalErrors++;
                                                log = "ERROR: " + " BOM: " + bom + "\n" +
                                                        "Error Description: " + bom.ImportComment + "\n\n";
                                                log = "INFO: Attempting to RollBack..\n";
                                                DM.RollBack();
                                                if (DM.ErrorOccur)
                                                {
                                                    log = "...Fail to RollBack.\n" + "Error Description: " + DM.Error_Mjs + "\n\n";
                                                }
                                                else
                                                {
                                                    log = "...RollBack done.\n" + "Error Description: " + DM.Error_Mjs + "\n\n";
                                                }

                                                backgroundWorker1.ReportProgress(++progress);
                                                System.Threading.Thread.Sleep(10);
                                                errorInBOM = true;

                                                break;
                                            }
                                            else
                                            {
                                                Item item = item_CRUD.readByPartNumberInList(bom.PartNumber, itemList);
                                                if (item == null)
                                                {
                                                    item = new Item();
                                                    item.PartNumber = bom.PartNumber;
                                                    item.Description = bom.AssemblyDescription;
                                                    item.Um = "";
                                                    item.Material = bom.Material;

                                                    string itemIDGenerated = item_CRUD.createAndReturnIdGenerated(item, ref DM);
                                                    if (itemIDGenerated == "")
                                                    {
                                                        summary.totalErrors++;
                                                        log = "ERROR: Could not export Item: " + item + "\n" + 
                                                                "Error Description: " + DM.Error_Mjs + "\n\n";
                                                        backgroundWorker1.ReportProgress(++progress);
                                                        System.Threading.Thread.Sleep(10);
                                                        errorInBOM = true;
                                                        break;
                                                    }
                                                    else
                                                    {
                                                        item.Id = long.Parse(itemIDGenerated);
                                                        log = "INFO: Item exported: " + item + "\n" + "Attempting to export its BOMLine\n";
                                                        backgroundWorker1.ReportProgress(progress);
                                                        System.Threading.Thread.Sleep(10);
                                                        itemList.Add(item);
                                                    }
                                                }

                                                log = "INFO: Attempting to export its BOM Line\n";
                                                backgroundWorker1.ReportProgress(progress);
                                                System.Threading.Thread.Sleep(10);

                                                BOMDetail bomDetail = new BOMDetail();
                                                bomDetail.Description = bom.Material;
                                                bomDetail.Qty = bom.NoRequired;
                                                bomDetail.Cost = bom.PartCost;
                                                bomDetail.SalesStatus = bom.Status;
                                                bomDetail.BomHeaderKey = long.Parse(bomIDGenerated);
                                                bomDetail.LinePosition = bom.MaterialPosition;
                                                bomDetail.ItemMasterkey = item.Id;
                                                if (!bomDetailCRUD.create(bomDetail, ref DM))
                                                {
                                                    summary.totalErrors++;
                                                    log = "ERROR: Could not export BOM Line: " + bomDetail + " Error: " + DM.Error_Mjs + "\n\n";
                                                    backgroundWorker1.ReportProgress(++progress);
                                                    System.Threading.Thread.Sleep(10);
                                                    errorInBOM = true;
                                                    break;
                                                }
                                                else
                                                {
                                                    log = "INFO: BOM Line exported: " + bomDetail + "\n";
                                                    backgroundWorker1.ReportProgress(progress);
                                                    System.Threading.Thread.Sleep(10);
                                                    //txtLog.AppendText("INFO: BOM Line exported: " + bomDetail + "\n");
                                                }
                                            }
                                        }
                                        if (errorInBOM)
                                            continue;
                                    }
                                    else
                                    {
                                        log = "INFO: No BOM Line found for SIF: " + sif + "\n";
                                        backgroundWorker1.ReportProgress(progress);
                                        System.Threading.Thread.Sleep(10);
                                        //txtLog.AppendText("INFO: No BOM Line found for SIF: " + sif + "\n");
                                    }
                                }                              
                            }
                            else
                            {
                                log = "INFO: No BOM Header found for SIF: " + sif + "\n";
                                backgroundWorker1.ReportProgress(progress);
                                System.Threading.Thread.Sleep(10);
                                //txtLog.AppendText("ERROR: Could not export BOM of SIF: " + sif + "\n");
                                //summary.totalErrors++;
                            }
                        }

                        /* End Transaction */
                        DM.CommitTransaction();
                        log = "SUCCESS: SIF exported: " + sif + "\n";
                        backgroundWorker1.ReportProgress(progress);
                        System.Threading.Thread.Sleep(10);
                        //txtLog.AppendText("SUCCESS: SIF exported: " + sif + "\n");
                        summary.totalSuccess++;
                    }
                    else
                    {
                        log = "OMITTED: SIF already exported: " + sif + "\n";
                        backgroundWorker1.ReportProgress(progress);
                        System.Threading.Thread.Sleep(10);
                        //txtLog.AppendText("OMITTED: SIF already exported: " + sif + "\n");
                        summary.totalOmitted++;
                    }
                    log = "\n";
                    backgroundWorker1.ReportProgress(++progress);
                    System.Threading.Thread.Sleep(10);
                }
            }
            else
            {
                log = "INFO: No more SIF to export.\n\n";
                backgroundWorker1.ReportProgress(progress);
                System.Threading.Thread.Sleep(10);
                //txtLog.AppendText("INFO: No more SIF to export.\n\n");
            }            
        }
        private void refreshSummary()
        {
            lblTotalErrors.Text = summary.totalErrors.ToString();
            lblTotalOmitted.Text = summary.totalOmitted.ToString();
            lblTotalSuccess.Text = summary.totalSuccess.ToString();
        }
        private void backgroundWorker1_DoWork(object sender, DoWorkEventArgs e)
        {
            export();
        }
        private void backgroundWorker1_ProgressChanged(object sender, ProgressChangedEventArgs e)
        {
            progressBar1.Value = e.ProgressPercentage;
            txtLog.AppendText(log);
            refreshSummary();
        }
        private void backgroundWorker1_RunWorkerCompleted(object sender, RunWorkerCompletedEventArgs e)
        {
            refreshSummary();
            txtLog.AppendText("\nProcess Completed.");            
        }
        private void frmExport_Load(object sender, EventArgs e)
        {
            txtLog.Text = "";
            backgroundWorker1.RunWorkerAsync();
        }

        private void txtLog_Resize(object sender, EventArgs e)
        {
            txtLog.ScrollToCaret();
        }       
    }
}