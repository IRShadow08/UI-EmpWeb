<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Sup_ValidationList_Eval.aspx.cs" Inherits="PerformanceEvaluation_With_UI_.Form_Sup_ValidationList_Eval" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Agreements</title>
    <style>
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
    
    .left-section {
        float: left;
        width: 50%;
        flex: 1;
        display: flex;
        flex-direction: column;
        justify-content: space-between; 
    }

    .right-section {
        float: right;
        width: 50%;
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
        <div id="containerSection" runat="server"></div>
<%--        <asp:Button ID="backBtnAgree" runat="server" Text="Back" OnClick="BackBtnAgree_Click" />
        <asp:Button ID="nextBtnAgree" runat="server" Text="Next" OnClick="NextBtnAgree_Click" />--%>
     </form>
</body>
</html>
