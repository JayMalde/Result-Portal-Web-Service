using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace ResultService
{
    public class Teacher
    {
        public int Teacher_Id { get; set; }
        public string Teacher_Name { get; set; }
        public string Teacher_Email { get; set; }
        public string Teacher_Password { get; set; }
        public string Teacher_College_Name { get; set; }

        string connectionString = ConfigurationManager.ConnectionStrings["DBcon"].ConnectionString;
        public string registerTeacher()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand insCommand = new SqlCommand("spInsertTeacher", connection);
            insCommand.CommandType = System.Data.CommandType.StoredProcedure;
            insCommand.Parameters.AddWithValue("@teacher_id", Teacher_Id);
            insCommand.Parameters.AddWithValue("@teacher_name", Teacher_Name);
            insCommand.Parameters.AddWithValue("@teacher_email", Teacher_Email);
            insCommand.Parameters.AddWithValue("@teacher_password", Teacher_Password);
            insCommand.Parameters.AddWithValue("@teacher_college_name", Teacher_College_Name);
            connection.Open();
            int count = insCommand.ExecuteNonQuery();
            if (count > 0)
                return "PASS";
            else
                return "FAIL";
        }
        public int loginTeacher()
        {
            int teacher_id =     0;
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand showCommand = new SqlCommand("spLoginTeacher1", connection);
            showCommand.CommandType = System.Data.CommandType.StoredProcedure;
            showCommand.Parameters.AddWithValue("@teacher_email", Teacher_Email);
            showCommand.Parameters.AddWithValue("@teacher_password", Teacher_Password);
            connection.Open();
            SqlDataReader dataReader = showCommand.ExecuteReader();
            while (dataReader.Read())
            {
                teacher_id = (int)dataReader["teacher_id"];
            }
            return teacher_id;
        }
        public string updateTeacher()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand updateCommand = new SqlCommand("spUpdateTeacher", connection);
            updateCommand.CommandType = System.Data.CommandType.StoredProcedure;
            updateCommand.Parameters.AddWithValue("@teacher_id", Teacher_Id);
            updateCommand.Parameters.AddWithValue("@teacher_name", Teacher_Name);
            updateCommand.Parameters.AddWithValue("@teacher_email", Teacher_Email);
            updateCommand.Parameters.AddWithValue("@teacher_password", Teacher_Password);
            updateCommand.Parameters.AddWithValue("@teacher_college_name", Teacher_College_Name);
            connection.Open();
            int count = updateCommand.ExecuteNonQuery();
            if (count > 0)
                return "PASS";
            else
                return "FAIL";
        }
        public string deleteTeacher()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand delCommand = new SqlCommand("spDeleteTeacher", connection);
            delCommand.CommandType = System.Data.CommandType.StoredProcedure;
            delCommand.Parameters.AddWithValue("@teacher_id", Teacher_Id);
            connection.Open();
            int count = delCommand.ExecuteNonQuery();
            if (count > 0)
                return "PASS";
            else
                return "FAIL";
        }
    }
}