<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Sec_Ethics.aspx.cs" Inherits="PerformanceEvaluation_With_UI_.Form_Sec_Ethics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
    <!-- The StyleSheet -->
    <link href="Staff-Officer-Faculty.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <h3>SECTION 1-B: PROFESSIONAL ETHICS AND ADMINISTRATIVE COMPLIANCE</h3>
            <div class="collapsible" data-target="Q1-s1b" onclick="toggleContent('Q1-s1b')"><h4>1. Timely Submission of Required Documents</h4></div>
            <div id="Q1-s1b" class="content">
              <p> The faculty member promtly submits his/her class records , final grades, final exams for printing, syllabus, other reports required by the Chair/Dean.</p>
              <div class="content-container">
                <div>
                  <label>Weight:</label>
                  <input type="text" class="weight" placeholder="0">
                </div>
                <div>
                  <label>Rating:</label>
                  <input type="text" class="rating" placeholder="0">
                </div>
                <div>
                  <label>Score:</label>
                  <input type="text" class="score" placeholder="0" readonly>
                </div>
              </div>
            </div>

            <div class="collapsible" data-target="Q2-s1b" onclick="toggleContent('Q2-s1b')"><h4>2. Participation in OFficial Mapúa MCL Functions, Events and Activities</h4></div>
            <div id="Q2-s1b" class="content">
              <p> The faculty member attents institutional activities, functions and events as well as, all faculty and employee meetings.</p>
              <div class="content-container">
                <div>
                  <label>Weight:</label>
                  <input type="text" class="weight" placeholder="0">
                </div>
                <div>
                  <label>Rating:</label>
                  <input type="text" class="rating" placeholder="0">
                </div>
                <div>
                  <label>Score:</label>
                  <input type="text" class="score" placeholder="0" readonly>
                </div>
              </div>
            </div>

            <div class="collapsible" data-target="Q3-s1b" onclick="toggleContent('Q3-s1b')"><h4>3. Support for Quality Instruction</h4></div>
            <div id="Q3-s1b" class="content">
              <p> The faculty member assists the program for the attainment of its objectives for quality output.</p>
              <div class="content-container">
                <div>
                  <label>Weight:</label>
                  <input type="text" class="weight" placeholder="0">
                </div>
                <div>
                  <label>Rating:</label>
                  <input type="text" class="rating" placeholder="0">
                </div>
                <div>
                  <label>Score:</label>
                  <input type="text" class="score" placeholder="0" readonly>
                </div>
              </div>
            </div>

            <div class="collapsible" data-target="Q4-s1b" onclick="toggleContent('Q4-s1b')"><h4>4. Research Initiatives</h4></div>
            <div id="Q4-s1b" class="content">
              <p> The faculty member contributes to the research undertaking of the college.</p>
              <div class="content-container">
                <div>
                  <label>Weight:</label>
                  <input type="text" class="weight" placeholder="0">
                </div>
                <div>
                  <label>Rating:</label>
                  <input type="text" class="rating" placeholder="0">
                </div>
                <div>
                  <label>Score:</label>
                  <input type="text" class="score" placeholder="0" readonly>
                </div>
              </div>
            </div>

            <div class="collapsible" data-target="Q5-s1b" onclick="toggleContent('Q5-s1b')"><h4>5. Extension Services</h4></div>
            <div id="Q5-s1b" class="content">
              <p> The faculty initiates, attends, and participates in community engagement activities of the college.</p>
              <div class="content-container">
                <div>
                  <label>Weight:</label>
                  <input type="text" class="weight" placeholder="0">
                </div>
                <div>
                  <label>Rating:</label>
                  <input type="text" class="rating" placeholder="0">
                </div>
                <div>
                  <label>Score:</label>
                  <input type="text" class="score" placeholder="0" readonly>
                </div>
              </div>
            </div>
        <script>
    function toggleContent(id) {
        var content = document.getElementById(id);
        var collapsibles = document.querySelectorAll('.collapsible');

        // Loop through all collapsibles
        for (var i = 0; i < collapsibles.length; i++) {
            var currentId = collapsibles[i].getAttribute('data-target');
            var currentContent = document.getElementById(currentId);

            // If the current collapsible is not the one clicked, close it
            if (currentId !== id) {
                currentContent.style.display = "none";
            }
        }

        // Toggle the clicked content
        if (content.style.display === "block") {
            content.style.display = "none";
        } else {
            content.style.display = "block";
        }
    }
        </script>
    </form>
</body>
</html>

