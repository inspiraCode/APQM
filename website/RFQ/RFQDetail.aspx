<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RFQDetail.aspx.cs" Inherits="RFQ_RFQDetail" %>

<%@ Register src="rfqDetailList.ascx" tagname="rfqDetailList" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RFQ Detail</title>
</head>
<body>
    <form id="form1" runat="server">
    <div id="RFQDetailContainer">
        
        <uc1:rfqDetailList ID="uscRFQDetailList" runat="server" />
        
    </div>
    </form>
</body>
</html>
