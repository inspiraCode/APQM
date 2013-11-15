using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SalesDB_To_APQM.entities
{
    public class BOMHeaderAccess
    {
        private string topPartNumber = "";
        private string partDescription = ""; 
        private string revision = "";
        private long marketSectorID = -1;

        public string TopPartNumber
        {
            get { return topPartNumber; }
            set { topPartNumber = value; }
        }
        public string PartDescription
        {
            get { return partDescription; }
            set { partDescription = value; }
        }
        public string Revision
        {
            get { return revision; }
            set { revision = value; }
        }
        public long MarketSectorID
        {
            get { return marketSectorID; }
            set { marketSectorID = value; }
        }
    }
    public class BOMAccess
    {
        private string materialPosition = "";
        private string partNumber = ""; 
        private string material = ""; 
        private float partCost;
        private float noRequired;
        private string assemblyDescription = ""; //Wont be used anymore
        private string status = "";
        private string importComment = "";
        private string salesComments = ""; //Wont be used anymore
        private string vendorQuoteEst = "";
        private string capComAssm = "";
        private string commCode = "";

       

        public string MaterialPosition
        {
            get { return materialPosition; }
            set { materialPosition = value; }
        }
        public string PartNumber
        {
            get { return partNumber; }
            set { partNumber = value; }
        }
        public string Material
        {
            get { return material; }
            set { material = value; }
        }
        public float PartCost
        {
            get { return partCost; }
            set { partCost = value; }
        }
        public float NoRequired
        {
            get { return noRequired; }
            set { noRequired = value; }
        }
        public string AssemblyDescription
        {
            get { return assemblyDescription; }
            set { assemblyDescription = value; }
        }
        public string Status
        {
            get { return status; }
            set { status = value; }
        }
        public string ImportComment
        {
            get { return importComment; }
            set { importComment = value; }
        }
        public string VendorQuoteEst
        {
            get { return vendorQuoteEst; }
            set { vendorQuoteEst = value; }
        }
        public string SalesComments
        {
            get { return salesComments; }
            set { salesComments = value; }
        }
        public string CapComAssm
        {
            get { return capComAssm; }
            set { capComAssm = value; }
        }
        public string CommCode
        {
            get { return commCode; }
            set { commCode = value; }
        }
        public override string ToString()
        {
            return "{Part Number: " + this.partNumber + " Material: " + this.material + " Part Cost: " + this.partCost + " No Required: " + this.noRequired + " Assembly Description: " + assemblyDescription + "}";
        }
    }
}
