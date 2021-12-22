import { useRef, useState, useEffect, useContext } from 'react'
import Blockly from 'blockly'
import Menu from '../Menu'
import Button from '../Button'
import Alert_Notification from '../Alert_Notification'
import { Ctxt_SingletonManager } from '../contexts/Ctxt_SingletonManager'
import PropTypes from 'prop-types'
import "./Example_Code_Menu.scss"

function Index(props) {
    const { children } = props;
    const {
        selectedDevice, 
        setAlertDiv,
        currentXML
    } = useContext(Ctxt_SingletonManager);
    function addDevices(example_object) {
        var devices = [];
        console.log(example_object.length)
        for (var i = 0; i < example_object.length; i++) {
            devices.push([
                <div className="device">
                    {example_object[i]}
                </div>
            ])

        }
        return devices;
    }

    function loadXML(event) {
        const example_object = props.example_codes;
        var i = parseInt(event.target.id.replace("code-open-", ""));
        console.log(selectedDevice.default_workspace)
        console.log(Blockly.Xml.domToText(currentXML))
        if (Blockly.Xml.domToText(Blockly.Xml.workspaceToDom(Blockly.mainWorkspace))!==selectedDevice.default_workspace){
            document.getElementById("c-Body-Notification").style.display = "block";
            setAlertDiv(<Alert_Notification
                type="alert"
                text="Opening this example will clear your workspace. Open anyways?"
                acceptAlert={ev => {
                    setAlertDiv(<div></div>);
                    document.getElementById("c-Body-Notification").style.display = "none";
                    try {
                        Blockly.Xml.clearWorkspaceAndLoadFromXml(Blockly.Xml.textToDom(example_object[i].xml), Blockly.mainWorkspace);
                    }
                    catch (e) { }
                }}
                closeAlert={event => {
                    setAlertDiv(<div></div>);
                    document.getElementById("c-Body-Notification").style.display = "none";
                }} 
                />)
        }
        else{
            try {
                Blockly.Xml.clearWorkspaceAndLoadFromXml(Blockly.Xml.textToDom(example_object[i].xml), Blockly.mainWorkspace);
            }
            catch (e) { }
        }

    }

    function addExample() {
        const example_object = props.example_codes;
        console.log(example_object[0].header)

        var returnedExamples = [];
        for (var i = 0; i < example_object.length; i++) {
            console.log(example_object[i].header);
            returnedExamples.push(
                [<div className="code-example">
                    <div className="code-example-header">{example_object[i].header}</div>
                    <div className="example-details">
                        <div >Difficulty: Level {example_object[i].level}</div>
                        <div className="blocks_used">Blocks used:</div>
                        <div>{example_object[i].blocks}</div>
                        {example_object[i].description}
                    </div>
                    <div className="example-buttons">
                        <div className="example-devices">
                            {addDevices(example_object[i].devices)}
                        </div>
                        <Button
                            id={`code-open-${i}`}
                            type="ExampleButton"
                            outColor="#0000DC"
                            text="Open Code"
                            onClick={loadXML}
                        />
                    </div>
                </div>])
        }
        return returnedExamples;
    }

    return (
        <Menu>
            <div id="example-code-menu">
                <div id="example-header-text">Example Codes</div>
                <div id="example-filter-button">
                    <Button
                        type="FilterButton"
                        outColor="#0000bc"
                        hoverColor="#0000aa"
                        hoverEffect="fill"
                    />
                </div>
                <div id="examples">
                    {addExample()}
                </div>

            </div>
        </Menu>

    )
}

export default Index
