using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Newtonsoft.Json;
using System.Data;
namespace ResultService
{
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class ResultServices : System.Web.Services.WebService
    {
        [WebMethod]
        public string About()
        {
            return "A simple result service application";
        }
        [WebMethod]
        public string insertStudent(string student_seatno, string student_name, int teacher_id, int subject_1_marks, int subject_2_marks, int subject_3_marks, int subject_4_marks, int subject_5_marks)
        {
            Student student = new Student()
            {
                Student_Seatno = student_seatno,
                Student_Name = student_name,
                Teacher_Id = teacher_id,
                Subject1 = subject_1_marks,
                Subject2 = subject_2_marks,
                Subject3 = subject_3_marks,
                Subject4 = subject_4_marks,
                Subject5 = subject_5_marks,
            };
            string status = student.insert();
            if (status == "PASS")
                return "Record Inserted";
            else
                return "Record Insertion Failed";
        }
        [WebMethod]
        public string ShowStudents(int teacher_id)
        {
            Student student = new Student() { Teacher_Id = teacher_id };
            DataTable studentList = student.show();
            if (studentList != null)
                return JsonConvert.SerializeObject(studentList);
            else
                return JsonConvert.SerializeObject(studentList);
        }
        [WebMethod]
        public string updateStudent(string student_seatno, string student_name, int subject_1_marks, int subject_2_marks, int subject_3_marks, int subject_4_marks, int subject_5_marks)
        {
            Student student = new Student()
            {
                Student_Seatno = student_seatno,
                Student_Name = student_name,
                Subject1 = subject_1_marks,
                Subject2 = subject_2_marks,
                Subject3 = subject_3_marks,
                Subject4 = subject_4_marks,
                Subject5 = subject_5_marks,
            };
            string status = student.update();
            if (status == "PASS")
                return "Record Updated Successfully";
            else
                return "Record Updation Failed";
        }
        [WebMethod]
        public string deleteStudent(string student_seatno)
        {
            Student student = new Student()
            {
                Student_Seatno = student_seatno
            };
            string status = student.delete();
            if (status == "PASS")
                return "Record Deleted Successfully";
            else
                return "Record Deletion Failed";
        }
        [WebMethod]
        public string registerTeacher(int teacher_id, string teacher_name, string teacher_email, string teacher_password, string teacher_college_name)
        {
            Teacher teacher = new Teacher()
            {
                Teacher_Id = teacher_id,
                Teacher_Name = teacher_name,
                Teacher_Email = teacher_email,
                Teacher_Password = teacher_password,
                Teacher_College_Name = teacher_college_name,
            };
            string status = teacher.registerTeacher();
            if (status == "PASS")
                return "Record Inserted";
            else
                return "Record Insertion Failed";
        }
        [WebMethod]
        public int LoginTeacher(string teacher_email, string teacher_password)
        {
            Teacher teacher = new Teacher() { Teacher_Email = teacher_email,Teacher_Password=teacher_password };
            int teacher_id = teacher.loginTeacher();
            if (teacher_id==0)
                return teacher_id;
            else
                return teacher_id;
        }
        [WebMethod]
        public string updateTeacher(int teacher_id, string teacher_name, string teacher_email, string teacher_password, string teacher_college_name)
        {
            Teacher teacher = new Teacher()
            {
                Teacher_Id = teacher_id,
                Teacher_Name = teacher_name,
                Teacher_Email = teacher_email,
                Teacher_Password = teacher_password,
                Teacher_College_Name = teacher_college_name,
            };
            string status = teacher.updateTeacher();
            if (status == "PASS")
                return "Record Updated Successfully";
            else
                return "Record Updation Failed";
        }
        [WebMethod]
        public string deleteTeacher(int teacher_id)
        {
            Teacher teacher = new Teacher()
            {
                Teacher_Id = teacher_id
            };
            string status = teacher.deleteTeacher();
            if (status == "PASS")
                return "Record Deleted Successfully";
            else
                return "Record Deletion Failed";
        }
        [WebMethod]
        public string showResult(string student_seatno,int teacher_id)
        {
            Student student = new Student()
            {
                Student_Seatno = student_seatno,
                Teacher_Id = teacher_id
            };
            DataTable resultList = student.showResult();
            if (resultList != null)
                return JsonConvert.SerializeObject(resultList);
            else
                return JsonConvert.SerializeObject(resultList);
        }
    }
}