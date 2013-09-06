﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customer
/// </summary>
public class Customer
{
    private long id;
    private string customerName = "";

    public long Id
    {
        get { return id; }
        set { id = value; }
    }    

    public string CustomerName
    {
        get { return customerName; }
        set { customerName = value; }
    }
}