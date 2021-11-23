
function updateCode() {
     var code = Blockly.Xml.workspaceToCode(Blockly.mainWorkspace);
     document.getElementById('total_code').innerHTML = code;
     alert("Updated Code")
}