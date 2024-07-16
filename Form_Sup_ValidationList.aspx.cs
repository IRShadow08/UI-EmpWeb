using Npgsql;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;
using static System.Net.Mime.MediaTypeNames;

namespace PerformanceEvaluation_With_UI_
{
    public partial class Form_Sup_ValidationList : System.Web.UI.Page
    {
        string supID;
        List<string> empIDList;
        private int currentAgreeIndex = 0;
        private const int totalAgreeContainers = 33; // Change this to count the total number of records in the DB
        private const int pageSize = 8;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["AccType"] = "Supervisor";
            supID = Session["EmpID"].ToString();


            Initialize();

            //if (!IsPostBack)
            //{
            //    Initialize();
            //}
        }

        protected void Initialize()
        {
            string SQLcmd, storedReportID = "";
            empIDList = new List<string>();
            NpgsqlCommand command;
            NpgsqlDataReader reader;

            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=1234;Database=EmplyeeEval;"))
            {
                connection.Open();
                SQLcmd = @"SELECT ""PASubmission"", ""StatusReport"".""EmpID"", ""ReportID"" FROM ""StatusReport"" INNER JOIN ""Employee"" ON ""StatusReport"".""EmpID"" = ""Employee"".""EmpID"" WHERE ""PASubmission"" IS NOT NULL AND ""PAValidation"" = @PAValidation AND ""SupID"" = @SupID";
                command = new NpgsqlCommand(SQLcmd, connection);
                command.Parameters.AddWithValue("@SupID", supID);
                command.Parameters.AddWithValue("@PAValidation", "0");

                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    if (reader.GetString(0) != "0")
                    {
                        empIDList.Add(reader.GetString(1));
                        storedReportID = reader.GetString(2);
                    }

                }
                reader.Close();
            }

            ShowAgreeContainers(empIDList);


        }

        private void ShowAgreeContainers(List<string> empIDList)
        {
            containerSection.Controls.Clear(); // Clear the container before adding new content

            var leftSection = new HtmlGenericControl("div");
            leftSection.Attributes["class"] = "left-section";
            var rightSection = new HtmlGenericControl("div");
            rightSection.Attributes["class"] = "right-section";


            for (int i = 0; i < empIDList.Count; i++)
            {
                string[] temp = GetEmpInfo(empIDList[i]);
                string name = temp[0];
                string type = temp[1];

                var container = CreateAgreeContainer(name,type);
                if (i % 2 == 0)
                {
                    leftSection.Controls.Add(container);
                }
                else
                {
                    rightSection.Controls.Add(container);
                }
            }

            containerSection.Controls.Add(leftSection);
            containerSection.Controls.Add(rightSection);

            // Update button visibility
            //nextBtnAgree.Visible = currentAgreeIndex + pageSize < totalAgreeContainers;
            //backBtnAgree.Visible = currentAgreeIndex > 0;
        }

        private HtmlGenericControl CreateAgreeContainer(string name, string type)
        {
            var container = new HtmlGenericControl("div");
            container.Attributes["class"] = "agree-eval-container";
            container.InnerText = $"{name}";

            LinkButton button = new LinkButton();
            button.Text = "View Employee Agreement";
            button.CssClass = "view-agree-eval-btn";
            button.ID = $"{name}";
            //button.PostBackUrl = "";
            button.Click += StaffClicked;


            switch (type)
            {
                case "Staff":
                    //button.Click += StaffClicked;
                    break;
                default:
                    break;
            }

            container.Controls.Add(button);

            return container;
        }
        protected void Button_Click(object sender, EventArgs e)
        {
            // Handle button click event here
        }

        protected void NextBtnAgree_Click(object sender, EventArgs e)
        {
            //currentAgreeIndex += pageSize;
            //ShowAgreeContainers(empIDList);
        }

        protected void BackBtnAgree_Click(object sender, EventArgs e)
        {
            //currentAgreeIndex -= pageSize;
            //if (currentAgreeIndex < 0)
            //{
            //    currentAgreeIndex = 0;
            //}
            //ShowAgreeContainers(empIDList);
        }


        protected string[] GetEmpInfo(string empID)
        {
            string empName = "", empType = "";
            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=1234;Database=EmplyeeEval;"))
            {
                connection.Open();
                string sqlCode = @"SELECT ""EmpName"", ""EmpType"" FROM ""Employee"" WHERE ""EmpID"" = @EmpID";
                NpgsqlCommand command = new NpgsqlCommand(sqlCode, connection);
                command.Parameters.AddWithValue("@EmpID", empID);

                NpgsqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    empName = reader.GetString(0);
                    empType = reader.GetString(1);
                }
                reader.Close();
                //insertAgreementTable(empName, empType);
            }
            return new string[] { empName, empType };


        }

        protected void StaffClicked(object sender, EventArgs e)
        {
            LinkButton staff = sender as LinkButton;
            Session["Process"] = "PAValidation";
            SetStaffSessionInfo(staff.ID);
            //Response.Write($"<script>alert('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')</script>");
            //Response.Write(staff.Text);
            //Response.Redirect("~/Form_Sec_Proficiency.aspx");
            
        }

        protected void SetStaffSessionInfo(string name)
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=1234;Database=EmplyeeEval;"))
            //using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=1234;Database=EmplyeeEval;"))
            {
                connection.Open();
                string storedEmpID = "", storedFormID = "", storedStaffFormID = "";
                string sqlCode = @"SELECT ""Employee"".""EmpID"", ""EmployeePerformance"".""FormID"", ""StaffFormID"" FROM ""Employee"" INNER JOIN ""EmployeePerformance"" ON ""Employee"".""EmpID"" = ""EmployeePerformance"".""EmpID"" INNER JOIN ""StaffForm"" ON ""EmployeePerformance"".""FormID"" = ""StaffForm"".""FormID"" WHERE ""Employee"".""EmpName"" = @empName";
                NpgsqlCommand command = new NpgsqlCommand(sqlCode, connection);
                command.Parameters.AddWithValue("@empName", name);

                NpgsqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    storedEmpID = reader.GetString(0);
                    storedFormID = reader.GetString(1);
                    storedStaffFormID = reader.GetString(2);

                    Session["RateeEmpType"] = "Staff";
                    Session["RateeID"] = storedEmpID;
                    Session["FormID"] = storedFormID;
                    Session["EmpFormID"] = storedStaffFormID;
                }
                reader.Close();
                Response.Write($"<script>alert('EmpID:{Session["RateeID"].ToString()}FormID:{Session["FormID"].ToString()}EmpFormID:{Session["EmpFormID"].ToString()}')</script>");
                
                
                Response.Redirect("~/Form_Sec_Agree_Header.aspx");
            }
        }
    }
}