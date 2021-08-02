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
    public partial class ShowResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ShowResults(object sender, EventArgs e)
        {
            DataTable studentsList = null;
            localhost.ResultServices resultServices = new localhost.ResultServices();
            string data = resultServices.showResult(student_seatno.Text, Convert.ToInt32(teacher_id.Text));
            studentsList = JsonConvert.DeserializeObject<DataTable>(data);
            GridViewResult.DataSource = studentsList;
            GridViewResult.DataBind();
        }
    }
}