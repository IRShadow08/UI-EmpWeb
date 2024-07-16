using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PerformanceEvaluation_With_UI_
{
    public partial class Form_Sec_Comments : System.Web.UI.Page
    {
        TextBox[] comments;
        string process;

        TextBox[] tbWeight, tbRating, tbWeightedScore;
        string empFormID, empType, field = "Section1CWR"; // have to adjust what field based on emptype 
        int maxWeight, minWeight;


        protected void Page_Load(object sender, EventArgs e)
        {
            comments = new TextBox[] {strength, improvement, development, acknowledgement };

            if (Session["Process"] is null)
                Session["Process"] = "PAValidation";

            process = Session["Process"].ToString();

            if (process == "PAValidation" || process == "PEValidation")
                empType = Session["RateeEmpType"].ToString();
            else
                empType = Session["EmpType"].ToString();

            empFormID = Session["EmpFormID"].ToString();

            if (!IsPostBack)
            {
                Initialize();
            }
        }

        protected void Initialize() 
        {
            Util_Functions.InitializeComments(empFormID, empType, ref comments);
            process = Session["Process"].ToString();
        }

        protected void ChangeSection(object sender, EventArgs e)
        {
            Response.Redirect("~/Form_Summary.aspx");
        }

        protected void txt_TextChanged(object sender, EventArgs e)
        {
            Util_Functions.UpdateDatabase(comments, empType, empFormID);
        }
    }
}