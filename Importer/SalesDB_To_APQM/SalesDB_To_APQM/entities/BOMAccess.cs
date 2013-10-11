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
    }
    public class BOMAccess
    {
        private string materialPosition = "";
        private string partNumber = ""; 
        private string material = ""; 
        private float partCost;
        private float noRequired;
        private string assemblyDescription = ""; 
        private string status = "";
        private string importComment = "";

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
    }
}
