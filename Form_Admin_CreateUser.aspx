﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Admin_CreateUser.aspx.cs" Inherits="PerformanceEvaluation_With_UI_.Form_Admin_CreateUser" %>

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

  h2 {
    font-size: 80px;
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
    font-size: 32px;
    position: relative;
  }

  .sidebar i {
    font-size: 32px;
    margin-right: 10px;
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
  /*
  .sidebar input[type="radio"]:checked + label {
    background-color: #dd2323;
    border-top-left-radius: 50px;
    border-bottom-left-radius: 50px;
    margin-right: -20px;
    padding-right: 40px;
    color: white;
    box-shadow: inset 0px 4px 4px 0px rgba(0, 0, 0, 0.25); 
  }
  */

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
    top: 50%;
    right: -2100px;
    transform: translateY(-50%);
    background-color: #F8F8F8;
    color: black;
    width: 79.7%;
    height: 84.2%;
    transition: right 0.3s ease, opacity 0.3s ease;
    padding: 20px; 
    opacity: 0;
    z-index: 1000;
    box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.5);
  }
  /*.popup {
    position: fixed;
    top: 50%;
    right: -2100px;
    transform: translateY(-50%);
    background-color: rgb(222, 222, 222);
    color: white;
    width: 75%;
    height: 75%;
    transition: right 0.3s ease, opacity 0.3s ease;
    padding: 20px;
    border-radius: 50px 0px 0px 50px;
    opacity: 0;
    z-index: 999;
    box-shadow: 5px 5px 15px rgba(0, 0, 0, 0.5); 
  }*/

  .popup.show {
    right: 0;
    opacity: 1;
  }

  .popup.hide {
    right: -2100px;
    opacity: 0;
  }

  .popup-content {
    overflow-y: auto; /* Add a vertical scrollbar when needed */
    max-height: calc(100% - 40px); /* Adjust the max-height as needed */
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

  .buttons{
    border-style: none;
    font-size: 16px;
    background-color: #dd2323;
    color: white;
    width: 300px;
    padding: 12px 16px;
    margin-top: 20px;
    margin-bottom: 40px;
    border-radius: 50px;
  }

  .fa-fw {
    vertical-align: middle;
  }

  .section-buttons{
    display: flex;
    align-content: center;
    justify-content: center;
    gap: 30px;
    border-bottom: 2px solid rgba(0, 0, 0, 0.2);
  }

  #agreement-content {
    padding: 20px;
    background-color: #f8f8f8; 
    color: #333;
    border-radius: 10px; 
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
  }

  #agreement-content h3 {
    color: #dd2323; 
    font-size: 24px; 
    margin-bottom: 10px; 
  }

  #agreement-content h5 {
    color: #555; 
    margin-top: 15px; 
    margin-bottom: none;
  }

  #agreement-content label {
    font-size: 12px;
    flex: 0 0 230px;
    color: #373737;
    text-align: left;
    margin-right: 10px;
    font-size: 20px;
  }

  #agreement-content input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #f8f8f8; 
    border-radius: 5px; 
    box-sizing: border-box;
  }

  textarea {
    resize: none;
    width: 100%;
    height: 150px; 
    gap: 50px;
  }

  .row {
    display: flex;
    align-items: center;
    margin-bottom: 10px;
  }
  
  .row p{
    width: 100%;
    margin: 0 50px
  }
  
  .row input[type="text"] {
    margin: 0 50px; 
  }

  .tab-buttons {
    display: flex;
    border-bottom: 1px solid #ccc;
  }
  
  .tab-button {
    background-color: #f1f1f1;
    border: 1px solid #ccc;
    border-bottom: none;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }
  
  .tab-button:hover {
    background-color: #ddd;
  }
  
  .tab-button.active {
    background-color: #dd2323;
    color: white;
    border-bottom: 1px solid #fff;
  }
  
  #agreement-content {
    padding: 20px;
    border: 1px solid #ccc;
    border-top: none;
  }

  .collapsible {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    border: none;
    text-align: left;
    outline: none;
    font-size: 15px;
  }
  
  .active, .collapsible:hover {
    background-color: #ccc;
  }
  
  .content {
    padding: 0 18px;
    display: none;
    overflow: hidden;
    background-color: #f1f1f1;
  }
  
  .content-container {
    display: flex;
    flex-wrap: wrap;
  }
  
  .content-container > div {
    flex: 1;
    padding: 10px;
  }
  
  .content input {
    width: calc(100% - 20px); /* Set width of input fields */
    margin-bottom: 10px; /* Add some bottom margin for spacing */
  }
  
  .content label {
    display: block; /* Make labels block elements */
    margin-bottom: 5px; /* Add some bottom margin for spacing */
  }
  
</style>
</head>
<body>
    <form id="form1" runat="server">
               <div class="new-account-cont header-text">
            <i class="fas fa-address-card"></i>
            <h2>Create New Employee Account</h2>
          </div>
          <div class="form-section">
            <label for="employee-id">Employee ID:</label>
            <input type="text" id="employee-id"/>
          </div>
          <div class="form-section">
            <label for="employee-name">Employee Name:</label>
            <input type="text" id="employee-name"/>
          </div>
          <div class="form-section">
            <label for="employee-position">Employee Position:</label>
            <input type="text" id="employee-position"/>
          </div>
          <div class="form-section">
            <label for="employee-department">Employee Department:</label>
            <input type="text" id="employee-department"/>
          </div>
          <div class="form-section">
            <label for="employee-type">Employee Type:</label>
            <input type="text" id="employee-type"/>
          </div>
          <div class="form-section">
            <label for="employee-superID">Employee Supervisor ID:</label>
            <input type="text" id="employee-superID"/>
          </div>
          <div class="form-section">
            <button id="create-account-next">Next</button>
          </div>
    </form>
</body>
</html>