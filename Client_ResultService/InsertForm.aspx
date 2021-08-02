<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertForm.aspx.cs" Inherits="Client_ResultService.InsertForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        *
        {
            margin:0;
            padding:0;
        }
        body
        {
            font-family: 'Open Sans', sans-serif;
            background: #c2dddb;
            font-size: 18px;
            text-align: center;
            letter-spacing: 1.2px;
            overflow: hidden;
            color: black;
            margin: 0;
        }
        .insert 
        { 
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
        .insert h1 
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
        <a class="nav-item active" href="TeacherDashboard.aspx">Dashboard</a>
        <a class="nav-item" href="#">Logged in as Teacher ID : <%= Session["teacher_id"].ToString() %></a>
        <a class="nav-item" style="float:right" href="Logout.aspx">Logout</a>
    </div>
    <div class="insert">
    <form id="form1" runat="server">
        
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    Roll No<asp:TextBox ID="rollno" CssClass="label" runat="server"></asp:TextBox>
                    User Name<asp:TextBox ID="name" CssClass="label" runat="server"></asp:TextBox>
                    Subject1<asp:TextBox ID="subject1" CssClass="label" runat="server"></asp:TextBox>
                    Subject2<asp:TextBox ID="subject2" CssClass="label" runat="server"></asp:TextBox>
                    Subject3<asp:TextBox ID="subject3" CssClass="label" runat="server"></asp:TextBox>
                    Subject4<asp:TextBox ID="subject4" CssClass="label" runat="server"></asp:TextBox>
                    Subject5<asp:TextBox ID="subject5" CssClass="label" runat="server"></asp:TextBox>
                    <asp:Button ID="Button2" CssClass="btn-primary" OnClick="Button1_Click" runat="server" Text="Insert Student" />     
                </ContentTemplate>
                <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
            </Triggers>
       
                    </asp:UpdatePanel>
        
    </form>
        </div>
</body>
</html>
