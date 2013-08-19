using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Common interface for implement cruds to entities.
/// </summary>
public interface ICRUD<T>
{
    long create();
    string read();
    IList<T> readAll();    
    bool update();
    bool delete();
}
