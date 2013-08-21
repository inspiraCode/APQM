using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Common interface for implement cruds to entities.
/// </summary>
public interface ICRUD<T>
{
    long create(T entity);
    T readById(long id);
    IList<T> readAll();
    bool update(T entity);
    bool delete(long id);
}
