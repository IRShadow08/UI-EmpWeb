using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PerformanceEvaluation_With_UI_
{
    public partial class Form_Sec_Agree_Header : System.Web.UI.Page
    {
        string process, empType, empID;
        string[] sessionInfo;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Process"].ToString() != "PAValidation")
                Session["Process"] = "PASubmission";

            process = Session["Process"].ToString();

            if (process == "PAValidation" || process == "PEValidation")
            {
                empType = Session["RateeEmpType"].ToString();
                empID = Session["RateeID"].ToString();
            }

            else 
            {
                empType = Session["EmpType"].ToString();
                empID = Session["EmpID"].ToString();
            }
                

            process = Session["Process"].ToString();

            sessionInfo = Util_Functions.InitializeAgreement(empID, empType);

            if (sessionInfo != null)
            {
                Session["PAValDone"] = sessionInfo[0];
                Session["EmpFormID"] = sessionInfo[1];
                Session["ReportID"] = sessionInfo[2];
            }
            else
            {
                sessionInfo = Util_Functions.CreateAgreementForm(empID, empType);
                Session["FormID"] = sessionInfo[0];
                Session["EmpFormID"] = sessionInfo[1];
                Session["ReportID"] = sessionInfo[2];
            }




            switch (empType)
            {
                case "Staff":
                    proficiency.InnerText = "Section 1";
                    coreValues.InnerText = "Section 2";
                    proficiency.Visible = true;
                    break;
                case "Faculty":
                    academics.Visible = true;
                    ethics.Visible = true;
                    break;
                case "Officer":
                    break;
                default:
                    break;
            }
            coreValues.Visible = true;
            summary.Visible = true;

            if (process == "PEValidation")
            {
                comments.Visible = true;
            }

            foreach (string key in Session.Keys)
            {
                object value = Session[key];
                Response.Write($"Session Key: {key}, Value: {value}");
            }
        }
    }
}