<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowResult.aspx.cs" Inherits="Client_ResultService.ShowResult" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        html{text-align:center;font-family:arial;font-size: 20px;}
        
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
        .result { 
            position: absolute;
            top: 26%;
            left: 50%;
            margin: -150px 0 0 -150px;
            width: 400px;
            height: 400px;
        }
        .btn-primary
        { 
            background-color: #4a77d4; 
        }
        .result h2
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
            padding: 8px 12px;
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
        .datalist{
            position: absolute;
            top: 58%;
            left: 38%;
            margin: -150px 0 0 -150px;
            width: 800px;
        }
        table{
            border-collapse: collapse;
            width:100%;
        }
        td 
        {
            border: 1px solid #726E6D;
            padding: 9px;
            text-align:center;
        }
        thead
        {
            font-weight:bold;
            text-align:center;
            background: #625D5D;
            color:white;
        }
        tbody >tr:nth-child(odd) {
            background:#D1D0CE;
        }
    </style>
</head>
<body>
    <div class="topnav">
        <a class="nav-item" href="RegisterTeacher.aspx">Register</a>
        <a class="nav-item" href="LoginPage.aspx">Login Page</a>
    </div>   
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
            
        <div class="result">
            <h2>Student Report Card</h2>
            
                    SeatNo<asp:TextBox ID="student_seatno" CssClass="label" runat="server"></asp:TextBox><br/>
                    Teacher ID<asp:TextBox ID="teacher_id" CssClass="label" runat="server"></asp:TextBox><br/>
                    <asp:Button ID="result" OnClick="ShowResults" CssClass="btn-primary" runat="server" Text="Show Result" /><br/><br/>       
               
        </div>
        <div class="datalist">
            <asp:DataList ID="GridViewResult" runat="server">
                <ItemTemplate>
                    <table>
                        <thead>
                            <tr><td colspan="10">College Name </td><td colspan="10"><%# Eval("teacher_college_name") %></td></tr>
                            <tr><td colspan="10">Student Name </td><td colspan="10"><%# Eval("student_name") %></td></tr>
                            <tr><td colspan="10">Seat No</td><td colspan="6">Degree</td><td colspan="4"> Coordinator Name </td></tr>
                            <tr><td colspan="10"><%# Eval("student_seatno") %></td><td colspan="6"> BScIT </td><td colspan="4"> <%# Eval("teacher_name") %> </td></tr><br/>
                        </thead>            
                        <tbody>
                            <tr><td colspan="10">Subject Name</td><td colspan="4">Out Of</td><td colspan="6"> Marks Gained </td></tr>
                            <tr><td colspan="10">Subject 1</td><td colspan="4"> 100</td><td colspan="6"> <%# Eval("subject_1_marks") %> </td></tr>
                            <tr><td colspan="10">Subject 2</td><td colspan="4"> 100</td><td colspan="6"> <%# Eval("subject_2_marks") %> </td></tr>
                            <tr><td colspan="10">Subject 3</td><td colspan="4"> 100</td><td colspan="6"> <%# Eval("subject_3_marks") %> </td></tr>
                            <tr><td colspan="10">Subject 4</td><td colspan="4"> 100</td><td colspan="6"> <%# Eval("subject_4_marks") %> </td></tr>
                            <tr><td colspan="10">Subject 5</td><td colspan="4"> 100</td><td colspan="6"> <%# Eval("subject_5_marks") %> </td></tr>
                        </tbody>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </div>
         </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="result" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
    </form>
</body>
</html>
