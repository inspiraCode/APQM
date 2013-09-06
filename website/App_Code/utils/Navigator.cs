using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SessionManager
/// </summary>
public static class Navigator
{
    private static void clearSession()
    {        
        HttpContext.Current.Session.Remove("SIF");
        HttpContext.Current.Session.Remove("BOM");
        HttpContext.Current.Session.Remove("RFQ");
        HttpContext.Current.Session.Remove("Supplier");
    }
    public static void goToPage(string page, string section)
    {
        clearSession();
        SessionObject so = new SessionObject();
        so.Content = section;
        HttpContext.Current.Session["SECTION"] = so;
        HttpContext.Current.Response.Redirect(page);
    }
}
