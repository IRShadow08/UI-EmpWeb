
<!DOCTYPE html>
<html lang="en">
<head runat="server">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Employee Performance Monitoring</title>

  <!-- Font Awesome CSS -->
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
  <header></header>
  <div class="sidebar">
    <img src="assets/MMCL_Logo_Horizontal.webp" alt="MMCL Logo" class="logo-img">
    <div class="sidebar-btn">
      <input type="radio" id="my-account" name="menu" checked>
      <label for="my-account">
        <i class="fas fa-user fa-fw"></i> My account
      </label>
    </div>
    <div class="sidebar-btn">
      <input type="radio" id="my-agreement" name="menu">
      <label for="my-agreement">
        <i class="fas fa-file-contract fa-fw"></i> My agreement
      </label>
    </div>
    <div class="sidebar-btn">
      <input type="radio" id="my-evaluation" name="menu">
      <label for="my-evaluation">
        <i class="fas fa-file-signature fa-fw"></i> My evaluation
      </label>
    </div>
    <a href="#" id="sign-out">
      <i class="fas fa-sign-out-alt fa-fw"></i> Sign out
    </a>
  </div>
  <div class="main-content header-text">
    <h2>Welcome to Employee </h2>
    <h2>Performance Monitoring</h2>
  </div>
  <div class="popup" id="popup">
    <div class="popup-content">
      Popup Content
    </div>
  </div>
  <footer>
    <p>© 2024 Mapúa Malayan Colleges Laguna. All rights reserved.</p>
  </footer>
  <script>
      document.getElementById("sign-out").addEventListener("click", function () {
          var confirmation = confirm("Are you sure you want to log out?");
          if (confirmation) {
              alert("You have been logged out.");
          }
      });

      var currentPopup = null;
      var popupContent = null;

      function showPopup(buttonText) {
          var popup = document.getElementById("popup");

          // Create popup content only if it's not already created
          if (!popupContent) {
              popupContent = document.createElement("div");
              popupContent.classList.add("popup-content");
              popup.appendChild(popupContent);
          }

          switch (buttonText) {
              case "My account":
                  popupContent.innerHTML = `
            <div class="form-section self-account">
              <i class="fas fa-user-circle"></i>
              <h4>Employee Name</h4>
            </div>
            <div class="form-section">
              <label for="id">ID:</label>
              <input type="text" id="id" readonly>
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
          `;
                  break;
              case "My agreement":
                  popupContent.innerHTML = `
            <div class="tab-buttons">
              <button id="section-1-a" class="tab-button" onclick="showAgreementContent('section-1-a',)">Section 1-A</button>
              <button id="section-1-b" class="tab-button" onclick="showAgreementContent('section-1-b')">Section 1-B</button>
              <button id="section-2" class="tab-button" onclick="showAgreementContent('section-2')">Section 2</button>
              <button id="section-3" class="tab-button" onclick="showAgreementContent('section-3')">Section 3</button>
              <button id="section-3-comments" class="tab-button" onclick="showAgreementContent('section-3-comments')">Section 3-Comments</button>
              <button id="section-3-summary" class="tab-button" onclick="showAgreementContent('section-3-summary')">Section 3-Summary</button>
            </div>
            <div id="agreement-content">Please select an option above to view the content.</div>
            `;
                  break;
              case "My evaluation":
                  popupContent.innerHTML = `
            <div class="tab-buttons">
              <button id="section-1-a" class="tab-button" onclick="showAgreementContent('section-1-a')">Section 1-A</button>
              <button id="section-1-b" class="tab-button" onclick="showAgreementContent('section-1-b')">Section 1-B</button>
              <button id="section-2" class="tab-button" onclick="showAgreementContent('section-2')">Section 2</button>
              <button id="section-3" class="tab-button" onclick="showAgreementContent('section-3')">Section 3</button>
              <button id="section-3-comments" class="tab-button" onclick="showAgreementContent('section-3-comments')">Section 3-Comments</button>
              <button id="section-3-summary" class="tab-button" onclick="showAgreementContent('section-3-summary')">Section 3-Summary</button>
            </div>
            <div id="agreement-content">Please select an option above to view the content.</div>
              `;
                  break;
              default:
                  popupContent.innerHTML = "Default popup content.";
          }

          if (currentPopup) {
              currentPopup.classList.add("hide");
              currentPopup.addEventListener('transitionend', function () {
                  currentPopup.classList.remove("show");
                  currentPopup.classList.remove("hide");
                  currentPopup.querySelector(".popup-content").innerHTML = "";
                  currentPopup.querySelector(".popup-content").appendChild(popupContent);
                  popup.classList.add("show");
                  currentPopup = popup;
              }, { once: true });
          } else {
              popup.querySelector(".popup-content").innerHTML = "";
              popup.querySelector(".popup-content").appendChild(popupContent);
              popup.classList.add("show");
              currentPopup = popup;
          }
      }

      document.querySelectorAll('.sidebar label').forEach(function (button) {
          button.addEventListener("click", function () {
              if (this.getAttribute("for") !== "sign-out") {
                  var radioButton = document.getElementById(this.getAttribute("for"));

                  // Toggle the active class
                  if (this.classList.contains("active")) {
                      this.classList.remove("active");
                      radioButton.checked = false;
                      if (currentPopup) {
                          currentPopup.classList.add("hide");
                          currentPopup.addEventListener('transitionend', function () {
                              currentPopup.classList.remove("show");
                              currentPopup.classList.remove("hide");
                              currentPopup = null;
                          }, { once: true });
                      }
                  } else {
                      document.querySelectorAll('.sidebar label').forEach(function (btn) {
                          btn.classList.remove("active");
                      });
                      this.classList.add("active");
                      radioButton.checked = true;
                      var buttonText = this.textContent.trim();
                      showPopup(buttonText);
                  }
              }
          });
      });

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

      function showAgreementContent(type) {
          var agreementContent = document.getElementById("agreement-content");
          var contentToDisplay = '';

          switch (type) {
              case "section-1-a":
                  contentToDisplay = "A";
                  break;
              case "section-1-b":
                  contentToDisplay = `
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
          `;
                  break;
              case "section-2":
                  contentToDisplay = `
            <h3>SECTION 2: PROFICIENCY / BEHAVIORAL-BASED PERFORMANCE</h3>
            <div class="collapsible" data-target="Q1-s1" onclick="toggleContent('Q1-s1')"><h4>JOB KNOWLEDGE</h4></div>
            <div id="Q1-s1" class="content">            
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
              <p>
                1. Consistently not meeting Job requirements and needing substantially more supervision than should be required of 
                someone with similar job functions and responsibilities. Typically the employee with an IR rating has continued not to.
              </p>
              <p>
                2. Successfully achieving SOME aspects of the job requirements and expectations and requiring substantial supervision 
                for his/her experlence level and grade. Overall, performance level is below others with similar job functions and responsibilities.
              </p>
              <p>
                3. Making a solid contribution In key areas of responsibility with reasonable guidance and supervision. Performance level is at 
                par with others with similar job functions and responsibilities.
              </p>
              <p>4. Achieving results which exceeds the requirements and expectations of the job in all key areas of responsibility.</p>
              <p>5. Role modeling, very high achievement for his or her experience level and grade.</p>
            </div>

            <div class="collapsible" data-target="Q2-s1" onclick="toggleContent('Q2-s1')"><h4>JOB MANAGEMENT</h4></div>
            <div id="Q2-s1" class="content">          
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
              <p>1. Consistently performing one or more aspects of the job below expectations for his/her experience level and grade.</p>
              <p>2. Performing below expectations in one or more aspects of the job for his/her experience level and grade.</p>
              <p>3. Performing major aspects of the job well. May at times exceed the standard scope of the job's requirements/expectations.</p>
              <p>4. Performing all aspects of the job well and often exceeding the standard scope of job requirements/expectations.</p>
              <p>5. Consistently exceeding the standaro scope of all job requirements/expectations.</p>
            </div>

            <div class="collapsible" data-target="Q3-s1" onclick="toggleContent('Q3-s1')"><h4>WORK DELIVERY</h4></div>
            <div id="Q3-s1" class="content">       
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
              <p>1. Requiring repeated intervention or coaching by manager.</p>
              <p>2. Requiring substantial supervisory or managerial follow-up commensurate with the employee's experience level and ability to assume responsibility.</p>
              <p>3. Fulfilling assigned tasks within the required turn-around time.</p>
              <p>4. Working independently in a highly competent and reliable manner, requiring no supervision.</p>
              <p>5. Anticipating potential issues and problems that may arise and working independently in a highly competent and reliable.</p>
            </div>

            <div class="collapsible" data-target="Q4-s1" onclick="toggleContent('Q4-s1')"><h4>CREATIVITY</h4></div>
            <div id="Q4-s1" class="content">              
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
              <p>1. Consistently falling to apply appropriate problem solving techniques to issues or problems.</p>
              <p>2. Inconsistently applying appropriate problem solving/technical improvements to identified issue.</p>
              <p>3. Able to generate ideas that address existing needs or gaps.</p>
              <p>4. Ability to look beyond the present demands of the job in order to improve work plans, methods or results.</p>
              <p>5. Able to think out of the box and generate ideas to make existing process more efficient.</p>
            </div>

            <div class="collapsible" data-target="Q5-s1" onclick="toggleContent('Q5-s1')"><h4>COMMUNICATION WITH OTHERS</h4></div>
            <div id="Q5-s1" class="content">
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
              <p>
                1. Selecting the "right" words and usage for the context of the conversation (including moral, ethnic and religious differences). 
                Being clear and concise. Formulates thoughts to avoid rambling.
              </p>
              <p>2. Physically align with others, connecting with them in form and movement. Mindful of posture, facial expressions, and hand gestures.</p>
              <p>3. Is aware of various auditory cues, speaking to others in a manner more akin to their own ways (another form of "matching and mirroring").</p>
              <p>
                4. Is aware of the emotional state, learning to pause and release negative emotions before attempting to connect with others. Words 
                delivered with pride, anger or fear are rarely well received.
              </p>
              <p>
                5. Hold the highest intention for the other person's wellbeing. This requires a unique level of mindfulness generally cultivated through 
                compassion practices. When we are centered in a state of mastery, we're more likely to access this psychic dimension that holds great treasures 
                of Insights into others, helping us communicate with greater ease.
              </p>
            </div>

            <div class="collapsible" data-target="Q6-s1" onclick="toggleContent('Q6-s1')"><h4>INITIATIVE</h4></div>
            <div id="Q6-s1" class="content">
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
              <p>1. Inability or unwillingness to work as part of the team or group and not viewed as a role model.</p>
              <p>2. Difficulty working as part of the team or group and is not viewed as a role model.</p>
              <p>3. Comprehensively doing his work unpromted.</p>
              <p>4. Inspires and encourages co-employees to go the extra mile.</p>
              <p>
                5. Taking on supplementary responsibilities, and willingly participating in and contributing to highly successful 
                teams, typically becoming the formal or informal team leader.
              </p>
            </div>

            <div class="collapsible" data-target="Q7-s1" onclick="toggleContent('Q7-s1')"><h4>WORK DRIVE</h4></div>
            <div id="Q7-s1" class="content">
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
              <p>1. Consistently late in completing assigned tasks.</p>
              <p>2. Occasionally late in competing assigned tasks.</p>
              <p>3. Completes the assigned tasks within the agreed turn-around time.</p>
              <p>4. Tasks are occasionally completed ahead of greed turn- around time.</p>
              <p>5. Consistently completes the assigned tasks ahead of the agreed turn-around time.</p>
            </div>

            <div class="collapsible" data-target="Q8-s1" onclick="toggleContent('Q8-s1')"><h4>OBSERVANCE OF RULES AND REGULATIONS</h4></div>
            <div id="Q8-s1" class="content">
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
              <div>
                <p>1. Observes rules and regulations when an officer is around.</p>
                <p>2. Shows interest in organizational values, and use it to regulate personal behavior.</p>
                <p>3. Behaves broadly in line general organizational values.</p>
                <p>4. Ensures all action are taken in the Organization's best interests.</p>
                <p>5. Actively encourages adherence to codes of conduct and ethical principles inherent to "Excellence and Virtue".</p>
            </div>
          `;
                  break
              case "section-3":
                  contentToDisplay = `
            <h3>SECTION 3: DEMONSTRATION OF YGC CORE VALUES</h3>
            <div class="collapsible" data-target="Q1-s3" onclick="toggleContent('Q1-s3')"><h4>PASSION FOR EXCELLENCE</h4></div>
            <div id="Q1-s3" class="content">
              <h5>Striving to be great and not just good. Continuously improving for results.<h5>              
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
              <p>
                1. Does not meet deadlines and standards. Displays low level of effort towards work. Has no concern for quality
                of products and services and commits numerous mistakes when working.
              </p>
              <p>
                2. Works to meet performance standards but sometimes completes tasks beyond deadline of at an unacceptable level.
              </p>
              <p>
                3. Meets/ targets/objectives within set deadlines and at an acceptable level. Keep track of work progress and in cases of deviations,
                promptly takes corrective actions. Thinks of customer interest and business goals and find, if not makes a way to fulfill, or even exceed these.
              </p>
              <p>
                4. Works to exceed set targets and persists in achieving standard of excellence tht goes beyond expectations. Makes specific changes in
                work methods or operations to improve performance.
              </p>
              <p>
                5. Leads/motivates teammates in attaining of exceeding targets/objectives. Analyzes performance information to predict emerging issues
                and patterns. Takes calculated risks.
              </p>
            </div>

            <div class="collapsible" data-target="Q2-s1" onclick="toggleContent('Q2-s1')"><h4>SENSE OF URGENCY</h4></div>
            <div id="Q2-s1" class="content">
              <h5>Does things fast. Taking the initiative to respond to needs of various stakeholders.<h5>              
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
              <p>
                1. Works at his own pace. Requires prodding and constant reminders for tasks to be completed.
              </p>
              <p>
                2. Responds to internal/external customer requests/complaints but may require monitoring of work by superiors.
              <p>
                3. Responds/reacts immediately to customer requests/complaints without being reminded by superiors re:deliverables. Prioritizes
                activities purposively. Does not procrastinate on things that need to be done today.
              </p>
              <p>
                4. Acts independently to bring issues to closure. Performs tasks at a fast pace without sacrificing quality. With "fire in the belly"; energetic
                and enthusiastic in meeting work requirements.
              </p>
              <p>
                5. Motivates and enables teammates to bring issues to prompt closure. Anticipates hindrances and plans alternative courses of action by 
                encouraging and/or enabling others to support the plan.
              </p>
            </div>

            <div class="collapsible" data-target="Q3-s1" onclick="toggleContent('Q3-s1')"><h4>PROFESSIONAL DISCIPLINE</h4></div>
            <div id="Q3-s1" class="content">
              <h5>
                Strong work ethic. Deserving of trust and respect. Prudent use of company resources, including time. Acting
                with fairness and objectivity.
              <h5>              
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
              <p>
                1. Dishonest and/or wasteful. Authorities of others are frequently undermines. Makes decisions in a self-serving fashion.
              </p>
              <p>
                2. Provides questionable excuses/explanations when confronted. Has a problem with maintaining confidentiality. Often observed to
                prioritize personal convenience  over organizational/work requirements.
              <p>
                3. Trustworthy with information and use of resources. Uses good judgment in maintaning confidentiality. Refrains from gossip/rumor-mill.
                Keeps well within company policies.
              </p>
              <p>
                4. Trusted to hold highly confidential information and manage contentious resources. When confronted with issues, chooses ethical
                course in the face of pressure. Able to take unpopular stands when needed. Does what he/she says and says what he/she does.
              </p>
              <p>
                5. Proactively takes extraordinary steps to ensure personal and organizational integrity. Has an impeccable track record of ethical conduct.
                Takes responsibility for his decisions, irrespective of consequences. Prudent and judicious in handling information and managing
                organizational resourses under his care.
              </p>
            </div>

            <div class="collapsible" data-target="Q4-s1" onclick="toggleContent('Q4-s1')"><h4>TEAMWORK</h4></div>
            <div id="Q4-s1" class="content">
              <h5>Actively tapping areas of synergy Communicating and collaborating towards common goals.<h5>              
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
              <p>
                1. Withdrawn. Openly critical of other's suggestions. Does not freely cooperate with others.
              </p>
              <p>
                2. Communicates limitedly. Has tendency to prefer working alone rather than in a group setting. Cooperates w/ others but w/
                reservation.
              <p>
                3. Works well in a team environment. Open to, or seeks out, opportunities for synergy. Willingly takes on whatever team role he is called
                upon to play. Actively participates in group deliberations and supports group decisions even when this is not his original choice.
              </p>
              <p>
                4. Strengthen team spirit by encouraging everyone to contribute. Focuses on the strengths & not the weakness of others. Speaks highly
                of team members to promote a friendly climate and strong morale. Shows confidence in others; recognizes their ability to meet
                expectations and to contribute effectively to the team's duties.
              </p>
              <p>
                5. Acts as a catalyst in the team vibrancy. Freely shares his expertise with his teammates. Carries his own load while helping others with
                theirs, as needed. Is not bothered as to who gets the credit so long as things are done. Also respects & appreciates the similarities &
                differences among co-workers and demonstrates model behavior for working in diverse populations.
              </p>
            </div>

            <div class="collapsible" data-target="Q5-s1" onclick="toggleContent('Q5-s1')"><h4>LOYALTY</h4></div>
            <div id="Q5-s1" class="content">
              <h5>
                Being good corporate citizens. Pursuing corporate interests as his own. Speaking well of the company and
                taking pride in its achievements.
              <h5>              
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
              <p>
                1. Doesn't attempt to understand mission, direction, or goals of the organization. Or simply doesn't case where the organization is headed.
                Observed to be antagonistic toward the organization and/or its officers.
              </p>
              <p>
                2. Has basic understanding of organization goals and directions but requires guidance or regular reminders regarding personal
                alignment. When issues involving the company arise, takes a passive stance.
              <p>
                3. Understands organizational goals and directions and supports these. Defends corporate actions to others.
              </p>
              <p>
                4. Identifies with organization goals and direction. Willing to make personal sacrifices for the greater good.
              </p>
              <p>
                5. Rallies others towards supporting the organization, even when it is not personally convienient to do so. Willing to take tough stance in
                behalf of tbe organization.
              </p>
            </div>
          `;
                  break;
              case "section-3-comments":
                  contentToDisplay = `
            <h3>SECTION 3-COMMENTS</h3>
            <h4>STRENGTHS<h4>
            <textarea resize="vertical" row="4" col="50"placeholder="Enter comments/remarks"></textarea resize="vertical">
            <h4>AREAS OF IMPROVEMENT<h4>
            <textarea resize="vertical" row="4" col="50"placeholder="Enter comments/remarks"></textarea resize="vertical">
            <h4>DEVELOPMENT PLANS (PLEASE SPECIFY TARGET DATE/PERIOD)<h4>
            <textarea resize="vertical" row="4" col="50"placeholder="Enter comments/remarks"></textarea resize="vertical">
            <h4>EMPLOYEE'S COMMENT/ACKNOWLEDGEMENT<h4>
            <textarea resize="vertical" row="4" col="50" placeholder="To indicate that the employee was advised of the results of the evaluation and does not neccesarily mean the he is in agreement with the rating and/or remarks."></textarea resize="vertical">
            `;
                  break;
              case "section-3-summary":
                  contentToDisplay = `
            <h3>SECTION 3-SUMMARY</h3>
            <h4>OVERALL</h4>
            <div class="row">
              <p>Section 1</p>
              <input type="text" placeholder="0">x</input>
              <input type="text" placeholder="60" readonly>=</input>
              <input type="text" placeholder="0" readonly></input>
            </div>
            <div class="row">
              <p>Section 1</p>
              <input type="text" placeholder="0">x</input>
              <input type="text" placeholder="40" readonly>=</input>
              <input type="text" placeholder="0" readonly></input>
            </div>
            `;
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
