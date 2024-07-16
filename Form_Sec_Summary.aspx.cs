using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PerformanceEvaluation_With_UI_
{
    public partial class Form_Sec_Summary : System.Web.UI.Page
    {
        TextBox[] tbTotalWeight, tbTotalRating;
        string empFormID, empType, process, reportID, fields = @"""Section1CWR"", ""Section2CWR""";
        int sec1 = 60, sec2 = 40;

        protected void Page_Load(object sender, EventArgs e)
        {
            tbTotalWeight = new TextBox[] { weight1_1, weight1_2 };
            tbTotalRating = new TextBox[] { rating1, rating2};
            percent1.Text = $"{sec1}";
            percent2.Text = $"{sec2}";
            //TextBox2.Text = $"{sec1}";
            //TextBox3.Text = $"{sec2}";

            // edit to PAS PAV PES PEV
            if (Session["Process"] is null)
                Session["Process"] = "PAValidation";

            process = Session["Process"].ToString();

            if (process == "PAValidation" || process == "PEValidation")
                empType = Session["RateeEmpType"].ToString();
            else
                empType = Session["EmpType"].ToString();

            reportID = Session["ReportID"].ToString();
            empFormID = Session["EmpFormID"].ToString();


            if (!IsPostBack)
                Initialize();

            // Check session info
            //Response.Write($"{empFormID} {empType} {process}");
        }
        protected void Initialize()
        {
            Util_Functions.InitializeOverall(ref tbTotalWeight, ref tbTotalRating, ref Submit, empFormID, empType, fields, process);
            score1.Text = (sec1 * 0.01 * double.Parse(rating1.Text)).ToString();
            score2.Text = (sec2 * 0.01 * double.Parse(rating2.Text)).ToString();

            //if (process == "PASubmission" || process == "PAValidation")
            //{
            //    Util_Functions.InitializeOverall(ref tbTotalWeight, ref tbTotalRating, ref Submit, empFormID, empType, fields, process);
            //}
            //else if (process == "PESubmission" || process == "PEValidation")
            //{
            //    Util_Functions.InitializeOverall(ref tbTotalRating, ref Submit, empFormID, empType, fields, process);
            //}


            // show only when there is rating na
            //




        }

        protected void txt_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            Util_Functions.UpdateStatRep(process, reportID);
            Session["Process"] = null;
            Response.Redirect("~/Submitted.aspx");
        }

        private void ShowAlert(string message)
        {
            Response.Write($"<script>alert('{message}')</script>");
        }
    }
}