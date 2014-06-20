using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class User
{
    private string userName = "";
    private string name = "";
    private string email = ""; 
    private string phone1 = "";
    private string phone2 = "";

    public string UserName
    {
        get { return userName; }
        set { userName = value; }
    }
    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    
    public string Email
    {
        get { return email; }
        set { email = value; }
    }
    public string Phone1
    {
        get { return phone1; }
        set { phone1 = value; }
    }
    public string Phone2
    {
        get { return phone2; }
        set { phone2 = value; }
    }
}