<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_User_LogIn.aspx.cs" Inherits="PerformanceEvaluation_With_UI_.Form_User_LogIn" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Employee Performance Monitoring</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Karantina:wght@300;400;700&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');

    body, html {
      margin: 0;
      padding: 0;
      font-family: 'Inter', sans-serif;
      display: flex;
      justify-content: flex-end;
      align-items: center;
      min-height: 100vh;
      width: 100%;
      background-color: #dfdfdf;
      background-image: url('assets/bkglogin.png');
      background-size: cover;
      background-position: center;
    }
    .container {
      display: flex;
      flex-direction: column;
      align-items: flex-start;
      justify-content: flex-start;
      height: 100%;
      width: 35%;
    }
    .header {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      background-color: #ed1e28;
      height: 51px;
      z-index: 1000;
    }
    .content {
      display: flex;
      flex-direction: column;
      align-items: center;
      color: #002654;
      padding: 20px;
    }
    .title {
      text-align: center;
      font-size: 115px;
      text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.5);
      font-family: "Karantina", system-ui;
      max-width: 60%;
    }
    .input-container {
      width: 70%;
    }

    .input-field::placeholder {
      color: #002654;
    }

    .input-field {
      width: 100%;
      padding: 25px;
      margin-top: 30px;
      font-size: 35px;
      border: 1px solid rgba(0, 38, 84, 1);
      border-radius: 10px;
      box-sizing: border-box;
      color: #002654;
    }
    .link {
      color: #097ea4;
      text-align: center;
      margin-top: 15px;
      font-size: 25px;
    }
    .submit-button {
      background-color: #002654;
      color: white;
      text-align: center;
      padding: 18px;
      margin-top: 25px;
      font-size: 40px;
      border-radius: 10px;
      cursor: pointer;
    }
    .footer {
      position: fixed;
      bottom: 0;
      left: 0;
      width: 100%;
      background-color: #002654;
      color: white;
      text-align: center;
      height: 51px;
      z-index: 1000;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    @media (max-width: 600px) {
      .title {
        font-size: 30px;
      }
      .input-field {
        font-size: 14px;
      }
      .submit-button {
        font-size: 14px;
      }
      .container {
        align-items: flex-end;
      }
    }
  </style>
</head>
<body>
<%--    <form class="container" runat="server">--%>
  <div class="header"></div>
  <form class="container" runat="server">
    <div class="content">
      <div class="title">Employee Performance Monitoring</div>
        <div class="input-container">
            <%--<input type="text" class="input-field" placeholder="Username">--%>
            <asp:TextBox type="email" class="input-field" ID="usernameTxt" placeholder="Username" aria-label="Username" runat="server" />
            <%--<input type="password" class="input-field" placeholder="Password">--%>
            <asp:TextBox type="password" class="input-field" ID="passwordTxt" placeholder="Password" aria-label="Password" runat="server" />
            <div class="link">Forgot password?</div>
<%--            <div class="submit-button">Sign in</div>--%>
            <div><asp:Button ID="Submit" class="submit-button" runat="server" Text=" Sign In " OnClick="Submit_Click" /></div>
            <div>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="faculty" runat="server" Text=" Faculty" OnClick="Shortcut" />
                    </td>
                    <td>
                        <asp:Button ID="staff" runat="server" Text=" Staff " OnClick="Shortcut" />
                    </td>
                    <td>
                        <asp:Button ID="officer" runat="server" Text=" Officer " OnClick="Shortcut" />
                    </td>
                    <td>
                        <asp:Button ID="supervisor" runat="server" Text=" Supervisor " OnClick="Shortcut" />
                    </td>
                </tr>
            </table>
                </div>
        </div>
    </div>
  </form>
<%--        </form>--%>
  <div class="footer">©2024 Mapúa Malayan Colleges Laguna</div>
</body>
</html>
