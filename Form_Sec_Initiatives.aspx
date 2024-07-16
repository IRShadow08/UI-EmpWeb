<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Sec_Initiatives.aspx.cs" Inherits="PerformanceEvaluation_With_UI_.Form_Sec_Initiatives" %>

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
        <h3>SECTION 1-A: INSTITUTIONAL OBJECTIVE</h3>

          <div id="initiativesContainer"></div> <!-- Container for the Initiatives -->
          <button class="add-init-btn" onclick="addKeyInitiative()">Add Key Initiative</button>

        <script>
            let keyInitiativeCount = 0;

            function addKeyInitiative() {
                keyInitiativeCount++;
                const container = document.getElementById('initiativesContainer');
                const initiativeId = `initiative_${keyInitiativeCount}`;

                const newTable = document.createElement('div');
                newTable.id = initiativeId;
                newTable.innerHTML = `
                    <h3>Key Initiative ${keyInitiativeCount}</h3>
                    <label for="initiative_name_${keyInitiativeCount}" >Initiative Name:</label>
                    <input type="text" id="initiative_name_${keyInitiativeCount}" name="initiative_name_${keyInitiativeCount}" placeholder="Enter initiative name" class="initiative-text">
                    <table>
                        <thead>
                            <tr>
                                <th rowspan="2">Specific Objectives</th>
                                <th colspan="3" class="center">Ratings</th>
                                <th rowspan="2" class="actions">Actions</th>
                            </tr>
                            <tr>
                                <th>W</th>
                                <th>R</th>
                                <th>WS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><textarea name="specific_objectives_${keyInitiativeCount}_1" placeholder="Enter Objective" maxlength="1000"></textarea></td>
                                <td><input type="text" name="w_${keyInitiativeCount}_1" class="center"></td>
                                <td><input type="text" name="r_${keyInitiativeCount}_1" class="center"></td>
                                <td><input type="text" name="ws_${keyInitiativeCount}_1" class="center" placeholder="0"></td>
                                <td class="actions"><button onclick="addSpecificObjective('${initiativeId}')" class="add-obj-btn">Add Objective</button></td>
                            </tr>
                        </tbody>
                    </table>
                `;
                container.appendChild(newTable);
            }

            function addSpecificObjective(initiativeId) {
                const initiativeDiv = document.getElementById(initiativeId);
                const table = initiativeDiv.querySelector('table tbody');
                const rowCount = table.rows.length;
                const keyInitiativeNumber = initiativeId.split('_')[1];

                const newRow = document.createElement('tr');
                newRow.innerHTML = `
                    <td><textarea name="specific_objectives_${keyInitiativeNumber}_${rowCount + 1}" placeholder="Enter Objective" maxlength="1000"></textarea></td>
                    <td><input type="text" name="w_${keyInitiativeNumber}_${rowCount + 1}" class="center"></td>
                    <td><input type="text" name="r_${keyInitiativeNumber}_${rowCount + 1}" class="center"></td>
                    <td><input type="text" name="ws_${keyInitiativeNumber}_${rowCount + 1}" class="center" placeholder="0"></td>
                    <td class="actions"><button onclick="removeRow(this)" class="remove-btn">Remove</button></td>
                `;
                table.appendChild(newRow);
            }

            function removeRow(button) {
                const row = button.parentElement.parentElement;
                row.remove();
            }

            let scopeProcessCount = 0;

            function addScopeProcess() {
                scopeProcessCount++;
                const container = document.getElementById('Governance-etc-container');
                const scopeProcessId = `scope_process_${scopeProcessCount}`;

                const newSection = document.createElement('div');
                newSection.id = scopeProcessId;
                newSection.innerHTML = `
                  <div class="collapsible" data-target="content_${scopeProcessCount}" onclick="toggleContent('content_${scopeProcessCount}')">
                      <h4>Scope/Process Reviewed/Audited ${scopeProcessCount}</h4>
                      <div class="input-group">
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
                  <div id="content_${scopeProcessCount}" class="content">
                      <textarea name="scope-process-audit" placeholder="Note/Critical Incidents"></textarea>
                  </div>
                `;
                container.appendChild(newSection);
            }
        </script>
    </form>
</body>
</html>