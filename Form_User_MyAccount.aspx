<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_User_MyAccount.aspx.cs" Inherits="PerformanceEvaluation_With_UI_.Form_User_MyAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>
    <style>
  @import url('https://fonts.googleapis.com/css?family=Inter');
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
    min-height: 100vh;
  }

  header {
    background-color: #ED1E28;
    height: 30px;
    padding: 10px 0;
  }

  .header-text {
    font-size: 40px;
    font-family: Alike; 
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    margin: 0 0 10px 0;
  }

  .sidebar {
    position: fixed;
    left: 0;
    top: 50px;
    bottom: 51px;
    background-color: white;
    color: black;
    padding: 20px;
    box-shadow: 5px 0px 5px rgba(4, 4, 4, 0.2);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }

  .sidebar .logo-img {
    max-width: 200px;
    height: auto;
    margin-bottom: 30px;
  }

  .sidebar label,
  .sidebar #sign-out {
    cursor: pointer;
    color: black;
    display: block;
    padding: 10px 20px; 
    transition: all 0.3s ease-in-out;
    margin-bottom: 5px; 
    box-sizing: border-box;
    font-size: 20px;
    position: relative;
  }
  
  .sidebar i {
    font-size: 24px; 
    margin-right: 10px;
  }

  .fa-fw{
    vertical-align: middle;
  }

  .sidebar label:not(#sign-out) {
    margin-bottom: 20px;
  }

  .sidebar #sign-out {
    margin-top: auto;
  }

  .sidebar label:hover, .sidebar #sign-out:hover {
    background-color: #646363;
    border-top-left-radius: 50px;
    border-bottom-left-radius: 50px;
    color: white;
    margin-right: -20px;
    padding-right: 40px;
    box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.3);
  }

  .main-content {
    margin-left: 300px;
    padding: 20px;
    text-align: right;
    background-image: url(assets/bkg2done.png); 
    background-size: cover; 
    background-position: center; 
    background-repeat: no-repeat; 
    color: white; 
    flex-grow: 1;
  }

  .sidebar input[type="radio"] {
    display: none;
  }

  .sidebar label.active {
    background-color: #dd2323;
    border-top-left-radius: 50px;
    border-bottom-left-radius: 50px;
    margin-right: -20px;
    padding-right: 40px;
    color: white;
    box-shadow: inset 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
  }

  footer {
    position: fixed;
    background-color: #002654;
    text-align: center;
    color: white;
    bottom: 0;
    width: 100%;
  }

  .popup {
    position: fixed;
    top: 49.8%;
    right: -2100px;
    transform: translateY(-50%);
    background-color: #F8F8F8;
    color: black;
    width: 80%;
    height: 82.3%;
    transition: right 0.3s ease, opacity 0.3s ease;
    padding: 20px;
    opacity: 0;
    z-index: 1000;
    box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.5);
  }

  .popup.show {
    right: 0;
    opacity: 1;
  }

  .popup.hide {
    right: -2100px;
    opacity: 0;
  }

  .form-section {
    display: flex;
    flex-direction: row;
    align-items: center;
    margin: 15px 0px;
  }
  
  .form-section label {
    color:#373737;
    flex: 0 0 230px;
    text-align: left;
    margin-right: 10px;
    font-size: 20px;
  }
  
  .form-section input {
    height: 24px;
    flex: 1;
  }

  .form-section button {
    display: block;
    margin: 0 auto;
    padding: 5px 50px;
    background-color: #dd2323;
    color: white;
    border: none;
    border-radius: 50px;
    font-size: 18px;
    cursor: pointer;
    box-shadow: inset 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
  }
  
  .form-section button:hover {
    background-color: #b30000; /* Darken the background color on hover */
  }

  .self-account{
    display: flex;
    font-size: 32px;
    flex-direction: column;
    align-items: center;
    margin: 5px 0;
    border-bottom: 2px solid rgba(0, 0, 0, 0.2);
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
  }

  .self-account i{
    font-size: 190px;
    color: black;;
  }

  /*Employee Agreement CSS*/
  .agree-eval-header{
    display: flex;
    align-items: center; 
    justify-content: center;
    gap: 30px;
    border-bottom: 2px solid rgba(0, 0, 0, 0.2);
  }

  .container-section {
    display: flex;
    justify-content: center; 
  }
  
  .left-section,
  .right-section {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between; 
  }
  
  .back-btn-agree, .back-btn-eval,
  .next-btn-agree, .next-btn-eval {
    padding: 12px 20px;
    background-color: #dd2323;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    color: white;
    position: absolute;
    box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.3);
    bottom: 30px;
  }
  
  .back-btn-agree, .back-btn-eval {
    left: 40%; 
  }
  
  .next-btn-agree, .next-btn-eval {
    right: 40%;
  }

  .back-btn-agree:hover,
  .back-btn-eval:hover {
    background-color: #373737;
  }
  
  .next-btn-agree:hover,
  .next-btn-eval:hover {
    background-color: #373737;
  }

  .agree-eval-container {
    background-color: #f0f0f0;
    border: 2px solid #ccc;
    border-radius: 8px;
    padding: 20px;
    margin: 10px;
    position: relative;
  }
  
  .view-agree-eval-btn {
    position: absolute;
    bottom: 10px;
    right: 10px;
    padding: 12px;
    background-color: #dd2323;
    color: white;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    box-shadow: inset 0 0 10px rgba(0, 0, 0, 0.3);
  }
  
  .view-agree-eval-btn:hover {
    background-color: #373737;
  }
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-section self-account">
            <i class="fas fa-user-circle"></i>
            <h4>Employee Name</h4>
        </div>
        <div class="form-section">
            <label for="id">ID:</label>
            <input type="text" id="id"/>
        </div>
        <div class="form-section">
            <label for="position">Position:</label>
            <input type="text" id="position" readonly>
        </div>
        <div class="form-section">
            <label for="department">Department:</label>
            <input type="text" id="department" readonly>
        </div>
        <div class="form-section">
            <label for="email">Supervisor:</label>
            <input type="text" id="superID" readonly>
        </div>
    </form>
</body>
</html>
