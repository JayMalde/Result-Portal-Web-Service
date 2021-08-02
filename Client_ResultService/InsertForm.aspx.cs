using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Client_ResultService
{
    public partial class InsertForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["teacher_id"] != null)
            {
                
            }
            else
            {
                Response.Redirect("LoginPage.aspx");
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int teacher_id = Convert.ToInt32(Session["teacher_id"].ToString());
            localhost.ResultServices resultServices = new localhost.ResultServices();
            resultServices.insertStudent(rollno.Text, name.Text, teacher_id, Convert.ToInt32(subject1.Text), Convert.ToInt32(subject2.Text), Convert.ToInt32(subject3.Text), Convert.ToInt32(subject4.Text), Convert.ToInt32(subject5.Text));
            Response.Redirect("TeacherDashboard.aspx");
        }
    }
}