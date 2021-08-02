using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Client_ResultService
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["teacher_id"] != null)
            {
                Session.Remove("teacher_id");
                Response.Redirect("LoginPage.aspx");
            }
        }
    }
}