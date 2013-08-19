using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Class for working with database for Supplier.
/// </summary>
public class SupplierDAO : ICRUD<Supplier>
{
    private Supplier supplier = new Supplier();
    private List<Supplier>  recordset = new List<Supplier>();
    public SupplierDAO()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    
    #region ICRUD<Supplier> Members

    public long create()
    {
        throw new NotImplementedException();
    }

    public string read()
    {
        throw new NotImplementedException();
    }

    public IList<Supplier> readAll()
    {
        recordset.Clear();

        Supplier example1 = new Supplier();
        Supplier example2 = new Supplier();

        example1.Id = 1;
        example1.SupplierName = "Un supplier";
        example1.ManufacturingLocation = "manufacturing location 1";
        example1.ShipLocation = "Un ship location";
        example1.QuotedCurrency = "un quoted currency";
        example1.ContactName = "contact de supplier 1";
        example1.ContactPhone = "6563-123-4567";
        example1.ContactEmail = "unEmail@email.com";

        example2.Id = 2;
        example2.SupplierName = "An other supplier";
        example2.ManufacturingLocation = "address one two three";
        example2.ShipLocation = "address of shipment :)";
        example2.QuotedCurrency = "a quoted curr";
        example2.ContactName = "contact of second supplier";
        example2.ContactPhone = "6563-123-6548";
        example2.ContactEmail = "mail@hotmail.com";

        recordset.Add(example1);
        recordset.Add(example2);

        return recordset;
    }

    public bool update()
    {
        throw new NotImplementedException();
    }

    public bool delete()
    {
        throw new NotImplementedException();
    }

    #endregion
}
