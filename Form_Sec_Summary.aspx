<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Sec_Summary.aspx.cs" Inherits="PerformanceEvaluation_With_UI_.Form_Sec_Summary" %>

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
        <h3>SECTION 3-SUMMARY</h3>
<h4>OVERALL</h4>
         <div class="row">
            <p>Section 1</p>
            <div>
            <asp:TextBox ID="weight1_1" runat="server" AutoPostBack="True" Height="18px" TextMode="Number" Width="91px" Text="0" Enabled="False" CssClass="normal"></asp:TextBox>
                <label>Total Weight:</label>
            </div>
            <div>
            <asp:TextBox ID="rating1" runat="server" AutoPostBack="True" Height="18px" TextMode="Number" Width="91px" Text="0" Enabled="False" CssClass="normal"></asp:TextBox>
                <label>Weight Score:</label>
            </div>
            <div>
            <asp:TextBox ID="percent1" runat="server" AutoPostBack="True" Height="18px" TextMode="Number" Width="91px" Text="0" Enabled="False" CssClass="normal"></asp:TextBox>
                <label>Percentage:</label>
            </div>
            <div>
                <asp:TextBox ID="score1" runat="server" AutoPostBack="True" Height="18px" TextMode="Number" Width="91px" Text="0" Enabled="False" CssClass="normal"></asp:TextBox>
                <label>Total Score:</label>
            </div>
        </div>
        <div class="row">
            <p>Section 2</p>
            <div>
                <asp:TextBox ID="weight1_2" runat="server" AutoPostBack="True" Height="18px" TextMode="Number" Width="91px" Text="0" Enabled="False" CssClass="normal"></asp:TextBox>
                <label>Total Weight:</label>
            </div>
            <div>
                <asp:TextBox ID="rating2" runat="server" AutoPostBack="True" Height="18px" TextMode="Number" Width="91px" Text="0" Enabled="False" CssClass="normal"></asp:TextBox>
                <label>Weight Score:</label>
            </div>
            <div>
                <asp:TextBox ID="percent2" runat="server" AutoPostBack="True" Height="18px" TextMode="Number" Width="91px" Text="0" Enabled="False" CssClass="normal"></asp:TextBox>
                <label>Percentage:</label>
            </div>
            <div>
                <asp:TextBox ID="score2" runat="server" AutoPostBack="True" Height="18px" TextMode="Number" Width="91px" Text="0" Enabled="False" CssClass="normal"></asp:TextBox>
                <label>Total Score:</label>
            </div>
        </div>
        <asp:Button ID="Submit" runat="server" Text=" Submit " OnClick="Submit_Click"/>

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

