using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// This class will be the common response to client operations.
/// </summary>
public class GatewayResponse
{
    private object result = null;
    private bool errorThrown = false;
    private string responseDescription = "";

    public bool ErrorThrown
    {
        get { return errorThrown; }
        set { errorThrown = value; }
    }

    public string ResponseDescription
    {
        get { return responseDescription; }
        set { responseDescription = value; }
    }

    public object Result
    {
        get { return result; }
        set { result = value; }
    }
}