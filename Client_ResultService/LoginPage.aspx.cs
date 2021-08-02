using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Newtonsoft.Json;
namespace Client_ResultService
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            localhost.ResultServices resultServices = new localhost.ResultServices();
            int tid=resultServices.LoginTeacher(teacher_email.Text, teacher_password.Text);
            Session["teacher_id"] = tid;
            Response.Write("Registration Successfull!!!!!!");
            Response.Redirect("TeacherDashboard.aspx");
           
        }
    }
}