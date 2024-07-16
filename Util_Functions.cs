using Npgsql;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

namespace PerformanceEvaluation_With_UI_
{
    public static class Util_Functions
    {

        #region UPDATE DATABASE
        public static void UpdateDatabase(TextBox[] weightArr, TextBox[] ratingArr, TextBox[] tbWeightScore, Label totalWeight, Label totalWeightScore, string empTypeID, string empType, string field)
        {
            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
                {
                    connection.Open();

                    NpgsqlCommand command = new NpgsqlCommand($@"UPDATE ""{empType}Form"" SET ""{field}"" = @CWR WHERE ""{empType}FormID"" = @{empType}FormID", connection);
                    command.Parameters.AddWithValue("@CWR", CompileAnswers(weightArr, ratingArr, tbWeightScore, totalWeight, totalWeightScore));
                    command.Parameters.AddWithValue($"@{empType}FormID", empTypeID);
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {

            }
        }

        public static string CompileAnswers(TextBox[] weightArr, TextBox[] ratingArr, TextBox[] tbWeightScore, Label totalWeight, Label totalWeightScore)
        {
            string CWR = "";

            for (int i = 0; i < weightArr.Length; i++)
            {
                CWR += $"{weightArr[i].Text},{ratingArr[i].Text},{tbWeightScore[i].Text};";
            }

            return CWR.Trim(';') + $"|{totalWeight.Text},{totalWeightScore.Text}"; ;
        }
        #endregion

        #region CREATE AGREEMENT FORM
        public static string[] CreateAgreementForm(string rateeID, string empType)
        {
            string supID, formID;
            supID = GetSupervisorID(rateeID);

            return new string[]
            {
                formID = InsertEmpPerfInfo(rateeID, supID),
                InsertEmpFormInfo(formID, empType),
                InsertStatRepInfo(rateeID)
            };
        }

        public static string InsertStatRepInfo(string empID)
        {
            string query, reportID;
            long counnt = 6000000001;

            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
            {
                connection.Open();

                query = @"SELECT COUNT(*) FROM ""StatusReport""";
                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                reportID = (counnt + Convert.ToInt32(command.ExecuteScalar())).ToString();

                query = @"INSERT INTO ""StatusReport"" VALUES (@ReportID, @EmpID, 0, 0, 0, 0)";
                command = new NpgsqlCommand(query, connection);
                command.Parameters.AddWithValue("@ReportID", reportID);
                command.Parameters.AddWithValue("@EmpID", empID);
                command.ExecuteNonQuery();
            }
            return reportID;
        }

        public static string InsertEmpPerfInfo(string empID, string supID)
        {
            string query, formID;
            long counnt = 1200000001;

            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
            {
                connection.Open();

                query = @"SELECT COUNT(*) FROM ""EmployeePerformance""";
                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                formID = (counnt + Convert.ToInt32(command.ExecuteScalar())).ToString();
                //Session["FormID"] = formID;

                query = @"INSERT INTO ""EmployeePerformance"" VALUES (@FormID , @EmpID , @SupID , 0)";
                command = new NpgsqlCommand(query, connection);
                command.Parameters.AddWithValue("@FormID", formID);
                command.Parameters.AddWithValue("@EmpID", empID);
                command.Parameters.AddWithValue("@SupID", supID);
                command.ExecuteNonQuery();

                connection.Close();
            }
            return formID;
        }

        public static string InsertEmpFormInfo(string formID, string empType)
        {
            string empFormID, query, insertQuery = "";
            long counnt = 0;

            switch (empType)
            {
                case "Staff":
                    counnt = 3000000001;
                    insertQuery = $@"INSERT INTO ""StaffForm"" VALUES (@StaffFormID, @FormID , 0, 0, 0, 0, 0, 0, 0)";
                    break;
                case "Faculty":
                    counnt = 4000000001;
                    insertQuery = @"INSERT INTO ""FacultyForm"" VALUES (@FacultyFormID, @FormID , 0, 0, 0, 0, 0, 0, 0)";
                    break;
                case "Officer":
                    counnt = 5000000001;
                    insertQuery = @"INSERT INTO ""OfficerForm"" VALUES (@OfficerFormID, @FormID, 0, 0, 0, 0, 0, 0, 0, 0, 0)";
                    break;

                default:
                    break;
            }

            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
            {
                connection.Open();

                query = $@"SELECT COUNT(*) FROM ""{empType}Form""";
                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                empFormID = (counnt + Convert.ToInt32(command.ExecuteScalar())).ToString();

                command = new NpgsqlCommand(insertQuery, connection);
                command.Parameters.AddWithValue($"@{empType}FormID", empFormID);
                command.Parameters.AddWithValue("@FormID", formID);
                command.ExecuteNonQuery();

                connection.Close();
            }
            return empFormID;
        }

        public static string GetSupervisorID(string empID)
        {
            string query, supID = "";

            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
            {
                connection.Open();

                query = @"SELECT ""SupID"" FROM ""Employee"" WHERE ""Employee"".""EmpID"" = @empID";
                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                command.Parameters.AddWithValue("@EmpID", empID);
                NpgsqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    supID = reader.GetString(0);
                }
                reader.Close();

                connection.Close();
            }
            return supID;
        }
        #endregion

        #region INITIALIZE AGREEMENT

        public static string[] InitializeAgreement(string empID, string empType)
        {
            string query, reportID = "", empFormID = "", PAVal = "";

            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
            {
                connection.Open();

                query = $@"SELECT SR.""PAValidation"", (SELECT ""{empType}FormID"" FROM ""{empType}Form"" SF WHERE SF.""FormID"" = EP.""FormID""), ""ReportID"" FROM ""EmployeePerformance"" EP INNER JOIN ""StatusReport"" SR ON EP.""EmpID"" = SR.""EmpID"" WHERE EP.""EmpID"" = @empID;";
                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                command.Parameters.AddWithValue("@EmpID", empID);
                NpgsqlDataReader reader = command.ExecuteReader();

                if (!reader.HasRows)
                    return null;

                while (reader.Read())
                {
                    PAVal = reader.GetString(0);
                    empFormID = reader.GetString(1);
                    reportID = reader.GetString(2);

                }
                reader.Close();

                connection.Close();
            }
            return new string[]
            {
                (PAVal != "0" && PAVal != null).ToString(),
                empFormID,
                reportID
            };
        }

        #endregion

        #region INITIALIZE AGREEMENT SECTION

        public static string[] InitializeAgreementSection(ref TextBox[] weightArr, ref TextBox[] tbRating, ref TextBox[] tbWeightScore, ref Label totalWeight, ref Label totalWeightScore, string empFormID, string field, string empType, string process)
        {
            string query, CWR = "", PASub = "", reportID = "";
            bool PASubDone;

            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
            {
                connection.Open();

                query = $@"SELECT ""{field}"", ""ReportID"", ""PASubmission"" FROM ""{empType}Form"" INNER JOIN ""EmployeePerformance"" ON ""{empType}Form"".""FormID"" = ""EmployeePerformance"".""FormID"" INNER JOIN ""StatusReport"" ON ""EmployeePerformance"".""EmpID"" = ""StatusReport"".""EmpID"" WHERE ""{empType}FormID"" = @empFormID";
                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                command.Parameters.AddWithValue("@empFormID", empFormID);

                NpgsqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    CWR = reader.GetString(0);
                    reportID = reader.GetString(1);
                    PASub = reader.GetString(2);
                }
                reader.Close();

                connection.Close();
            }

            PASubDone = PASub != "0" && PASub != null;

            SetWeightText(ref weightArr, ref tbRating, ref tbWeightScore, ref totalWeight, ref totalWeightScore, CWR);
            EnableTextBoxes(ref weightArr, ref tbRating, ref tbWeightScore, process);

            return new string[]
            {
                reportID,
                PASubDone.ToString(),
                CWR
            };
        }

        public static void SetWeightText(ref TextBox[] weightArr, ref TextBox[] tbRating, ref TextBox[] tbWeightScore, ref Label totalWeight, ref Label totalWeightScore, string CWR)
        {
            if (CWR != "0")
            {
                string[] tempArr = CWR.Split('|');
                string[] CWRArr = tempArr[0].Split(';');
                string[] tempArr2 = tempArr[1].Split(',');

                totalWeight.Text = tempArr2[0];
                totalWeightScore.Text = tempArr2[1];

                for (int i = 0; i < CWRArr.Length; i++)
                {
                    string[] CWRValues = CWRArr[i].Split(',');
                    weightArr[i].Text = CWRValues[0];
                    tbRating[i].Text = CWRValues[1];
                    tbWeightScore[i].Text = CWRValues[2];
                }
            }
        }

        public static void EnableTextBoxes(ref TextBox[] weightArr, ref TextBox[] tbRating, ref TextBox[] tbWeightScore, string process)
        {
            //string process = session["Process"].ToString();

            if (process == "PESubmission" || process == "PEValidation")
            {
                for (int i = 0; i < weightArr.Length; i++)
                {
                    weightArr[i].Enabled = false;
                    tbRating[i].Enabled = true;
                    tbWeightScore[i].Enabled = false;
                }
            }
            else if (process == "PASubmission" || process == "PAValidation")
            {
                for (int i = 0; i < weightArr.Length; i++)
                {
                    weightArr[i].Enabled = true;
                    tbRating[i].Enabled = false;
                    tbWeightScore[i].Enabled = false;
                }
            }
            else if (process == "Viewing")
            {
                for (int i = 0; i < weightArr.Length; i++)
                {
                    weightArr[i].Enabled = false;
                    tbRating[i].Enabled = false;
                    tbWeightScore[i].Enabled = false;
                }
            }

        }

        #endregion

        public static void ComputeTotal(ref TextBox[] weightArr, ref Label total)
        {
            // WEIGHT
            double totalWeight = 0;

            foreach (TextBox weight in weightArr)
            {
                totalWeight += double.Parse(weight.Text);
            }

            total.Text = totalWeight.ToString("0.00");
        }

        public static string ComputeWeightScore(TextBox[] weightArr, TextBox[] ratingArr, ref TextBox[] scoreArr, ref Label total, TextBox rating)
        {
            // RATING
            double rate, weight;
            double weightScore;

            for (int i = 0; i < ratingArr.Length; i++)
            {
                if (rating.ID == ratingArr[i].ID)
                {
                    rate = double.Parse(rating.Text);
                    weight = double.Parse(weightArr[i].Text);
                    weightScore = rate * (weight/100);
                    scoreArr[i].Text = weightScore.ToString();
                }
            }

            double totalScore = 0;
            foreach (TextBox score in scoreArr)
            {
                totalScore += double.Parse(score.Text);
            }
            total.Text = (totalScore).ToString("0.00");

            return rating.ID;
        }


        #region INITIALIZE EVALUATION

        public static string[] EmpInitEvalSec(ref TextBox[] weightArr, ref TextBox[] tbRating, ref TextBox[] tbWeightScore, ref Label totalWeight, ref Label totalWeightScore, string process, string empType, string empID, string field)
        {
            string query, CWR = "", PESub = "", formID = "", empFormID = "", reportID = "", rateeID;

            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
            {
                connection.Open();

                query = $@"SELECT ""EmployeePerformance"".""FormID"", ""{empType}FormID"", ""{field}"", ""ReportID"", ""PESubmission"" FROM ""{empType}Form"" INNER JOIN ""EmployeePerformance"" ON ""{empType}Form"".""FormID"" = ""EmployeePerformance"".""FormID"" INNER JOIN ""StatusReport"" ON ""EmployeePerformance"".""EmpID"" = ""StatusReport"".""EmpID"" WHERE ""EmployeePerformance"".""EmpID"" = @EmpID";
                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                command.Parameters.AddWithValue("@EmpID", empID);

                NpgsqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    formID = reader.GetString(0);
                    empFormID = reader.GetString(1);
                    CWR = reader.GetString(2);
                    reportID = reader.GetString(3);
                    PESub = reader.GetString(4);
                }
                reader.Close();

                connection.Close();
            }
            rateeID = empID;

            bool PESubDone = PESub != "0" && PESub != null;

            SetWeightText(ref weightArr, ref tbRating, ref tbWeightScore, ref totalWeight, ref totalWeightScore, CWR);
            EnableTextBoxes(ref weightArr, ref tbRating, ref tbWeightScore, process);




            return new string[]
            {
                formID, empFormID, reportID, rateeID, CWR, PESubDone.ToString()
            };




        }


        #endregion


        #region INITIALIZE OVERALL SECTION

        public static void InitializeEvalOverall(ref TextBox[] totals, ref Button submit, string empFormID, string empType, string fields, string process)
        {
            string query;
            int fieldCount = fields.Split(',').Length;
            string[] comments = new string[fieldCount];
            string[] CWRArr = new string[fieldCount];

            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
            {   
                connection.Open();
                query = $@"
                SELECT {fields}, ""Strength"", ""Improvement"", ""Development"", ""Acknowledgement""
                FROM ""{empType}Form"" 
                INNER JOIN ""EmployeePerformance"" ON ""{empType}Form"".""FormID"" = ""EmployeePerformance"".""FormID"" 
                INNER JOIN ""StatusReport"" ON ""EmployeePerformance"".""EmpID"" = ""StatusReport"".""EmpID"" 
                WHERE ""{empType}FormID"" = @empFormID";

                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                command.Parameters.AddWithValue("@empFormID", empFormID);

                NpgsqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    for (int i = 0; i < fieldCount; i++)
                    {
                        CWRArr[i] = reader.GetString(i);
                    }
                    comments = new string[]
                    {
                        reader.GetString(fieldCount),
                        reader.GetString(fieldCount+1),
                        reader.GetString(fieldCount+2),
                        reader.GetString(fieldCount+3)
                    };
                }
                reader.Close();
                connection.Close();
            }


            if (CWRArr[0] != "0")
            {
                for (int i = 0; i < CWRArr.Length; i++)
                {
                    string[] temp = CWRArr[i].Split('|');
                    string[] temp2 = temp[1].Split(',');
                    if (!ValidateSection(temp[0], temp2[0], temp2[1], process, comments))
                    {
                        submit.Enabled = false;
                    }
                    totals[i].Text = temp2[1];
                }
            }
            else
            {
                submit.Enabled = false;
            }


            if (process == "Viewing")
            {
                submit.Enabled = false;
                submit.Visible = false;
            }


        }

        public static void InitializeOverall(ref TextBox[] totalWeight, ref TextBox[] totalScore, ref Button submit, string empFormID, string empType, string fields, string process)
        {
            string query;
            int fieldCount = fields.Split(',').Length;
            string[] comments = new string[fieldCount];
            string[] CWRArr = new string[fieldCount];
            

            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
            {
                connection.Open();
                query = $@"
                SELECT {fields}, ""Strength"", ""Improvement"", ""Development"", ""Acknowledgement""
                FROM ""{empType}Form"" 
                INNER JOIN ""EmployeePerformance"" ON ""{empType}Form"".""FormID"" = ""EmployeePerformance"".""FormID"" 
                INNER JOIN ""StatusReport"" ON ""EmployeePerformance"".""EmpID"" = ""StatusReport"".""EmpID"" 
                WHERE ""{empType}FormID"" = @empFormID";

                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                command.Parameters.AddWithValue("@empFormID", empFormID);

                NpgsqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    for (int i = 0; i < fieldCount; i++)
                    {
                        CWRArr[i] = reader.GetString(i);
                    }
                    comments = new string[]
                    {
                        reader.GetString(fieldCount),
                        reader.GetString(fieldCount+1),
                        reader.GetString(fieldCount+2),
                        reader.GetString(fieldCount+3)
                    };
                }
                reader.Close();
                connection.Close();
            }

            for (int i = 0; i < fieldCount; i++)
            {
                if (CWRArr[i] != "0") 
                {
                    string[] temp = CWRArr[i].Split('|');
                    string[] temp2 = temp[1].Split(',');
                    if (!ValidateSection(temp[0], temp2[0], temp2[1], process, comments))
                    {
                        submit.Enabled = false;
                    }
                    totalWeight[i].Text = temp2[0];
                    totalScore[i].Text = temp2[1];
                }
                else
                {
                    totalWeight[i].Text = "0";
                    totalScore[i].Text = "0";
                    submit.Enabled = false;
                }
            }



            if (process == "Viewing")
            {
                submit.Enabled = false;
                submit.Visible = false;
            }


        }

        public static bool ValidateSection(string CWR, string weight, string weightScore, string process, string[] comments)
        {
            string[] CWRArr = CWR.Split(';');

            if (process == "PASubmission" || process == "PAValidation")
            {
                if (CWR == "0" || weight != "100.00")
                    return false;

                for (int i = 0; i < CWRArr.Length; i++)
                {
                    string[] CWRValues = CWRArr[i].Split(',');
                    if (CWRValues[0] == "0")
                    {
                        return false;
                    }
                }
            }
            else if (process == "PESubmission" || process == "PEValidation")
            {
                for (int i = 0; i < CWRArr.Length; i++)
                {
                    string[] CWRValues = CWRArr[i].Split(',');
                    if (CWRValues[1] == "0")
                    {
                        return false;
                    }
                }

                if (process == "PEValidation")
                {
                    foreach (string comms in comments)
                    {
                        if (comms == "")
                        {
                            return false;
                        }
                    }
                }
            }





            return true;
        }


        #endregion

        #region UPDATE STATUS REPORT

        public static void UpdateStatRep(string process, string reportID)
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
            {
                connection.Open();
                string query = $@"UPDATE ""StatusReport"" SET ""{process}"" = @Time WHERE ""ReportID"" = @ReportID";
                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                command.Parameters.AddWithValue("@Time", DateTime.Now.ToString());
                command.Parameters.AddWithValue("@ReportID", reportID);
                command.ExecuteNonQuery();
            }
        }

        #endregion

        #region SHORTCUTS

        public static void FillTextBox(ref TextBox[] tbWeight)
        {
            int secValue = 100 / tbWeight.Length;
            int rem = 100 % tbWeight.Length;

            foreach (var item in tbWeight)
            {
                item.Text = secValue.ToString();
            }

            tbWeight[tbWeight.Length - 1].Text = (secValue + rem).ToString();
        }

        public static void FillTextBox2(TextBox[] tbWeight, ref TextBox[] textBox, ref TextBox[] tbWeightedScore, ref Label labelTotal2)
        {
            foreach (var item in textBox)
            {
                item.Text = "3";
                Util_Functions.ComputeWeightScore(tbWeight, textBox, ref tbWeightedScore, ref labelTotal2, item);
            }
        }

        #endregion


        #region COMMENTS

        public static void InitializeComments(string empFormID, string empType, ref TextBox[] commentArr)
        {
            using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
            {
                connection.Open();
                string query = $@"SELECT ""Strength"", ""Improvement"", ""Development"", ""Acknowledgement"", ""ReportID"" FROM ""{empType}Form"" INNER JOIN ""EmployeePerformance"" ON ""{empType}Form"".""FormID"" = ""EmployeePerformance"".""FormID"" INNER JOIN ""StatusReport"" ON ""EmployeePerformance"".""EmpID"" = ""StatusReport"".""EmpID"" WHERE ""{empType}FormID"" = @empFormID";
                NpgsqlCommand command = new NpgsqlCommand(query, connection);
                command.Parameters.AddWithValue("@empFormID", empFormID);

                NpgsqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    if (reader.GetString(0) != "0")
                        commentArr[0].Text = reader.GetString(0);
                    if (reader.GetString(1) != "0")
                        commentArr[1].Text = reader.GetString(1);
                    if (reader.GetString(2) != "0")
                        commentArr[2].Text = reader.GetString(2);
                    if (reader.GetString(3) != "0")
                        commentArr[3].Text = reader.GetString(3);
                }
                reader.Close();
                connection.Close();
            }
        }

        public static void UpdateDatabase(TextBox[] commentArr, string empType, string empFormID)
        {
            try
            {
                using (NpgsqlConnection connection = new NpgsqlConnection(@"Server=localhost;Port=5432;User Id=postgres;Password=Chill@285868619;Database=EmployeeEval;"))
                {
                    connection.Open();
                    NpgsqlCommand command = new NpgsqlCommand($@"UPDATE ""{empType}Form"" SET ""Strength"" = @Strength, ""Improvement"" = @Improvement, ""Development"" = @Development, ""Acknowledgement"" = @Acknowledgement WHERE ""{empType}FormID"" = @empFormID", connection);
                    command.Parameters.AddWithValue("@Strength", commentArr[0].Text);
                    command.Parameters.AddWithValue("@Improvement", commentArr[1].Text);
                    command.Parameters.AddWithValue("@Development", commentArr[2].Text);
                    command.Parameters.AddWithValue("@Acknowledgement", commentArr[3].Text);
                    command.Parameters.AddWithValue("@empFormID", empFormID);
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {

            }
        }

        #endregion
    }
}