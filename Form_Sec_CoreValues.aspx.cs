using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PerformanceEvaluation_With_UI_
{
    public partial class Form_Sec_CoreValues : System.Web.UI.Page
    {
        TextBox[] tbWeight, tbRating, tbWeightedScore;
        string empFormID, empType, process, field = "Section2CWR"; // have to adjust what field based on emptype 
        int maxWeight, minWeight;
        protected void Page_Load(object sender, EventArgs e)
        {
            // get textboxes grouped so they can be given to functions
            tbWeight = new TextBox[] { weight1, weight2, weight3, weight4, weight5 };
            tbRating = new TextBox[] {rating1, rating2, rating3, rating4, rating5 };
            tbWeightedScore = new TextBox[] {score1, score2, score3, score4, score5 };

            // edit to PAS PAV PES PEV
            if (Session["Process"] is null)
                Session["Process"] = "PAValidation";
            process = Session["Process"].ToString();

            if (process == "PAValidation" || process == "PEValidation")
                empType = Session["RateeEmpType"].ToString();
            else
                empType = Session["EmpType"].ToString();
            empFormID = Session["EmpFormID"].ToString();

            if (process == "PASubmission" || process == "PAValidation")
            {
                maxWeight = 100;
                minWeight = 1;
            }
            else if (process == "PESubmission")
            {
                maxWeight = 5;
                minWeight = 1;
            }

            if (!IsPostBack)
                Initialize();

            //foreach (string key in HttpContext.Current.Session.Keys)
            //{
            //    var value = HttpContext.Current.Session[key];
            //    WriteMessage($"Key: {key}, Value: {value}");
            //}

            // Check session info
            //Response.Write($"{empFormID} {empType} {process}");
        }
        protected void Initialize()
        {
            string[] sessionInfo = Util_Functions.InitializeAgreementSection(ref tbWeight, ref tbRating, ref tbWeightedScore, ref labelTotal1, ref labelTotal2, empFormID, field, empType, process);
            Session["ReportID"] = sessionInfo[0];
        }

        protected void txt_TextChanged(object sender, EventArgs e)
        {
            TextBox textBox = sender as TextBox;
            string text = textBox.Text;

            if (!int.TryParse(text, out int num))
            {
                ShowAlert($"{text} is not a valid input.");
                textBox.Text = "0";
            }
            else if (num < minWeight || num > maxWeight)
            {
                ShowAlert($"Please input a number within {minWeight} and {maxWeight}.");
                textBox.Text = num < minWeight ? minWeight.ToString() : maxWeight.ToString();
            }
            Util_Functions.ComputeTotal(ref tbWeight, ref labelTotal1);
            Util_Functions.ComputeWeightScore(tbWeight, tbRating, ref tbWeightedScore, ref labelTotal2, textBox);
            Util_Functions.UpdateDatabase(tbWeight, tbRating, tbWeightedScore, labelTotal1, labelTotal2, empFormID, empType, field);
        }


        private void ShowAlert(string message)
        {
            Response.Write($"<script>alert('{message}')</script>");
        }

        protected void Shortcut(object sender, EventArgs e)
        {
            Util_Functions.FillTextBox(ref tbWeight);
            Util_Functions.ComputeTotal(ref tbWeight, ref labelTotal1);
            Util_Functions.UpdateDatabase(tbWeight, tbRating, tbWeightedScore, labelTotal1, labelTotal2, empFormID, empType, field);
        }

        protected void Shortcut2(object sender, EventArgs e)
        {
            Util_Functions.FillTextBox2(tbWeight, ref tbRating, ref tbWeightedScore, ref labelTotal2);
            Util_Functions.ComputeTotal(ref tbWeight, ref labelTotal1);
            Util_Functions.UpdateDatabase(tbWeight, tbRating, tbWeightedScore, labelTotal1, labelTotal2, empFormID, empType, field);
        }

        private void WriteMessage(string message)
        {
            Response.Write($"{message}|");
        }
    }
}