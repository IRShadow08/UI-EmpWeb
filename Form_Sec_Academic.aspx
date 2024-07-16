<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Sec_Academic.aspx.cs" Inherits="PerformanceEvaluation_With_UI_.Form_Sec_Academic" %>

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
        <div>
            <h3>SECTION 1-A: ACADEMIC PERFORMANCE</h3>

          <div class="collapsible" data-target="Q1-s1a" onclick="toggleContent('Q1-s1a')"><h5>A. Faculty Evaluation by Students</h5></div>
          <div id="Q1-s1a" class="content">
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
          
          <div class="collapsible" data-target="Q2-s1a" onclick="toggleContent('Q2-s1a')"><h5>B. Classroom Teaching Observation by Peers</h5></div>
          <div id="Q2-s1a" class="content">
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
          
          <div class="collapsible" data-target="Q3-s1a" onclick="toggleContent('Q3-s1a')"><h5>C. Classroom Teaching Observation by Dean/Chair</h5></div>
          <div id="Q3-s1a" class="content">
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
