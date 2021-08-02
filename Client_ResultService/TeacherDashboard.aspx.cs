using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
namespace Client_ResultService
{
    public partial class TeacherDashboard : System.Web.UI.Page
    {
        localhost.ResultServices resultServices = new localhost.ResultServices();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["teacher_id"] != null)
            {
                if (IsPostBack == false)
                {
                    int teacher_id = (int)Session["teacher_id"];
                    getdata();
                }
            }
            else
            {
                Response.Redirect("LoginPage.aspx");
            }
        }
        protected void getdata()
        {
            int teacher_id = (int)Session["teacher_id"];
            string data = resultServices.ShowStudents(teacher_id);
            DataTable studentsList = JsonConvert.DeserializeObject<DataTable>(data);
            GridView1.DataSource = studentsList;
            GridView1.DataBind();
        }
        protected void edit(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            getdata();
        }
        protected void Update_Student(object sender, GridViewUpdateEventArgs e)
        {
            string student_seatno= GridView1.DataKeys[e.RowIndex].Value.ToString();
            string student_name = ((TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0]).Text.ToString();
            int teacher_id = Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0]).Text);
            int subject1 = Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0]).Text);
            int subject2 = Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0]).Text);
            int subject3 = Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0]).Text);
            int subject4 = Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0]).Text);
            int subject5 = Convert.ToInt32(((TextBox)GridView1.Rows[e.RowIndex].Cells[9].Controls[0]).Text);
            Response.Write("Student SeatNo" + student_seatno + "");
            string res=resultServices.updateStudent(student_seatno, student_name, subject1, subject2, subject3, subject4, subject5);
            if(res.Equals("Record Updated Successfully"))
            {
                getdata();
            }
            else
            {
                getdata();
            }
            GridView1.EditIndex = -1;
        }
        protected void canceledit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            getdata();
        }
        protected void delete(object sender, GridViewDeleteEventArgs e)
        {
            string student_seatno = GridView1.DataKeys[e.RowIndex].Value.ToString();
            resultServices.deleteStudent(student_seatno);
            getdata();
        }
    }
}