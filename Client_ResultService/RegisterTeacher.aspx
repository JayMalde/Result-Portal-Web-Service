<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterTeacher.aspx.cs" Inherits="Client_ResultService.RegisterTeacher" %>
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
        .register { 
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
        .register h1 
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
        <a class="nav-item" href="LoginPage.aspx">Login Page</a>
        <a class="nav-item" href="ShowResult.aspx">Show Result</a>
    </div>   
    <form id="form1" runat="server">
        <div class="register">
            <h1>Registration Page</h1>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    Teacher ID
                    <asp:TextBox ID="teacher_id" CssClass="label" runat="server"></asp:TextBox>
                    Teacher Name
                    <asp:TextBox ID="teacher_name" CssClass="label" runat="server"></asp:TextBox>
                    Teacher Email                        
                    <asp:TextBox ID="teacher_email" CssClass="label" runat="server"></asp:TextBox>
                    Teacher Password
                    <asp:TextBox ID="teacher_password" CssClass="label" runat="server"></asp:TextBox>
                    Teacher College Name
                    <asp:TextBox ID="teacher_college_name" CssClass="label" runat="server"></asp:TextBox>
                    <asp:Button ID="register_teacher" CssClass="btn-primary" OnClick="Register_Teacher" runat="server" Text="Register Teacher" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="register_teacher" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>