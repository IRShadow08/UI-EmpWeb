using Npgsql;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing.Imaging;
using System.Linq;
using System.Security.AccessControl;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PerformanceEvaluation_With_UI_
{
    public partial class Form_User_HomePage : System.Web.UI.Page
    {
        string process, empType, reportID, empFormID, accType;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Initialize();

            foreach (string key in Session.Keys)
            {
                object value = Session[key];
                Response.Write($"Session Key: {key}, Value: {value}");
            }
        }

        protected void Initialize() 
        {
            accType = Session["AccType"].ToString();
            GetProcess();

            switch (accType)
            {
                case "Employee":
                    myAccount.Visible = true;
                    myAgree.Visible = true;
                    myEval.Visible = true;
                    
                    break;
                case "Supervisor":
                    myAccount.Visible = true;
                    myAgree.Visible = true;
                    myEval.Visible = true;
                    empAgree.Visible = true;
                    empEval.Visible = true;
                    reportSection.Visible = true;
                    break;
                case "Admin":
                    createAccountSection.Visible = true;
                    admin123.Visible = true;
                    myAccount.Visible = true;
                    break;
                default:
                    break;
            }


            switch (process)
            {
                case "PASubmission":
                    myEval.Attributes.Add("class", "unclickable");
                    empType = Session["EmpType"].ToString();
                    break;
                case "PAValidation":
                    myAgree.Attributes.Add("class", "unclickable");
                    empType = Session["RateeEmpType"].ToString();
                    break;
                case "PESubmission":
                    myAgree.Attributes.Add("class", "unclickable");
                    empType = Session["EmpType"].ToString();
                    break;
                case "PEValidation":
                    myAgree.Attributes.Add("class", "unclickable");
                    empType = Session["RateeEmpType"].ToString();
                    break;
                case "Accomplished":
                    break;
                default:
                    break;
            }

            
            
        }

        protected void GetProcess() 
        {
            string PASub = "", PAVal = "", PESub = "", PEVal = "";
            string empID = Session["EmpID"].ToString();

            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
            {
                connection.Open();

                NpgsqlCommand command = new NpgsqlCommand(@"SELECT ""PASubmission"", ""PAValidation"", ""PESubmission"", ""PEValidation"" FROM ""StatusReport"" WHERE ""EmpID"" = @empID", connection);
                command.Parameters.AddWithValue("@empID", empID);

                NpgsqlDataReader reader = command.ExecuteReader();

                while (reader.Read())
                {
                    PASub = reader.GetString(0);
                    PAVal = reader.GetString(1);
                    PESub = reader.GetString(2);
                    PEVal = reader.GetString(3);
                }
                reader.Close();

            }

            if (PASub == "0")
                Session["Process"] = "PASubmission";
            else if (PAVal == "0")
                Session["Process"] = "PAValidation";
            else if (PESub == "0")
                Session["Process"] = "PESubmission";
            else if (PEVal == "0")
                Session["Process"] = "PEValidation";
            else
                Session["Process"] = "Accomplished";
            process = Session["Process"].ToString();
        }


    }
}