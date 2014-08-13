public class Attachment
{
    private string fileName = ""; 
    private string comments = "";
    private string directory = "";

    public string Directory
    {
        get { return directory; }
        set { directory = value; }
    }

    public string FileName
    {
        get { return fileName; }
        set { fileName = value; }
    }
    public string Comments
    {
        get { return comments; }
        set { comments = value; }
    }
}