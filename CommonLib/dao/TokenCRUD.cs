using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Class for working with database for Token Master
/// </summary>
public class TokenCRUD : ICRUD<Token>
{
   
    ConnectionManager connectionManager = new ConnectionManager();    
    Data_Base_MNG.SQL DM;

    public bool ErrorOccur = false;
    public string ErrorMessage = "";

    public TokenCRUD()
	{}
    
    #region ICRUD<Token> Members

    public bool create(Token entity)
    {
        ErrorOccur = false;
        bool result = false;        
        DM = connectionManager.getDataManager();       
        try
        {            
            DM.Load_SP_Parameters("@Token", entity.TokenNumber);
            DM.Load_SP_Parameters("@Subject", entity.Subject);
            DM.Load_SP_Parameters("@SubjectKey", entity.SubjectKey.ToString());
            DM.Load_SP_Parameters("@DeadDate", entity.DeadDate.ToString());
            DM.Load_SP_Parameters("@Acknowledgement", entity.Acnkowledgment);

            result = DM.Execute_StoreProcedure("TokenMaster_NewToken", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }       

        return result;
    }
    public bool create(Token entity, ref Data_Base_MNG.SQL DM)
    {
        ErrorOccur = false;
        bool result = false;
        try
        {
            DM.Load_SP_Parameters("@Token", entity.TokenNumber);
            DM.Load_SP_Parameters("@Subject", entity.Subject);
            DM.Load_SP_Parameters("@SubjectKey", entity.SubjectKey.ToString());
            DM.Load_SP_Parameters("@DeadDate", entity.DeadDate.ToString());
            DM.Load_SP_Parameters("@Acknowledgement", entity.Acnkowledgment);

            result = DM.Execute_StoreProcedure_Open_Conn("TokenMaster_NewToken", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }
    public string createAndReturnIdGenerated(Token entity)
    {
        ErrorOccur = false;
        string idGenerated = "";
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@Token", entity.TokenNumber);
            DM.Load_SP_Parameters("@Subject", entity.Subject);
            DM.Load_SP_Parameters("@SubjectKey", entity.SubjectKey.ToString());
            DM.Load_SP_Parameters("@DeadDate", entity.DeadDate.ToString());
            DM.Load_SP_Parameters("@Acknowledgement", entity.Acnkowledgment);

            idGenerated = DM.Execute_StoreProcedure_Scalar("TokenMaster_NewToken", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return "";
        }

        return idGenerated;
    }

    public Token readById(long id)
    {
        Token token = new Token();

        string query = "SELECT TokenKey, Token, Subject, SubjectKey, DeadDate, Acknowledgement FROM TokenMaster WHERE (TokenKey = @key)";
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key",id);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if(table.Rows.Count > 0){
                token.Id = long.Parse(table.Rows[0][0].ToString());
                token.TokenNumber = table.Rows[0][1].ToString();    
                token.Subject= table.Rows[0][2].ToString();
                token.SubjectKey= long.Parse(table.Rows[0][3].ToString());
                token.DeadDate= DateTime.Parse( table.Rows[0][4].ToString());
                token.Acnkowledgment = table.Rows[0][5].ToString();
                
                sqlConnection.Dispose();
                return token;
            }
        }
        return null;
    }

    public Token readByToken(string sToken)
    {
        Token token = new Token();

        string query = "SELECT TokenKey, Token, Subject, SubjectKey, DeadDate, Acknowledgement FROM TokenMaster WHERE (Token = @key)";
        DataTable table = new DataTable();
        SqlConnection sqlConnection = connectionManager.getConnection();
        if (sqlConnection != null)
        {
            SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
            sqlCommand.Parameters.AddWithValue("@key", sToken);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            sqlDataAdapter.Fill(table);

            if (table.Rows.Count > 0)
            {
                token.Id = long.Parse(table.Rows[0][0].ToString());
                token.TokenNumber = table.Rows[0][1].ToString();
                token.Subject = table.Rows[0][2].ToString();
                token.SubjectKey = long.Parse(table.Rows[0][3].ToString());
                token.DeadDate = DateTime.Parse(table.Rows[0][4].ToString());
                token.Acnkowledgment = table.Rows[0][5].ToString();

                sqlConnection.Dispose();
                return token;
            }
        }
        return null;
    }

    public IList<Token> readAll()
    {
        List<Token>  recordset = new List<Token>();
        recordset.Clear();
        DM = connectionManager.getDataManager();

        string query = "SELECT TokenKey, Token, Subject, SubjectKey, DeadDate, Acknowledgement FROM TokenMaster " +
                        "ORDER BY TokenKey DESC";

        DataTable table = new DataTable();
        table = DM.Execute_Query(query);
       
        for (int i = 0; i < table.Rows.Count; i++)
        {
            Token token = new Token();
            token.Id = long.Parse(table.Rows[i][0].ToString());
            token.TokenNumber = table.Rows[i][1].ToString();
            token.Subject = table.Rows[i][2].ToString();
            token.SubjectKey = long.Parse(table.Rows[i][3].ToString());
            token.DeadDate = DateTime.Parse(table.Rows[i][4].ToString());
            token.Acnkowledgment = table.Rows[i][5].ToString();

            recordset.Add(token);
        }
       
        return recordset;
    }

    public bool update(Token entity)
    {
        ErrorOccur = false;
        bool result = false;        
        DM = connectionManager.getDataManager();
        try
        {
            DM.Load_SP_Parameters("@TokenKey", entity.Id.ToString());
            DM.Load_SP_Parameters("@Token", entity.TokenNumber);
            DM.Load_SP_Parameters("@Subject", entity.Subject);
            DM.Load_SP_Parameters("@SubjectKey", entity.SubjectKey.ToString());
            DM.Load_SP_Parameters("@DeadDate", entity.DeadDate.ToString());
            DM.Load_SP_Parameters("@Acknowledgement", entity.Acnkowledgment);

            result = DM.Execute_StoreProcedure("TokenMaster_EditToken", true);

            ErrorOccur = DM.ErrorOccur;
            ErrorMessage = DM.Error_Mjs;
        }
        catch (Exception e)
        {
            ErrorOccur = true;
            ErrorMessage = e.Message;
            return false;
        }

        return result;
    }
    public bool delete(long id)
    {
        ErrorOccur = false;
        int rowsAffected=0;
        string query = "DELETE FROM TokenMaster WHERE TokenKey=@key";
        SqlConnection sqlConnection = connectionManager.getConnection();
        SqlCommand sqlCommand = null;
        if (sqlConnection != null)
        {
            try
            {
                sqlCommand = new SqlCommand(query, sqlConnection);
                sqlCommand.Parameters.AddWithValue("@key", id);
                sqlConnection.Open();
                rowsAffected = sqlCommand.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    return true;
                }
                else
                {
                    ErrorOccur = true;
                    ErrorMessage = "There were no rows affected for table: Token.";
                }
            }
            catch (Exception e)
            {
                ErrorOccur = true;
                ErrorMessage = e.Message;
                //using return false below
            }
            finally
            {
                sqlConnection.Dispose();
                sqlCommand.Dispose();               
            }
        }
        else
        {
            ErrorOccur = true;
            ErrorMessage = "Error. Could not connect to database.";
        }
        return false;
    }

    #endregion
}