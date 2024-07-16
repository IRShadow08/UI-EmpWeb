<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Sec_CoreValues.aspx.cs" Inherits="PerformanceEvaluation_With_UI_.Form_Sec_CoreValues" %>

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
        <h3>SECTION 3: DEMONSTRATION OF YGC CORE VALUES</h3>

        <div class="collapsible" data-target="Q1-s3" onclick="toggleContent('Q1-s3')">
            <div class="colcont">
                <h4>PASSION FOR EXCELLENCE</h4>
                <div class="content-container">
                    <div>
                        <asp:TextBox AutoPostBack="true" type="input" class="weight" Text="0" OnTextChanged="txt_TextChanged" ID="weight1" runat="server" />
                        <label>Weight:</label>
                    </div>
                    <div>
                        <asp:TextBox AutoPostBack="true" type="input" class="rating" Text="0" OnTextChanged="txt_TextChanged" ID="rating1" runat="server" />
                        <label>Rating:</label>
                    </div>
                    <div>
                        <asp:TextBox AutoPostBack="true" type="input" class="score" Text="0" OnTextChanged="txt_TextChanged" ID="score1" runat="server" />
                        <label>Score:</label>
                    </div>
                </div>
            </div>
        </div>

        
            <div id="Q1-s3" class="content">
              <h5>Striving to be great and not just good. Continuously improving for results.</h5>              
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

        <div class="collapsible" data-target="Q2-s1" onclick="toggleContent('Q2-s1')">
            <div class="colcont">
                <h4>SENSE OF URGENCY</h4>
                <div class="content-container">
                    <div>
                        <asp:TextBox AutoPostBack="true" type="input" class="weight" Text="0" OnTextChanged="txt_TextChanged" ID="weight2" runat="server" />
                        <label>Weight:</label>
                    </div>
                    <div>
                        <asp:TextBox AutoPostBack="true" type="input" class="rating" Text="0" OnTextChanged="txt_TextChanged" ID="rating2" runat="server" />
                        <label>Rating:</label>
                    </div>
                    <div>
                        <asp:TextBox AutoPostBack="true" type="input" class="score" Text="0" OnTextChanged="txt_TextChanged" ID="score2" runat="server" />
                        <label>Score:</label>
                    </div>
                </div>
            </div>
        </div>
            <div id="Q2-s1" class="content">
              <h5>Does things fast. Taking the initiative to respond to needs of various stakeholders.</h5>              
                
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

        <div class="collapsible" data-target="Q3-s1" onclick="toggleContent('Q3-s1')">
            <div class="colcont">
                <h4>PROFESSIONAL DISCIPLINE</h4>
                <div class="content-container">
                    <div>
                        
                        <asp:TextBox AutoPostBack="true" type="input" class="weight" Text="0" OnTextChanged="txt_TextChanged" ID="weight3" runat="server" />
                        <label>Weight:</label>
                    </div>
                    <div>
                        
                        <asp:TextBox AutoPostBack="true" type="input" class="rating" Text="0" OnTextChanged="txt_TextChanged" ID="rating3" runat="server" />
                        <label>Rating:</label>
                    </div>
                    <div>
                        
                        <asp:TextBox AutoPostBack="true" type="input" class="score" Text="0" OnTextChanged="txt_TextChanged" ID="score3" runat="server" />
                        <label>Score:</label>
                    </div>
                </div>
            </div>
        </div>
            <div id="Q3-s1" class="content">
              <h5>
                Strong work ethic. Deserving of trust and respect. Prudent use of company resources, including time. Acting
                with fairness and objectivity.
              </h5>              
                
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

        <div class="collapsible" data-target="Q4-s1" onclick="toggleContent('Q4-s1')">
            <div class="colcont">
                <h4>TEAMWORK</h4>
                <div class="content-container">
                    <div>
                        
                        <asp:TextBox AutoPostBack="true" type="input" class="weight" Text="0" OnTextChanged="txt_TextChanged" ID="weight4" runat="server" />
                        <label>Weight:</label>
                    </div>
                    <div>
                        
                        <asp:TextBox AutoPostBack="true" type="input" class="rating" Text="0" OnTextChanged="txt_TextChanged" ID="rating4" runat="server" />
                        <label>Rating:</label>
                    </div>
                    <div>
                       
                        <asp:TextBox AutoPostBack="true" type="input" class="score" Text="0" OnTextChanged="txt_TextChanged" ID="score4" runat="server" />
                        <label>Score:</label>
                    </div>
                </div>
            </div>
        </div>
            <div id="Q4-s1" class="content">
              <h5>Actively tapping areas of synergy Communicating and collaborating towards common goals.</h5>              
                
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

        <div class="collapsible" data-target="Q5-s1" onclick="toggleContent('Q5-s1')">
            <div class="colcont">
                <h4>LOYALTY</h4>
                <div class="content-container">
                    <div>
                        
                        <asp:TextBox AutoPostBack="true" type="input" class="weight" Text="0" OnTextChanged="txt_TextChanged" ID="weight5" runat="server" />
                        <label>Weight:</label>
                    </div>
                    <div>
                        
                        <asp:TextBox AutoPostBack="true" type="input" class="rating" Text="0" OnTextChanged="txt_TextChanged" ID="rating5" runat="server" />
                        <label>Rating:</label>
                    </div>
                    <div>
                       
                        <asp:TextBox AutoPostBack="true" type="input" class="score" Text="0" OnTextChanged="txt_TextChanged" ID="score5" runat="server" />
                         <label>Score:</label>
                    </div>
                </div>
            </div>
        </div>
            <div id="Q5-s1" class="content">
              <h5>
                Being good corporate citizens. Pursuing corporate interests as his own. Speaking well of the company and
                taking pride in its achievements.
              </h5>              
               
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

