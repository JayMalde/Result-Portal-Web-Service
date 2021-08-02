using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
namespace ResultService
{
    public class Student
    {
        public string Student_Seatno { get; set; }
        public string Student_Name { get; set; }
        public int Teacher_Id{ get; set; }
        public int Subject1 { get; set; }
        public int Subject2 { get; set; }
        public int Subject3 { get; set; }
        public int Subject4 { get; set; }
        public int Subject5 { get; set; }

        string connectionString = ConfigurationManager.ConnectionStrings["DBcon"].ConnectionString;
        public string insert()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand insCommand = new SqlCommand("spInsertStudent", connection);
            insCommand.CommandType = System.Data.CommandType.StoredProcedure;
            insCommand.Parameters.AddWithValue("@student_seatno", Student_Seatno);
            insCommand.Parameters.AddWithValue("@student_name", Student_Name);
            insCommand.Parameters.AddWithValue("@teacher_id", Teacher_Id);
            insCommand.Parameters.AddWithValue("@subject_1_marks", Subject1);
            insCommand.Parameters.AddWithValue("@subject_2_marks", Subject2);
            insCommand.Parameters.AddWithValue("@subject_3_marks", Subject3);
            insCommand.Parameters.AddWithValue("@subject_4_marks", Subject4);
            insCommand.Parameters.AddWithValue("@subject_5_marks", Subject5);
            connection.Open();
            int count = insCommand.ExecuteNonQuery();
            if (count > 0)
                return "PASS";
            else
                return "FAIL";
        }
        public DataTable show()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            //Using Stored Procedure to insert/update/delete
            SqlCommand showCommand = new SqlCommand("spShowStudents", connection);
            showCommand.CommandType = System.Data.CommandType.StoredProcedure;
            showCommand.Parameters.AddWithValue("@teacher_id", Teacher_Id);
            connection.Open();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(showCommand);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            return dataTable;
        }
        public string update()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand updateCommand = new SqlCommand("spUpdateStudent", connection);
            updateCommand.CommandType = System.Data.CommandType.StoredProcedure;
            updateCommand.Parameters.AddWithValue("@student_seatno", Student_Seatno);
            updateCommand.Parameters.AddWithValue("@student_name", Student_Name);
            updateCommand.Parameters.AddWithValue("@subject_1_marks", Subject1);
            updateCommand.Parameters.AddWithValue("@subject_2_marks", Subject2);
            updateCommand.Parameters.AddWithValue("@subject_3_marks", Subject3);
            updateCommand.Parameters.AddWithValue("@subject_4_marks", Subject4);
            updateCommand.Parameters.AddWithValue("@subject_5_marks", Subject5);
            connection.Open();
            int count = updateCommand.ExecuteNonQuery();
            if (count > 0)
                return "PASS";
            else
                return "FAIL";
        }
        public string delete()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand delCommand = new SqlCommand("spDeleteStudent", connection);
            delCommand.CommandType = System.Data.CommandType.StoredProcedure;
            delCommand.Parameters.AddWithValue("@student_seatno", Student_Seatno);
            connection.Open();
            int count = delCommand.ExecuteNonQuery();
            if (count > 0)
                return "PASS";
            else
                return "FAIL";
        }
        public DataTable showResult()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand showCommand = new SqlCommand("spShowResult", connection);
            showCommand.CommandType = System.Data.CommandType.StoredProcedure;
            showCommand.Parameters.AddWithValue("@student_seatno", Student_Seatno);
            showCommand.Parameters.AddWithValue("@teacher_id", Teacher_Id);
            connection.Open();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(showCommand);
            DataTable dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            return dataTable;
        }
    }
}