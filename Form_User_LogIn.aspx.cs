using Npgsql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PerformanceEvaluation_With_UI_
{
    public partial class Form_User_LogIn : System.Web.UI.Page
    {
        private string username, password, storedStatus, storedSupPass, storedSupID, storedSupUser, storedEmpID, storedPassword, storedEmpUser, empType, storedEmpName, storedEmpPos, storedEmpDept;
        private int subordinateCount;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Submit_Click(object sender, EventArgs e)
        {
            GetInfo();
            CheckPassword();
            //Response.Redirect("~/Form_FormInformation.aspx");
        }
        protected void GetInfo()
        {
            username = usernameTxt.Text;
            password = passwordTxt.Text;
            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
            {
                connection.Open();

                NpgsqlCommand command = new NpgsqlCommand(@"
                    SELECT ""EmployeeAccount"".""EmpPass"", ""EmployeeAccount"".""EmpID"", ""EmployeeAccount"".""EmpUser"", ""Employee"".""EmpType"", ""EmployeeAccount"".""Status"", ""Employee"".""EmpName"", ""Employee"".""EmpPos"",  ""Employee"".""EmpDept""
                    FROM ""EmployeeAccount"" 
                    INNER JOIN ""Employee"" 
                    ON ""Employee"".""EmpID"" = ""EmployeeAccount"".""EmpID"" 
                    WHERE ""EmployeeAccount"".""EmpUser"" = @username", connection);

                command.Parameters.AddWithValue("@Username", username);

                NpgsqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    storedPassword = reader.GetString(0);
                    storedEmpID = reader.GetString(1);
                    storedEmpUser = reader.GetString(2);
                    empType = reader.GetString(3);
                    storedStatus = reader.GetString(4);
                    storedEmpName = reader.GetString(5);
                    storedEmpPos = reader.GetString(6);
                    storedEmpDept = reader.GetString(7);
                }

                reader.Close();
            }
        }
        protected void CheckPassword()
        {
            if (password == storedPassword && storedStatus == "Active")
            {
                // If the password is correct, put the info gathered into the session
                // maybe need to get form ID too, for when vieiwng and not creating a new form
                Session["EmpID"] = storedEmpID;
                Session["RateeID"] = storedEmpID;
                Session["EmpType"] = empType;
                Session["RateeEmpType"] = empType;
                Session["Status"] = storedStatus;
                Session["EmpName"] = storedEmpName;
                Session["EmpPos"] = storedEmpPos;
                Session["EmpDept"] = storedEmpDept;

                using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
                {
                    connection.Open();

                    NpgsqlCommand command = new NpgsqlCommand(@"SELECT COUNT(*) FROM CheckSubordinates(@EmpID)", connection);
                    command.Parameters.AddWithValue("@EmpID", storedEmpID);
                    subordinateCount = Convert.ToInt32(command.ExecuteScalar());

                    if (subordinateCount == 0)
                    {
                        if (empType == "Admin")
                        {
                            Session["AccType"] = "Admin";
                        }
                        else
                        {
                            Session["AccType"] = "Employee";
                        }
                    }
                    else
                    {
                        Session["AccType"] = "Supervisor";
                    }
                }
                //Response.Write($"<script>alert('{empType}')</script>");
                //Response.Redirect("~/Form_Proficiency.aspx");
                ChangeSection();
            }
            else if (password == storedPassword && storedStatus != "Active")
            {
                Response.Write("<script>alert('Access denied')</script>");
            }
            else if (password != storedPassword)
            {
                Response.Write("<script>alert('Wrong Password')</script>");
            }
        }
        protected void Shortcut(object sender, EventArgs e)
        {
            Button button = sender as Button;

            switch (button.ID)
            {
                case "faculty":
                    usernameTxt.Text = "A@A";
                    passwordTxt.Text = "1";
                    break;
                case "staff":
                    usernameTxt.Text = "B@B";
                    passwordTxt.Text = "2";
                    break;
                case "officer":
                    usernameTxt.Text = "C@C";
                    passwordTxt.Text = "3";
                    break;
                case "supervisor":
                    usernameTxt.Text = "D@D";
                    passwordTxt.Text = "4";
                    break;
                default:
                    break;
            }
            GetInfo();
            CheckPassword();

        }
        protected void ChangeSection()
        {
            Response.Redirect("~/Form_User_HomePage.aspx");
        }
        protected void ForgetPass_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Form_ForgotPass.aspx");
        }


    }
}