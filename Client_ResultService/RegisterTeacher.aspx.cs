using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Client_ResultService
{
    public partial class RegisterTeacher : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Teacher(object sender, EventArgs e)
        {
            localhost.ResultServices resultServices = new localhost.ResultServices();
            resultServices.registerTeacher(Convert.ToInt32(teacher_id.Text),teacher_name.Text,teacher_email.Text,teacher_password.Text,teacher_college_name.Text);
            Response.Redirect("TeacherDashboard.aspx");
        }
    }
}