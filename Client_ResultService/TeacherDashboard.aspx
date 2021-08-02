<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TeacherDashboard.aspx.cs" Inherits="Client_ResultService.TeacherDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        *{
            margin:0;
            font-family: 'Open Sans', sans-serif;
        }
        .table{
            display:flex;
            align-items:center;
            justify-content:center;
            }

        .active {
          background-color: #04AA6D;
        }
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
        .topnav .nav-item:hover 
        {
            background-color: #ddd;
            color: black;
        }
        .gridview
        {
            width: 90%;
            border: solid 2px black;
            min-width: 90%;
        }
        .header
        {
            background-color: #646464;
            font-family: Arial;
            color: White;
            border: none 0px transparent;
            height: 25px;
            text-align: center;
            font-size: 16px;
        }
        .rows
        {
            background-color: #fff;
            font-family: Arial;
            font-size: 14px;
            color: #000;
            min-height: 25px;
            text-align: left;
            border: none 0px transparent;
        }
        .rows:hover
        {
            background-color: #fa9d3f;
            font-family: Arial;
            color: #fff;
            text-align: left;
        }
        .selectedrow
        {
            background-color: #fa9d3f;
            font-family: Arial;
            color: #fff;
            font-weight: bold;
            text-align: left;
        }
        .gridview a{
            background-color: Transparent;
            padding: 5px 5px 5px 5px;
            color: #fff;
            text-decoration: none;
            font-weight: bold;
        }
        .gridview a:hover
        {
            background-color: #04AA6D;
            color: #fff;
        }
        .gridview span
        {
            background-color: #c9c9c9;
            color: #04AA6D;
            padding: 5px 5px 5px 5px;
        }
        .pager
        {
            background-color: #646464;
            font-family: Arial;
            color: White;
            height: 30px;
            text-align: left;
        }
        .gridview td
        {
            padding: 5px;
        }
        .gridview th
        {
            padding: 5px;
        }
    </style>
</head>
<body>
    <div class="topnav">
        <a class="nav-item active" href="TeacherDashboard.aspx">Home</a>
        <a class="nav-item" href="InsertForm.aspx">Add Student</a>
        <a class="nav-item" href="#">Logged in as Teacher ID : <%= Session["teacher_id"].ToString() %></a>
        <a class="nav-item" style="float:right" href="Logout.aspx">Logout</a>
    </div>   
    <form id="form1" runat="server">
        <h1 align="center">TeacherDashboard</h1>
        <div class="table">
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="GridView1" runat="server" DataKeyNames="student_seatno" OnRowEditing="edit" OnRowCancelingEdit="canceledit" OnRowDeleting="delete" OnRowUpdating="Update_Student" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="gridview" PagerStyle-CssClass="pager" HeaderStyle-CssClass="header" RowStyle-CssClass="rows">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" AccessibleHeaderText="Update" />
                            <asp:CommandField ShowDeleteButton="True" AccessibleHeaderText="Delete" />
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="RowCommand"/>
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>