<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Sec_Agree_Header.aspx.cs" Inherits="PerformanceEvaluation_With_UI_.Form_Sec_Agree_Header" %>

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
        <div>
            <div class="tab-buttons">
              <button id="section-1-institution" class="tab-button" onclick="showAgreementContent('section-1-institution')">Section 1-Institutional Objectives</button>
              <button id="section-1-a" class="tab-button" onclick="showAgreementContent('section-1-a',)">Section 1-A</button>
              <button id="section-1-b" class="tab-button" onclick="showAgreementContent('section-1-b')">Section 1-B</button>
              <button id="section-2" class="tab-button" onclick="showAgreementContent('section-2')">Section 2</button>
              <button id="section-3" class="tab-button" onclick="showAgreementContent('section-3')">Section 3</button>
              <button id="section-3-comments" class="tab-button" onclick="showAgreementContent('section-3-comments')">Section 3-Comments</button>
              <button id="section-3-summary" class="tab-button" onclick="showAgreementContent('section-3-summary')">Section 3-Summary</button>
              <button id="section-4" class="tab-button" onclick="showAgreementContent('section-4')">Section 4-Governance, Risk Management and Control</button>
            </div>
            <div id="agreement-content">Please select an option above to view the content.</div>
        </div>
    <script>
        function transitionContent(content) {
            var agreementContent = document.getElementById("agreement-content");
            agreementContent.style.transition = 'transform 0.5s ease, opacity 0.5s ease';
            agreementContent.style.transform = 'translateY(50px)'; // Slide up by 50px or any other value
            agreementContent.style.opacity = '0';
            setTimeout(function () {
                agreementContent.innerHTML = content;
                agreementContent.style.transform = 'translateY(0px)'; // Slide down
                agreementContent.style.opacity = '1';
            }, 250);
        }

        function showAgreementContent(type) {
            var agreementContent = document.getElementById("agreement-content");
            var contentToDisplay = '';
            keyInitiativeCount = 0;
            scopeProcessCount = 0;

            switch (type) {
                case "academics":
                    contentToDisplay = '<iframe src="Form_Sec_Academic.aspx" width="100% " height="800px"></iframe>';
                    break;
                case "ethics":
                    contentToDisplay = '<iframe src="Form_Sec_Ethics.aspx" width="100% " height="800px"></iframe>';
                    break;
                case "proficiency":
                    contentToDisplay = '<iframe src="Form_Sec_Proficiency.aspx" width="100% " height="800px"></iframe>';
                    break
                case "coreValues":
                    contentToDisplay = '<iframe src="Form_Sec_CoreValues.aspx" width="100% " height="800px"></iframe>';
                    break;
                case "comments":
                    contentToDisplay = '<iframe src="Form_Sec_Comments.aspx" width="100% " height="800px"></iframe>';
                    break;
                case "summary":
                    contentToDisplay = '<iframe src="Form_Sec_Summary.aspx" width="100% " height="800px"></iframe>';
                    break;
            }

            transitionContent(contentToDisplay, type);

            const buttons = document.querySelectorAll('.tab-button');
            buttons.forEach(button => button.classList.remove('active'));

            const activeButton = document.getElementById(type);
            if (activeButton) {
                activeButton.classList.add('active');
            }
        }



    </script>
</body>
</html>
