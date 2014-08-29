using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.IO;
using System.Configuration;

public partial class WebService_BOM : System.Web.UI.Page
{
    bomCRUD bom_CRUD = new bomCRUD();
    bomDetailCRUD bomDetail_CRUD = new bomDetailCRUD();
    RfqCRUD rfq_CRUD = new RfqCRUD();
    sifDetailCRUD sif_detail_CRUD = new sifDetailCRUD();
    itemCRUD item_CRUD = new itemCRUD();


    protected void Page_Load(object sender, EventArgs e)
    {


        if (Request["ATTACHMENTSFOLDER"] != null)
        {
            if (getPostedAttachments()) return;
        }

        if (Request["cmd"] == null)
            return;

        string cmd = Request["cmd"].ToString();

        switch (cmd)
        {
            case "read":
                Response.Clear();
                Response.Write(getBOMbyID(long.Parse(Request["id"])));
                Response.End();
                return;
            case "update":
                Response.Clear();
                Response.Write(saveBOM());
                Response.End();
                return;
            case "delete":
                deleteBOMLinebyID(long.Parse(Request["id"]));
                return;
            case "deleteAttachment":
                deleteAttachment(Request["Directory"], Request["FileName"], "BOMLineAttachments");
                return;
            case "downloadAttachment":
                downloadAttachment(Request["Directory"], Request["FileName"], "BOMLineAttachments");
                return;
            case "deleteBOM":
                deleteBOMbyID(long.Parse(Request["id"]));
                return;
            case "createBOM":
                Response.Clear();
                Response.Write(createBOM(long.Parse(Request["sif_id"])));
                Response.End();
                return;
        }
    }
    public bool getPostedAttachments()
    {
        HttpPostedFile file = Request.Files["myfile"];
        HttpFileCollection fileCollection = Request.Files;
        string strAppSettingsFolder = "BOMLineAttachments";
        string folderName = Request["ATTACHMENTSFOLDER"];

        if (file != null && strAppSettingsFolder != null && strAppSettingsFolder.Trim() != "" && folderName != null && folderName.Trim() != "")
        {
            string fileName = file.FileName;
            HttpPostedFile postedFile = file;

            string baseAttachmentsPath = ConfigurationManager.AppSettings[strAppSettingsFolder];

            string currentPathAttachments = baseAttachmentsPath + folderName;

            if (!Directory.Exists(currentPathAttachments))
            {
                Directory.CreateDirectory(currentPathAttachments);
            }
            currentPathAttachments += @"\";

            postedFile.SaveAs(currentPathAttachments + Path.GetFileName(postedFile.FileName));

            Response.Clear();
            Response.Write("[{\"FolderName\":\"" + folderName + "\"}," + JsonConvert.SerializeObject(getAttachmentsFromFolder(folderName, strAppSettingsFolder)) + "]");
            Response.End();
            return true;
        }
        return false;
    }
    public void downloadAttachment(string strDirectory, string strFileName, string appSettingsFolder)
    {
        string baseAttachmentsPath = ConfigurationManager.AppSettings[appSettingsFolder];
        string filePath = baseAttachmentsPath + strDirectory + "\\" + strFileName;
        FileInfo file = new FileInfo(filePath);
        Response.AddHeader("Content-Disposition", "attachment;filename=" + file.Name);
        Response.TransmitFile(filePath);
        Response.End();
    }
    public void deleteAttachment(string strDirectory, string strFileName, string appSettingsFolder)
    {
        string baseAttachmentsPath = ConfigurationManager.AppSettings[appSettingsFolder];
        string filePath = baseAttachmentsPath + strDirectory + "\\" + strFileName;
        FileInfo file = new FileInfo(filePath);
        file.Delete();
        Response.Clear();
        Response.Write("{\"Result\":\"" + "Attachment deleted succesfully." + "\"}");
        Response.End();
    }
    private string getBOMbyID(long bomID)
    {
        BOM bomHeader = bom_CRUD.readById(bomID);

        if (bomHeader == null) bomHeader = new BOM();

        bomHeader.BomDetail = bomDetail_CRUD.readByParentID(bomID);


        foreach (BOMDetail bomLine in bomHeader.BomDetail)
        {
            bomLine.AttachmentsList = getAttachmentsFromFolder(bomLine.AttachmentsFolder, "BOMLineAttachments");
        }

        bomHeader.SifDetail = sif_detail_CRUD.readByParentID(bomHeader.SifId);

        return JsonConvert.SerializeObject(bomHeader);
    }
    public List<Attachment> getAttachmentsFromFolder(string folderName, string appSettingsFolder)
    {
        List<Attachment> attachmentsList = new List<Attachment>();
        string baseAttachmentsPath = ConfigurationManager.AppSettings[appSettingsFolder];
        if (folderName != "" && Directory.Exists(baseAttachmentsPath + folderName.Trim()))
        {
            DirectoryInfo directory = new DirectoryInfo(baseAttachmentsPath + folderName);
            foreach (FileInfo file in directory.GetFiles())
            {
                Attachment attachment = new Attachment();
                attachment.FileName = file.Name;
                attachment.Directory = folderName;
                attachmentsList.Add(attachment);
            }
        }
        return attachmentsList;
    }
    private string saveBOM()
    {
        String s = new StreamReader(Request.InputStream).ReadToEnd();
        BOM bomHeader = JsonConvert.DeserializeObject<BOM>(s);

        List<Item> itemList = (List<Item>)item_CRUD.readAll();


        /*Begin Transaction*/
        ConnectionManager CM = new ConnectionManager();
        Data_Base_MNG.SQL DM = CM.getDataManager();

        DM.Open_Connection("BOM Update");
        if (!bom_CRUD.update(bomHeader, ref DM))
        {
            return "ERROR:" + bom_CRUD.ErrorMessage;
        }

        foreach (BOMDetail bomLine in bomHeader.BomDetail)
        {
            Item item = readByPartNumberInList(bomLine, itemList);
            if (item == null)
            {
                item = new Item();
                item.PartNumber = bomLine.PartNumber.Trim();
                item.Cost = bomLine.Cost;
                item.Um = bomLine.Um;
                item.Material = bomLine.Material;
                item.CommCode = bomLine.CommCode;

                string itemIDGenerated = item_CRUD.createAndReturnIdGenerated(item, ref DM);
                if (itemIDGenerated == "")
                {
                    return "ERROR: Could not export Item: " + item + "\n" +
                            "Error Description: " + DM.Error_Mjs;
                }
                else
                {
                    item.Id = long.Parse(itemIDGenerated);
                    itemList.Add(item);
                }
            }
            else
            {
                item.PartNumber = bomLine.PartNumber.Trim();
                item.Cost = bomLine.Cost;
                item.Um = bomLine.Um;
                item.Material = bomLine.Material;
                item.CommCode = bomLine.CommCode;

                if (!item_CRUD.update(item, ref DM))
                {
                    return "ERROR:" + item_CRUD.ErrorMessage;
                }
            }

            if (bomLine.Id > 0)
            {
                bomLine.ItemMasterkey = item.Id;
                if (!bomDetail_CRUD.update(bomLine, ref DM))
                {
                    return "ERROR:" + bomDetail_CRUD.ErrorMessage;
                }
            }
            else
            {
                bomLine.BomHeaderKey = bomHeader.Id;
                bomLine.ItemMasterkey = item.Id;
                bomLine.Status = "Created";
                if (!bomDetail_CRUD.create(bomLine, ref DM))
                {
                    return "ERROR:" + bomDetail_CRUD.ErrorMessage;
                }
            }
        }

        DM.CommitTransaction();
        DM.Close_Open_Connection();

        if (DM.ErrorOccur)
        {
            return "ERROR:" + DM.Error_Mjs;
        }

        return getBOMbyID(bomHeader.Id);
    }
    private Item readByPartNumberInList(BOMDetail bom, List<Item> list)
    {
        foreach (Item item in list)
        {
            if (item.PartNumber.Trim().ToLower() == bom.PartNumber.Trim().ToLower())
            {
                return item;
            }
        }
        return null;
    }
    public void deleteBOMLinebyID(long idBOMLine)
    {
        string response = "{\"Result\":\"" + "OK" + "\"}";
        if (!bomDetail_CRUD.setActive(idBOMLine, 0))
        {
            response = "ERROR:" + rfq_CRUD.ErrorMessage;
        }
        Response.Clear();
        Response.Write(response);
        Response.End();
    }
    public void deleteBOMbyID(long id)
    {
        
        string response = "{\"Result\":\"" + "OK" + "\"}";
        if (!bom_CRUD.setActive(id, 0))
        {
            response = "ERROR:" + bom_CRUD.ErrorMessage;
        }
        Response.Clear();
        Response.Write(response);
        Response.End();
    }

    public String createBOM(long sif_id){
        GatewayResponse response = new GatewayResponse();

        BOM bom =new BOM();
        bom.SifId = sif_id;
        string idGenerated = bom_CRUD.createAndReturnIdGenerated(bom);
        if (!bom_CRUD.ErrorOccur)
        {
            response.ErrorThrown = false;
            response.ResponseDescription = "BOM created successfully.";
            response.Result =idGenerated;
        }
        else
        {
            response.ErrorThrown = true;
            response.ResponseDescription = bom_CRUD.ErrorMessage;
        }
        return JsonConvert.SerializeObject(response);
    }
}