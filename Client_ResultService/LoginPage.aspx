<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Client_ResultService.LoginPage" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        *{
            margin:0;
            padding:0;
  
            }
        body { 
                font-family: 'Open Sans', sans-serif;
                background: #c2dddb;
                font-size: 18px;
                text-align: center;
                letter-spacing: 1.2px;
                overflow: hidden;
                color: black;
                margin: 0;
            }
        .login { 
            position: absolute;
            top: 40%;
            left: 50%;
            margin: -150px 0 0 -150px;
            width: 400px;
            height: 400px;
        }
        .btn-primary
        { 
            background-color: #4a77d4; 
        }
        .login h1 
        { 
            color: #fff; 
            text-shadow: 0 0 10px rgba(0,0,0,0.3); 
            letter-spacing: 1px; 
            text-align: center; 
        }
        input 
        { 
            width: 100%; 
            margin-bottom: 10px; 
            background: rgba(0,0,0,0.3);
            border: none;
            outline: none;
            padding: 10px;
            font-size: 18px;
            color: white;
            text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
            border: 1px solid rgba(0,0,0,0.3);
            border-radius: 4px;
        }
        .label{ color: white; }
        .topnav 
        {
            overflow: hidden;
            background-color: #333333;
        }
        .topnav .nav-item 
        {
            float: left;
            color: white;
            text-align: center;
            padding: 18px 24px;
            text-decoration: none;
            font-size: 20px;
        }
        .button 
        {
            color: white;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            border-radius: 5px;
        }
        .topnav .nav-item:hover 
        {
            background-color: #ddd;
            color: black;
        }
    </style>
</head>
<body>
    <div class="topnav">
        <a class="nav-item" href="RegisterTeacher.aspx">Register</a>
        <a class="nav-item" href="ShowResult.aspx">Show Result</a>
    </div>   
    <div class="login">
        <form id="form1" runat="server">  
            <h1>Welcome To Online Results Portal</h1>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    Teacher Email
                    <asp:TextBox ID="teacher_email" CssClass="label" runat="server"></asp:TextBox>
                    Teacher Password        
                    <asp:TextBox ID="teacher_password" CssClass="label" runat="server"></asp:TextBox>
                    <asp:Button ID="Login_Button" CssClass="btn-primary" OnClick="Login_Click" runat="server" Text="Login" />
                    If New <a href="RegisterTeacher.aspx" style="text-decoration: none;">Register Here</a> 
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="Login_Button" EventName="Click" />
                </Triggers>       
            </asp:UpdatePanel>
        </form>
    </div>
</body>
</html>