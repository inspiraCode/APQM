﻿namespace SalesDB_To_APQM
{
    partial class frmSelectData
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
            this.gridSIF = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtInquiryNumber = new System.Windows.Forms.TextBox();
            this.btnExportSelected = new System.Windows.Forms.Button();
            this.btnClearFilter = new System.Windows.Forms.Button();
            this.chkListStatus = new System.Windows.Forms.CheckedListBox();
            this.chkListSalesPerson = new System.Windows.Forms.CheckedListBox();
            this.label3 = new System.Windows.Forms.Label();
            this.lblTotalRecords = new System.Windows.Forms.Label();
            this.lblTotalSelected = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            ((System.ComponentModel.ISupportInitialize)(this.gridSIF)).BeginInit();
            this.statusStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // gridSIF
            // 
            this.gridSIF.AllowUserToAddRows = false;
            this.gridSIF.AllowUserToDeleteRows = false;
            this.gridSIF.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom)
                        | System.Windows.Forms.AnchorStyles.Left)
                        | System.Windows.Forms.AnchorStyles.Right)));
            this.gridSIF.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.gridSIF.Location = new System.Drawing.Point(12, 180);
            this.gridSIF.Name = "gridSIF";
            this.gridSIF.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.gridSIF.Size = new System.Drawing.Size(840, 227);
            this.gridSIF.TabIndex = 0;
            this.gridSIF.SelectionChanged += new System.EventHandler(this.gridSIF_SelectionChanged);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(329, 14);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(69, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Sales Person";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(609, 14);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(37, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Status";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(138, 14);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(78, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Inquiry Number";
            // 
            // txtInquiryNumber
            // 
            this.txtInquiryNumber.Location = new System.Drawing.Point(222, 11);
            this.txtInquiryNumber.Name = "txtInquiryNumber";
            this.txtInquiryNumber.Size = new System.Drawing.Size(101, 20);
            this.txtInquiryNumber.TabIndex = 8;
            this.txtInquiryNumber.TextChanged += new System.EventHandler(this.txtInquiryNumber_TextChanged);
            // 
            // btnExportSelected
            // 
            this.btnExportSelected.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.btnExportSelected.Location = new System.Drawing.Point(752, 413);
            this.btnExportSelected.Name = "btnExportSelected";
            this.btnExportSelected.Size = new System.Drawing.Size(100, 23);
            this.btnExportSelected.TabIndex = 9;
            this.btnExportSelected.Text = "Export Selected";
            this.btnExportSelected.UseVisualStyleBackColor = true;
            this.btnExportSelected.Click += new System.EventHandler(this.btnExportSelected_Click);
            // 
            // btnClearFilter
            // 
            this.btnClearFilter.Location = new System.Drawing.Point(12, 151);
            this.btnClearFilter.Name = "btnClearFilter";
            this.btnClearFilter.Size = new System.Drawing.Size(80, 23);
            this.btnClearFilter.TabIndex = 10;
            this.btnClearFilter.Text = "Clear Filter";
            this.btnClearFilter.UseVisualStyleBackColor = true;
            this.btnClearFilter.Click += new System.EventHandler(this.btnClearFilter_Click);
            // 
            // chkListStatus
            // 
            this.chkListStatus.CheckOnClick = true;
            this.chkListStatus.FormattingEnabled = true;
            this.chkListStatus.Location = new System.Drawing.Point(652, 13);
            this.chkListStatus.Name = "chkListStatus";
            this.chkListStatus.Size = new System.Drawing.Size(200, 154);
            this.chkListStatus.Sorted = true;
            this.chkListStatus.TabIndex = 11;
            this.chkListStatus.SelectedIndexChanged += new System.EventHandler(this.chkListStatus_SelectedIndexChanged);
            // 
            // chkListSalesPerson
            // 
            this.chkListSalesPerson.CheckOnClick = true;
            this.chkListSalesPerson.FormattingEnabled = true;
            this.chkListSalesPerson.Location = new System.Drawing.Point(404, 13);
            this.chkListSalesPerson.Name = "chkListSalesPerson";
            this.chkListSalesPerson.Size = new System.Drawing.Size(200, 154);
            this.chkListSalesPerson.Sorted = true;
            this.chkListSalesPerson.TabIndex = 12;
            this.chkListSalesPerson.SelectedIndexChanged += new System.EventHandler(this.chkListSalesPerson_SelectedIndexChanged);
            // 
            // label3
            // 
            this.label3.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 413);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(72, 13);
            this.label3.TabIndex = 13;
            this.label3.Text = "Total records:";
            // 
            // lblTotalRecords
            // 
            this.lblTotalRecords.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblTotalRecords.AutoSize = true;
            this.lblTotalRecords.Location = new System.Drawing.Point(91, 413);
            this.lblTotalRecords.Name = "lblTotalRecords";
            this.lblTotalRecords.Size = new System.Drawing.Size(0, 13);
            this.lblTotalRecords.TabIndex = 14;
            // 
            // lblTotalSelected
            // 
            this.lblTotalSelected.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.lblTotalSelected.AutoSize = true;
            this.lblTotalSelected.Location = new System.Drawing.Point(208, 413);
            this.lblTotalSelected.Name = "lblTotalSelected";
            this.lblTotalSelected.Size = new System.Drawing.Size(0, 13);
            this.lblTotalSelected.TabIndex = 16;
            // 
            // label6
            // 
            this.label6.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(130, 413);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(77, 13);
            this.label6.TabIndex = 15;
            this.label6.Text = "Total selected:";
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1});
            this.statusStrip1.Location = new System.Drawing.Point(0, 447);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(864, 22);
            this.statusStrip1.TabIndex = 17;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(255, 17);
            this.toolStripStatusLabel1.Text = "Reading Sales Inquiry Form Table. Please wait...";
            // 
            // frmSelectData
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(864, 469);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.lblTotalSelected);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.lblTotalRecords);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.chkListSalesPerson);
            this.Controls.Add(this.chkListStatus);
            this.Controls.Add(this.btnClearFilter);
            this.Controls.Add(this.btnExportSelected);
            this.Controls.Add(this.txtInquiryNumber);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.gridSIF);
            this.Name = "frmSelectData";
            this.Text = "Select Data";
            this.Load += new System.EventHandler(this.frmSelectData_Load);
            this.Shown += new System.EventHandler(this.frmSelectData_Shown);
            ((System.ComponentModel.ISupportInitialize)(this.gridSIF)).EndInit();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView gridSIF;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txtInquiryNumber;
        private System.Windows.Forms.Button btnExportSelected;
        private System.Windows.Forms.Button btnClearFilter;
        private System.Windows.Forms.CheckedListBox chkListStatus;
        private System.Windows.Forms.CheckedListBox chkListSalesPerson;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label lblTotalRecords;
        private System.Windows.Forms.Label lblTotalSelected;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
    }
}