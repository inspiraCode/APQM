using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Objects to save in Session should be saved with this wrapper.
/// </summary>
public class SessionObject
{
    private string status = "";
    private Object content = null;

    public string Status
    {
        get { return status; }
        set { status = value; }
    }

    public Object Content
    {
        get { return content; }
        set { content = value; }
    }
}
