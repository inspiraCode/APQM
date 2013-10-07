using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace SalesDB_To_APQM
{
    class AccessConfigurationManager
    {
        private static string datasource = "Sales Database.mdb";
       
        // private Data_Mng.SQL_DTMG DMG;
        private Data_Base_MNG.Access DMG;

        public Data_Base_MNG.Access getDataManager()
        {
            string sConn = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=\" + datasource +  ";Jet OLEDB:Database";
            try
            {
                DMG = new Data_Base_MNG.Access(datasource);
                return DMG;
            }
            catch (Exception e)
            {   //TODO: log e in a future
                return null;
            }
        }        
    }
}
