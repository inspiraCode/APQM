using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Class for working with database for User Master
/// </summary>
public class UserCRUD : ICRUD<User>
{
   
    ConnectionManager connectionManager = new ConnectionManager();    
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public UserCRUD()
	{}
    
    #region ICRUD<User> Members

    public bool create(User entity)
    {
        ErrorOccur = false;
        bool result = false;        
        //DM = connectionManager.getDataManager();       
        //try
        //{            
        //    DM.Load_SP_Parameters("@PartNumber", entity.PartNumber);
        //    DM.Load_SP_Parameters("@PartDescription", entity.Description);
        //    DM.Load_SP_Parameters("@UM", entity.Um);
        //    DM.Load_SP_Parameters("@PartMaterial", entity.Material);
        //    DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
        //    DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
        //    DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
        //    DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
        //    DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
        //    DM.Load_SP_Parameters("@CommCode", entity.CommCode);
        //    //DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());

        //    result = DM.Execute_StoreProcedure("UserMaster_NewUser", true);

        //    ErrorOccur = DM.ErrorOccur;
        //    ErrorMessage = DM.Error_Mjs;
        //}
        //catch (Exception e)
        //{
        //    ErrorOccur = true;
        //    ErrorMessage = e.Message;
        //    return false;
        //}       

        return result;
    }

    public string createAndReturnIdGenerated(User entity)
    {
        ErrorOccur = false;
        string idGenerated = "";
        //DM = connectionManager.getDataManager();
        //try
        //{
        //    DM.Load_SP_Parameters("@PartNumber", entity.PartNumber);
        //    DM.Load_SP_Parameters("@PartDescription", entity.Description);
        //    DM.Load_SP_Parameters("@UM", entity.Um);
        //    DM.Load_SP_Parameters("@PartMaterial", entity.Material);
        //    DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
        //    DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
        //    DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
        //    DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
        //    DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
        //    DM.Load_SP_Parameters("@CommCode", entity.CommCode);
        //    //DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());

        //    idGenerated = DM.Execute_StoreProcedure_Scalar("UserMaster_NewUser", true);

        //    ErrorOccur = DM.ErrorOccur;
        //    ErrorMessage = DM.Error_Mjs;
        //}
        //catch (Exception e)
        //{
        //    ErrorOccur = true;
        //    ErrorMessage = e.Message;
        //    return "";
        //}

        return idGenerated;
    }


    public string createAndReturnIdGenerated(User entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        string idGenerated = "";
        //try
        //{
        //    DM.Load_SP_Parameters("@PartNumber", entity.PartNumber);
        //    DM.Load_SP_Parameters("@PartDescription", entity.Description);
        //    DM.Load_SP_Parameters("@UM", entity.Um);
        //    DM.Load_SP_Parameters("@PartMaterial", entity.Material);
        //    DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
        //    DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
        //    DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
        //    DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
        //    DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
        //    DM.Load_SP_Parameters("@CommCode", entity.CommCode);
        //    //DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());

        //    idGenerated = DM.Execute_StoreProcedure_Scalar_Open_Conn("UserMaster_NewUser", true);

        //    ErrorOccur = DM.ErrorOccur;
        //    ErrorMessage = DM.Error_Mjs;
        //}
        //catch (Exception e)
        //{
        //    ErrorOccur = true;
        //    ErrorMessage = e.Message;
        //    return "";
        //}

        return idGenerated;
    }
    public User readById(long id)
    {
        return null;
    }
    
    public User readById(string id)
    {
        User user = new User();

        string query = "SELECT UserName, Name, Email, Phone1, Phone2 " +
                        "FROM  UserProfile WHERE (UserName = @key)";
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key",id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if(table.Rows.Count > 0){
                user.UserName = table.Rows[0][0].ToString();
                user.Name = table.Rows[0][1].ToString();    
                user.Email= table.Rows[0][2].ToString();
                user.Phone1 = table.Rows[0][3].ToString();
                user.Phone2 = table.Rows[0][4].ToString();
                
                sqlConnection.Dispose();
                return user;
            }
        }
        return null;
    }

    public IList<User> readAll()
    {
        List<User>  recordset = new List<User>();
        //recordset.Clear();
        //DM = connectionManager.getDataManager();

        //string query = "SELECT UserMasterKey, PartNumber, Description, UM, Material, Cost, " +
        //                "CapsonicPN, CustomerPN, ManufacturePN, SupplierPN, CommCode " +  
        //                "FROM  UserMaster ORDER BY PartNumber";

        //DataTable table = new DataTable();
        //table = DM.Execute_Query(query);
       
        //for (int i = 0; i < table.Rows.Count; i++)
        //{
        //    User user = new User();
        //    user.Id = long.Parse(table.Rows[i][0].ToString());
        //    user.PartNumber = table.Rows[i][1].ToString();
        //    user.Description = table.Rows[i][2].ToString();
        //    user.Um = table.Rows[i][3].ToString();
        //    user.Material = table.Rows[i][4].ToString();
        //    user.Cost = float.Parse(table.Rows[i][5].ToString());
        //    user.CapsonicPN = table.Rows[i][6].ToString();
        //    user.CustomerPN = table.Rows[i][7].ToString();
        //    user.ManufacturePN = table.Rows[i][8].ToString();
        //    user.SupplierPN = table.Rows[i][9].ToString();
        //    user.CommCode = table.Rows[i][10].ToString();
        //    //user.EAU = int.Parse(table.Rows[i][11].ToString());

        //    recordset.Add(user);
        //}
       
        return recordset;
    }
    public List<User> getUsersWithRFQ()
    {
        List<User> result = new List<User>();
        string query = "SELECT distinct UserProfile.UserName, UserProfile.Name, UserProfile.Email, " +
                        "UserProfile.Phone1, UserProfile.Phone2 " +
                        "FROM  UserProfile INNER JOIN " +
                        "viewRFQHeader_ReadAll ON UserProfile.UserName = viewRFQHeader_ReadAll.[User] order by UserProfile.UserName";

        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            for (int i = 0; i < table.Rows.Count; i++)
            {
                User user = new User();
                user.UserName = table.Rows[i][0].ToString();
                user.Name = table.Rows[i][1].ToString();
                user.Email = table.Rows[i][2].ToString();
                user.Phone1 = table.Rows[i][3].ToString();
                user.Phone2 = table.Rows[i][4].ToString();
                
                result.Add(user);
            }
        }
        return result;
    }
    public bool update(User entity)
    {
        ErrorOccur = false;
        bool result = false;        
        //DM = connectionManager.getDataManager();
        //try
        //{
        //    DM.Load_SP_Parameters("@UserMasterKey", entity.Id.ToString());
        //    DM.Load_SP_Parameters("@PartNumber", entity.PartNumber);
        //    DM.Load_SP_Parameters("@PartDescription", entity.Description);
        //    DM.Load_SP_Parameters("@UM", entity.Um);
        //    DM.Load_SP_Parameters("@PartMaterial", entity.Material);
        //    DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
        //    DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
        //    DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
        //    DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
        //    DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
        //    DM.Load_SP_Parameters("@CommCode", entity.CommCode);
        //    //DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());

        //    result = DM.Execute_StoreProcedure("UserMaster_EditUser", true);

        //    ErrorOccur = DM.ErrorOccur;
        //    ErrorMessage = DM.Error_Mjs;
        //}
        //catch (Exception e)
        //{
        //    ErrorOccur = true;
        //    ErrorMessage = e.Message;
        //    return false;
        //}

        return result;
    }
    public bool update(User entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        //try
        //{
        //    DM.Load_SP_Parameters("@UserMasterKey", entity.Id.ToString());
        //    DM.Load_SP_Parameters("@PartNumber", entity.PartNumber);
        //    DM.Load_SP_Parameters("@PartDescription", entity.Description);
        //    DM.Load_SP_Parameters("@UM", entity.Um);
        //    DM.Load_SP_Parameters("@PartMaterial", entity.Material);
        //    DM.Load_SP_Parameters("@Cost", entity.Cost.ToString());
        //    DM.Load_SP_Parameters("@CapsonicPN", entity.CapsonicPN);
        //    DM.Load_SP_Parameters("@CustomerPN", entity.CustomerPN);
        //    DM.Load_SP_Parameters("@ManufacturePN", entity.ManufacturePN);
        //    DM.Load_SP_Parameters("@SupplierPN", entity.SupplierPN);
        //    DM.Load_SP_Parameters("@CommCode", entity.CommCode);
        //    //DM.Load_SP_Parameters("@EAU", entity.EAU.ToString());

        //    result = DM.Execute_StoreProcedure_Open_Conn("UserMaster_EditUser", true);

        //    ErrorOccur = DM.ErrorOccur;
        //    ErrorMessage = DM.Error_Mjs;
        //}
        //catch (Exception e)
        //{
        //    ErrorOccur = true;
        //    ErrorMessage = e.Message;
        //    return false;
        //}

        return result;
    }
    public bool delete(long id)
    {
        //ErrorOccur = false;
        //int rowsAffected=0;
        //string query = "DELETE FROM UserMaster WHERE UserMasterKey=@key";
        //SqlConnection sqlConnection = connectionManager.getConnection();
        //SqlCommand sqlCommand = null;
        //if (sqlConnection != null)
        //{
        //    try
        //    {
        //        sqlCommand = new SqlCommand(query, sqlConnection);
        //        sqlCommand.Parameters.AddWithValue("@key", id);
        //        sqlConnection.Open();
        //        rowsAffected = sqlCommand.ExecuteNonQuery();
        //        if (rowsAffected > 0)
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            ErrorOccur = true;
        //            ErrorMessage = "There were no rows affected for table: User.";
        //            return true;
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        ErrorOccur = true;
        //        ErrorMessage = e.Message;
        //        //using return false below
        //    }
        //    finally
        //    {
        //        sqlConnection.Dispose();
        //        sqlCommand.Dispose();               
        //    }           
        //}
        //else
        //{
        //    ErrorOccur = true;
        //    ErrorMessage = "Error. Could not connect to database.";
        //}
        return false;
    }

    #endregion
}
