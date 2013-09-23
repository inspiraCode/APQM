using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Token
{
    private long id;
    private string tokenNumber = "";
    private long subjectKey = -1;
    private string subject = "";
    private DateTime deadDate = new DateTime(1985, 2, 10); 
    private string acnkowledgment = "";

    public string TokenNumber
    {
        get { return tokenNumber; }
        set { tokenNumber = value; }
    }
    public string Subject
    {
        get { return subject; }
        set { subject = value; }
    }
    public long SubjectKey
    {
        get { return subjectKey; }
        set { subjectKey = value; }
    }
    public DateTime DeadDate
    {
        get { return deadDate; }
        set { deadDate = value; }
    }
    public string Acnkowledgment
    {
        get { return acnkowledgment; }
        set { acnkowledgment = value; }
    }
    public long Id
    {
        get { return id; }
        set { id = value; }
    }   
}