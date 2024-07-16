<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Sec_Proficiency.aspx.cs" Inherits="PerformanceEvaluation_With_UI_.Form_Sec_Proficiency" %>

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
    <form runat="server">
        <h3>SECTION 2: PROFICIENCY / BEHAVIORAL-BASED PERFORMANCE</h3>
        <div class="collapsible" data-target="Q1-s1" onclick="toggleContent('Q1-s1')">
            <div class="colcont">
                <h4>JOB KNOWLEDGE</h4>
                <div class="content-container">
                  <div>
                    <asp:Textbox AutoPostBack="true" type="input" class="weight" text="0" OnTextChanged="txt_TextChanged" id="weight1" runat="server"/>
                    <label>Weight:</label>          
                  </div>
                  <div>
                    <asp:Textbox AutoPostBack="true" type="input" class="rating" text="0" OnTextChanged="txt_TextChanged" id="rating1" runat="server"/>
                    <label>Rating:</label>
                  </div>
                  <div>
                      <asp:Textbox AutoPostBack="true" type="input" class="score" text="0" OnTextChanged="txt_TextChanged" id="score1" runat="server"/>
          
                    <label>Score:</label>
                  </div>
                </div>
            </div>
        </div>

<div id="Q1-s1" class="content">            
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

        <div class="collapsible" data-target="Q2-s1" onclick="toggleContent('Q2-s1')">
            <div class="colcont">
            <h4>JOB MANAGEMENT</h4>
            <div class="content-container">
              <div>
                <asp:Textbox AutoPostBack="true" type="input" class="weight" text="0" OnTextChanged="txt_TextChanged" id="weight2" runat="server"/>
                <label>Weight:</label>          
              </div>
              <div>
                <asp:Textbox AutoPostBack="true" type="input" class="rating" text="0" OnTextChanged="txt_TextChanged" id="rating2" runat="server"/>
                <label>Rating:</label>
              </div>
              <div>
                  <asp:Textbox AutoPostBack="true" type="input" class="score" text="0" OnTextChanged="txt_TextChanged" id="score2" runat="server"/>
                <label>Score:</label>
              </div>
            </div>
        </div>
        </div>
        <div id="Q2-s1" class="content">    
          <p>1. Consistently performing one or more aspects of the job below expectations for his/her experience level and grade.</p>
          <p>2. Performing below expectations in one or more aspects of the job for his/her experience level and grade.</p>
          <p>3. Performing major aspects of the job well. May at times exceed the standard scope of the job's requirements/expectations.</p>
          <p>4. Performing all aspects of the job well and often exceeding the standard scope of job requirements/expectations.</p>
          <p>5. Consistently exceeding the standaro scope of all job requirements/expectations.</p>
        </div>

<div class="collapsible" data-target="Q3-s1" onclick="toggleContent('Q3-s1')">
    <div class="colcont">
    <h4>WORK DELIVERY</h4>
    <div class="content-container">
      <div>
        <asp:Textbox AutoPostBack="true" type="input" class="weight" text="0" OnTextChanged="txt_TextChanged" id="weight3" runat="server"/>
        <label>Weight:</label>          
      </div>
      <div>
        <asp:Textbox AutoPostBack="true" type="input" class="rating" text="0" OnTextChanged="txt_TextChanged" id="rating3" runat="server"/>
        <label>Rating:</label>
      </div>
      <div>
          <asp:Textbox AutoPostBack="true" type="input" class="score" text="0" OnTextChanged="txt_TextChanged" id="score3" runat="server"/>
          
        <label>Score:</label>
      </div>
    </div>
</div>
</div>
<div id="Q3-s1" class="content">      
  <p>1. Requiring repeated intervention or coaching by manager.</p>
  <p>2. Requiring substantial supervisory or managerial follow-up commensurate with the employee's experience level and ability to assume responsibility.</p>
  <p>3. Fulfilling assigned tasks within the required turn-around time.</p>
  <p>4. Working independently in a highly competent and reliable manner, requiring no supervision.</p>
  <p>5. Anticipating potential issues and problems that may arise and working independently in a highly competent and reliable.</p>
</div>

<div class="collapsible" data-target="Q4-s1" onclick="toggleContent('Q4-s1')">
    <div class="colcont">
    <h4>CREATIVITY</h4>
    <div class="content-container">
      <div>
        <asp:Textbox AutoPostBack="true" type="input" class="weight" text="0" OnTextChanged="txt_TextChanged" id="weight4" runat="server"/>
        <label>Weight:</label>          
      </div>
      <div>
        <asp:Textbox AutoPostBack="true" type="input" class="rating" text="0" OnTextChanged="txt_TextChanged" id="rating4" runat="server"/>
        <label>Rating:</label>
      </div>
      <div>
          <asp:Textbox AutoPostBack="true" type="input" class="score" text="0" OnTextChanged="txt_TextChanged" id="score4" runat="server"/>
          
        <label>Score:</label>
      </div>
    </div>
</div>
</div>
<div id="Q4-s1" class="content">              
  <p>1. Consistently falling to apply appropriate problem solving techniques to issues or problems.</p>
  <p>2. Inconsistently applying appropriate problem solving/technical improvements to identified issue.</p>
  <p>3. Able to generate ideas that address existing needs or gaps.</p>
  <p>4. Ability to look beyond the present demands of the job in order to improve work plans, methods or results.</p>
  <p>5. Able to think out of the box and generate ideas to make existing process more efficient.</p>
</div>

<div class="collapsible" data-target="Q5-s1" onclick="toggleContent('Q5-s1')">
    <div class="colcont">
    <h4>COMMUNICATIONG WITH OTHERS</h4>
    <div class="content-container">
      <div>
        <asp:Textbox AutoPostBack="true" type="input" class="weight" text="0" OnTextChanged="txt_TextChanged" id="weight5" runat="server"/>
        <label>Weight:</label>          
      </div>
      <div>
        <asp:Textbox AutoPostBack="true" type="input" class="rating" text="0" OnTextChanged="txt_TextChanged" id="rating5" runat="server"/>
        <label>Rating:</label>
      </div>
      <div>
          <asp:Textbox AutoPostBack="true" type="input" class="score" text="0" OnTextChanged="txt_TextChanged" id="score5" runat="server"/>
          
        <label>Score:</label>
      </div>
    </div>
</div>
</div>
<div id="Q5-s1" class="content">
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

<div class="collapsible" data-target="Q6-s1" onclick="toggleContent('Q6-s1')">
    <div class="colcont">
    <h4>INITIATIVE</h4>
    <div class="content-container">
      <div>
        <asp:Textbox AutoPostBack="true" type="input" class="weight" text="0" OnTextChanged="txt_TextChanged" id="weight6" runat="server"/>
        <label>Weight:</label>          
      </div>
      <div>
        <asp:Textbox AutoPostBack="true" type="input" class="rating" text="0" OnTextChanged="txt_TextChanged" id="rating6" runat="server"/>
        <label>Rating:</label>
      </div>
      <div>
          <asp:Textbox AutoPostBack="true" type="input" class="score" text="0" OnTextChanged="txt_TextChanged" id="score6" runat="server"/>
          
        <label>Score:</label>
      </div>
    </div>
</div>
</div>
<div id="Q6-s1" class="content">
  <p>1. Inability or unwillingness to work as part of the team or group and not viewed as a role model.</p>
  <p>2. Difficulty working as part of the team or group and is not viewed as a role model.</p>
  <p>3. Comprehensively doing his work unpromted.</p>
  <p>4. Inspires and encourages co-employees to go the extra mile.</p>
  <p>
    5. Taking on supplementary responsibilities, and willingly participating in and contributing to highly successful 
    teams, typically becoming the formal or informal team leader.
  </p>
</div>

<div class="collapsible" data-target="Q7-s1" onclick="toggleContent('Q7-s1')">
    <div class="colcont">
    <h4>WORK DRIVE</h4>
    <div class="content-container">
      <div>
        <asp:Textbox AutoPostBack="true" type="input" class="weight" text="0" OnTextChanged="txt_TextChanged" id="weight7" runat="server"/>
        <label>Weight:</label>          
      </div>
      <div>
        <asp:Textbox AutoPostBack="true" type="input" class="rating" text="0" OnTextChanged="txt_TextChanged" id="rating7" runat="server"/>
        <label>Rating:</label>
      </div>
      <div>
          <asp:Textbox AutoPostBack="true" type="input" class="score" text="0" OnTextChanged="txt_TextChanged" id="score7" runat="server"/>
          
        <label>Score:</label>
      </div>
    </div>
</div>
</div>
<div id="Q7-s1" class="content">
  <p>1. Consistently late in completing assigned tasks.</p>
  <p>2. Occasionally late in competing assigned tasks.</p>
  <p>3. Completes the assigned tasks within the agreed turn-around time.</p>
  <p>4. Tasks are occasionally completed ahead of greed turn- around time.</p>
  <p>5. Consistently completes the assigned tasks ahead of the agreed turn-around time.</p>
</div>

<div class="collapsible" data-target="Q8-s1" onclick="toggleContent('Q8-s1')">
    <div class="colcont">
    <h4>OBSERVANCE OF RULES AND REGULATIONS</h4>
    <div class="content-container">
      <div>
        <asp:Textbox AutoPostBack="true" type="input" class="weight" text="0" OnTextChanged="txt_TextChanged" id="weight8" runat="server"/>
        <label>Weight:</label>          
      </div>
      <div>
        <asp:Textbox AutoPostBack="true" type="input" class="rating" text="0" OnTextChanged="txt_TextChanged" id="rating8" runat="server"/>
        <label>Rating:</label>
      </div>
      <div>
          <asp:Textbox AutoPostBack="true" type="input" class="score" text="0" OnTextChanged="txt_TextChanged" id="score8" runat="server"/>
          
        <label>Score:</label>
      </div>
    </div>
</div>
</div>
<div id="Q8-s1" class="content">
    <p>1. Observes rules and regulations when an officer is around.</p>
    <p>2. Shows interest in organizational values, and use it to regulate personal behavior.</p>
    <p>3. Behaves broadly in line general organizational values.</p>
    <p>4. Ensures all action are taken in the Organization's best interests.</p>
    <p>5. Actively encourages adherence to codes of conduct and ethical principles inherent to "Excellence and Virtue".</p>
</div>
        <div class="content-container">
            <div>
                <label>Total Weight:</label>
                <asp:Label AutoPostBack="true" type="input" class="weight" Text="0" ID="labelTotal1" runat="server" />
            </div>
            <div>
                <label>Total Score:</label>
                <asp:Label AutoPostBack="true" type="input" class="score" Text="0" ID="labelTotal2" runat="server" />
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
