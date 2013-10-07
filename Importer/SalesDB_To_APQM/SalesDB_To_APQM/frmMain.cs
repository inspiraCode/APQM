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
        public frmMain()
        {
            InitializeComponent();
        }
        private void btnExport_Click(object sender, EventArgs e)
        {
            List<SIF> sifs = (List<SIF>) new sifAccessCRUD().readAll();
            sifCRUD sif_CRUD = new sifCRUD();
            if(sifs.Count > 0){
                foreach (SIF sif in sifs)
                {
                    if (sif_CRUD.readByInquiryNumber(sif.InquiryNumber) == null)
                    {                        
                        if (!sif_CRUD.create(sif))
                        {
                            break;
                        }
                    }
                }
            }
        }
    }
}