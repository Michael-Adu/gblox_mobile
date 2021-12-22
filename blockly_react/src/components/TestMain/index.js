import React, { useState, useEffect, useContext } from 'react';
import PropTypes from 'prop-types'
import Body from '../Body'
import Blockly from 'blockly';
import { DeviceList } from '../../deviceDef/device_list';
import FrameBar from '../FrameBar'
import LoadScreen from '../LoadScreen'
import SplashScreenV2 from '../SplashScreenV2'
import { Ctxt_SingletonManager } from '../contexts/Ctxt_SingletonManager';
import { ThemeContext } from '../contexts/ThemeContext';


import "./TestMain.scss"
import "../../customblocks/customblocks";
import "../../customblocks/compiler/arduino_core";
import "../../customblocks/peripherals/arduino_peripheral"
import "../../customblocks/MelloBlocks"
import "../../customblocks/MelloBlocksGen"
import "../../customblocks/MingoBlocks"
import "../../customblocks/MingoBlocksGen"

import example_codes from "../../example_codes"

var response = "null";

const TestMain = (props) => {

    const { selectedDevice,
        setSelectedDevice,
        currentWorkspace,
        currentBlock,
        currentDeviceName,
        setCurrentDeviceName,
        toolboxItems,
        setSelectedToolboxName,
        deviceCode,
        exportBlocks,
        upload_status,
        setUploadStatus,
        bodyLoaded,
        setBodyLoaded,
        splashScreen,
        setSplashScreen,
        openMingoBlox,
        device_manager,
        available_com_ports, 
        setAvailableCOMports} = useContext(Ctxt_SingletonManager)
    const { currentThemeName, setCurrentThemeName } = useContext(ThemeContext)

    
    const [system_settings, setSystemSettings] = useState(["device: Mello;"]);
    const [current_theme, setCurrentTheme] = useState("")
    const [splash_status, setSplashStatus] = useState("false");


    async function uploadCode_ipc() {
        var port = document.getElementById("selected-comport").value
        if (document.getElementById("c-codeEditor").style.display !== "flex") {
            //Invokes upload-code from electron with the current code

        }
        else {
            var code = document.getElementById("full-editing").value

        }


    }
    function closeSplash() {
        var splash = document.getElementById('c-Body-a-SplashScreen')
        splash.style.backgroundColor = "transparent";
        splash.style.backdropFilter = "none"
        splash.style.opacity = "0"
        setSplashStatus((document.getElementById('SplashStatus').checked).toString())
        setTimeout(() => {
            splash.style.display = "none"
        }, 600)
    }
    function workspaceClick(event) {
        if (document.getElementById('blocklyDiv') !== null) {
            switch (event.target.id) {
                case "zoom-in":
                    Blockly.mainWorkspace.zoom(0, 0, 2);
                    break;
                case "zoom-out":
                    Blockly.mainWorkspace.zoom(0, 0, -2)
                    break;
                case "zoom-to-fit":
                    Blockly.mainWorkspace.zoomToFit()
                    break;
                case "workspace-previous":
                    Blockly.mainWorkspace.undo(false);
                    if (Blockly.Xml.domToText(Blockly.Xml.workspaceToDom(currentWorkspace)) === `<xml xmlns="https://developers.google.com/blockly/xml"></xml>`) {
                        Blockly.Xml.clearWorkspaceAndLoadFromXml(Blockly.Xml.textToDom(selectedDevice.default_workspace), currentWorkspace);
                    }
                    break;
                case "workspace-after":
                    Blockly.mainWorkspace.undo(true);
                    break;
                default:
                    break;
            }
        }
    }
    function open_flyout(event) {
        document.getElementById(event.target.id).click()
    }
    function openRobocentre() {

    }
    function contactSupportViaMail() {

    }
    function removeVideo() {
  }

    useEffect(() => {

        if (available_com_ports.length > 0) {
        }
        else {
            
        }
    }, [available_com_ports])
    // useEffect(() => {
    //     if (system_settings[1] !== undefined) {
    //         try {
    //             var temp_settings = `theme: ${currentThemeName.toString()}\nhideSplash: ${splash_status.toString()}\ndevice: ${currentDeviceName.toString()}`
    //             setSystemSettings(temp_settings)

    //         }
    //         catch (e) { }
    //     }
    // }, [currentThemeName, currentDeviceName, splash_status])
    // useEffect(() => {
    //     for (var i = 0; i < system_settings.length; i++) {
    //         if (system_settings[i] !== undefined) {
    //             var property = system_settings[i].toString().split(":")[0]
    //             switch (property) {
    //                 case "hideSplash":
    //                     setSplashStatus(system_settings[i].toString().replaceAll(";\r", "").replace("hideSplash: ", ""))
    //                     break;
    //                 case "theme":
    //                     setCurrentThemeName(system_settings[i].toString().replaceAll(";\r", "").replace("theme: ", ""));
    //                     break;
    //                 case "device":
    //                     var devName = system_settings[i].toString().replaceAll(";\r", "").replace("device: ", "")
    //                     var tmp = DeviceList.findIndex((ele) => ele.device_name == devName)
    //                     if (tmp != -1) {
    //                         setCurrentDeviceName(devName)
    //                         setSelectedDevice(DeviceList[tmp])
    //                         setSelectedToolboxName(devName)
    //                     }
    //                     break;
    //             }
    //         }
    //     }
    //     //.replaceAll(";\r","").replace("splash: ","")
    //     //document.getElementById("SplashStatus").checked
    // }, [system_settings])
    useEffect(() => {

    }, [bodyLoaded])
    useEffect(() => {
        if (document.getElementById("SplashStatus") !== null) {
            if (splash_status == "true") {
                document.getElementById("SplashStatus").checked = true;
            }
            else {
                document.getElementById("SplashStatus").checked = false;
                document.getElementById('c-Body-a-SplashScreen').style.display = "inline-flex";
            }
        }
    }, [splashScreen])

    return (
        <div id="App">
            <Body
                ToolboxFunction={open_flyout}
                workspaceClick={workspaceClick}
                toolboxButtons={toolboxItems}
                viewCode={deviceCode}
                example_codes={example_codes}
                uploadFunction={uploadCode_ipc}
                onSplashClick={closeSplash}
                robocentreURL={openRobocentre}
                deviceOnClick={device_manager}
                saveFile={exportBlocks}
                contactSupportViaMail={contactSupportViaMail}
            />
        </div>
    )
}

export default TestMain

TestMain.defaultProps = {

}