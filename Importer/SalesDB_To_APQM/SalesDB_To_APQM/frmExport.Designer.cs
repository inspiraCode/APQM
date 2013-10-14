namespace SalesDB_To_APQM
{
    partial class frmExport
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.progressBar1 = new System.Windows.Forms.ProgressBar();
            this.label2 = new System.Windows.Forms.Label();
            this.lblTotalErrors = new System.Windows.Forms.Label();
            this.lbllTotalSu = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.lblTotalOmitted = new System.Windows.Forms.Label();
            this.lblTotalSuccess = new System.Windows.Forms.Label();
            this.txtLog = new System.Windows.Forms.RichTextBox();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.SuspendLayout();
            // 
            // progressBar1
            // 
            this.progressBar1.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.progressBar1.Location = new System.Drawing.Point(13, 177);
            this.progressBar1.Name = "progressBar1";
            this.progressBar1.Size = new System.Drawing.Size(429, 23);
            this.progressBar1.TabIndex = 5;
            // 
            // label2
            // 
            this.label2.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 203);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(64, 13);
            this.label2.TabIndex = 7;
            this.label2.Text = "Total Errors:";
            // 
            // lblTotalErrors
            // 
            this.lblTotalErrors.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblTotalErrors.AutoSize = true;
            this.lblTotalErrors.Location = new System.Drawing.Point(82, 203);
            this.lblTotalErrors.Name = "lblTotalErrors";
            this.lblTotalErrors.Size = new System.Drawing.Size(13, 13);
            this.lblTotalErrors.TabIndex = 8;
            this.lblTotalErrors.Text = "0";
            // 
            // lbllTotalSu
            // 
            this.lbllTotalSu.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lbllTotalSu.AutoSize = true;
            this.lbllTotalSu.Location = new System.Drawing.Point(261, 203);
            this.lbllTotalSu.Name = "lbllTotalSu";
            this.lbllTotalSu.Size = new System.Drawing.Size(78, 13);
            this.lbllTotalSu.TabIndex = 12;
            this.lbllTotalSu.Text = "Total Success:";
            // 
            // label8
            // 
            this.label8.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(134, 203);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(73, 13);
            this.label8.TabIndex = 13;
            this.label8.Text = "Total Omitted:";
            // 
            // lblTotalOmitted
            // 
            this.lblTotalOmitted.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblTotalOmitted.AutoSize = true;
            this.lblTotalOmitted.Location = new System.Drawing.Point(213, 203);
            this.lblTotalOmitted.Name = "lblTotalOmitted";
            this.lblTotalOmitted.Size = new System.Drawing.Size(13, 13);
            this.lblTotalOmitted.TabIndex = 14;
            this.lblTotalOmitted.Text = "0";
            // 
            // lblTotalSuccess
            // 
            this.lblTotalSuccess.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblTotalSuccess.AutoSize = true;
            this.lblTotalSuccess.Location = new System.Drawing.Point(345, 203);
            this.lblTotalSuccess.Name = "lblTotalSuccess";
            this.lblTotalSuccess.Size = new System.Drawing.Size(13, 13);
            this.lblTotalSuccess.TabIndex = 15;
            this.lblTotalSuccess.Text = "0";
            // 
            // txtLog
            // 
            this.txtLog.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.txtLog.Location = new System.Drawing.Point(12, 12);
            this.txtLog.Name = "txtLog";
            this.txtLog.Size = new System.Drawing.Size(430, 159);
            this.txtLog.TabIndex = 16;
            this.txtLog.Text = "";
            // 
            // backgroundWorker1
            // 
            this.backgroundWorker1.WorkerReportsProgress = true;
            this.backgroundWorker1.DoWork += new System.ComponentModel.DoWorkEventHandler(this.backgroundWorker1_DoWork);
            this.backgroundWorker1.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.backgroundWorker1_RunWorkerCompleted);
            this.backgroundWorker1.ProgressChanged += new System.ComponentModel.ProgressChangedEventHandler(this.backgroundWorker1_ProgressChanged);
            // 
            // frmExport
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(455, 225);
            this.Controls.Add(this.txtLog);
            this.Controls.Add(this.lblTotalSuccess);
            this.Controls.Add(this.lblTotalOmitted);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.lbllTotalSu);
            this.Controls.Add(this.lblTotalErrors);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.progressBar1);
            this.Name = "frmExport";
            this.Text = "SalesDB To APQM";
            this.Load += new System.EventHandler(this.frmExport_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ProgressBar progressBar1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label lblTotalErrors;
        private System.Windows.Forms.Label lbllTotalSu;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label lblTotalOmitted;
        private System.Windows.Forms.Label lblTotalSuccess;
        private System.Windows.Forms.RichTextBox txtLog;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
    }
}

