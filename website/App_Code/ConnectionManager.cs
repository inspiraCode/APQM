using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

/// <summary>
/// Summary description for ConnectionManager
/// </summary>
public class ConnectionManager
{
    private static string user = "APQMAPP";
    private static string server = "capsp";
    private static string pass = "capsonic";
    private static string database = "APQM_DB";

    private Data_Mng.SQL_DTMG DMG;
    
    public Data_Mng.SQL_DTMG getDataManager(){
        try
        {
            DMG = new Data_Mng.SQL_DTMG(server, database, user, pass);
            return DMG;
        }
        catch (Exception e)
        {   //TODO: log e in a future
            return null;
        }
    }

    public SqlConnection getConnection() 
    {
        string sql_con = "Data Source=" + server + ";Initial Catalog=" + database + ";Persist Security Info=True;User ID=" + user + ";Password=" + pass;
        SqlConnection sqlConnection = new SqlConnection(sql_con);
        return sqlConnection;
    }

}
