import { BlocklyWorkspace } from 'react-blockly';
import Blockly from "blockly";
import React,{ Component, useState } from 'react';
import Button from '@material-ui/core/Button';
import "./customblocks/customblocks";
import './App.css';

const initialxml = `
`;

function App() {
  const [xml, setXml] = useState("");
  const [javascriptcode, setJavascriptCode] = useState("");

  const toolboxCategories = {
    kind: "categoryToolbox",
    contents: [
      {
        kind: "category",
        name: "Logic",
        colour: "#5C81A6",
        contents: [
          {
            kind: "block",
            type: "controls_if",
          },
          {
            kind: "block",
            type: "logic_compare",
          },
        ],
      },
      {
        kind: "category",
        name: "Math",
        colour: "#5CA65C",
        contents: [
          {
            kind: "block",
            type: "math_round",
          },
          {
            kind: "block",
            type: "math_number",
          },
        ],
      },
      {
        kind: "category",
        name: "Main Block",
        colour: "#5CA699",
        contents: [
          {
            kind: "block",
            type: "main_block",
          },
        ],
      },
      {
        kind: "category",
        name: "Digital",
        colour: "#5DB254",
        contents: [
          {
            kind: "block",
            type: "pin_setup"
          },
          {
            kind: "block",
            type: "digital_pin_write"
          },
          {
            kind: "block",
            type: "digital_read"
          },
        ],
      },
      {
        kind: "category",
        name: "Analog",
        colour: "#2DB254",
        contents: [
          {
            kind: "block",
            type: "pin_setup"
          },
          {
            kind: "block",
            type: "analog_write"
          },
          {
            kind: "block",
            type: "analog_read"
          },
        ],
      },
      {
        kind: "category",
        name: "Sensors",
        colour: "#4DB254",
        contents: [
          {
            kind: "block",
            type: "ultrasonic_sensor"
          },
          {
            kind: "block",
            type: "ultrasonic_sensor_setup"
          },
        ],
      },
      {
        kind: "category",
        name: "Actuators",
        colour: "#2CB254",
        contents: [
          {
            kind: "block",
            type: "servo_write"
          },
        ],
      },
    ],
  };

  function showCode(workspace) {
    const code = Blockly.JavaScript.workspaceToCode(workspace);
    setJavascriptCode(code);
  }

  function uploadCode(workspace) {
    var code = javascriptcode;
    console.log("Compiled Code");
    alert("Ready to upload to Arduino.");
    var url = "http://127.0.0.1:8080/";
    var method = "POST";
    var async = true;
    var request = new XMLHttpRequest();
  
    request.onreadystatechange = function() {
      if (request.readyState != 4) { 
          return; 
      }
      var status = parseInt(request.status); // HTTP response status, e.g., 200 for "200 OK"
          var errorInfo = null;
          switch (status) {
          case 200:
              break;
          case 0:
              errorInfo = "code 0\n\nCould not connect to server at " + url + ".  Is the local web server running?";
              break;
          case 400:
              errorInfo = "code 400\n\nBuild failed - probably due to invalid source code.  Make sure that there are no missing connections in the blocks.";
              break;
          case 500:
              errorInfo = "code 500\n\nUpload failed.  Is the Arduino connected to USB port?";
              break;
          case 501:
              errorInfo = "code 501\n\nUpload failed.  Is 'ino' installed and in your path?  This only works on Mac OS X and Linux at this time.";
              break;
          default:
              errorInfo = "code " + status + "\n\nUnknown error.";
              break;
          };
          
          //callback(status, errorInfo);
      };
  
      request.open(method, url, async);
      request.setRequestHeader("Content-Type", "text/plain;charset=UTF-8");
      request.send(code);	    
  
  }

    return (
          <div className="App">
            <Button className="buttonate" variant="contained" color="primary" onClick={uploadCode}>Upload Code</Button>
              <div className="App">
                <BlocklyWorkspace
                  className="fill-height"
                  wrapperClassName="fill-height"
                  initialxml={xml}
                  onXmlChange={setXml}
                  toolboxConfiguration = {toolboxCategories}
                  workspaceConfiguration={{
                    grid: {
                      spacing: 20,
                      length: 3,
                      colour: "#ccc",
                      snap: true,
                    },
                  }}
                  onWorkspaceChange={showCode}
                />
                <textarea
                  id="code"
                  className="texter"
                  value={javascriptcode}
                  readOnly
                ></textarea>
              </div>
        </div>

      );
}
export default App;