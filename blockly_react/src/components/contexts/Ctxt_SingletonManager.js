import { createContext, useEffect, useState, useContext, useReducer } from "react";
import { DeviceList } from "../../deviceDef/device_list";
import Blockly, { selected } from "blockly";
import { Dropbox } from "dropbox";
import AlterBlockly from "../../blocklyextras/blocklyAlters";
import { mainLoopCode } from "../../customblocks/compiler/arduino_core";
import { MelloDOM } from "../../customblocks/toolboxes/toolboxes";
import { ThemeContext } from "./ThemeContext";
import Alert_Notification from '../Alert_Notification'
import SyntaxHighlighter from 'react-syntax-highlighter';
import { tomorrowNightBlue } from 'react-syntax-highlighter/dist/esm/styles/hljs';
import WorkspaceTab from "../WorkspaceTab";


export const Ctxt_SingletonManager = createContext()

//var selectedDevice = DeviceList[0];
var currentWorkspace;
var createdVariables = [];
var currentBlock = null;
var globalToolboxName = "Mello"
var workspaceXML = <xml></xml>;
const accessToken = "X7OnyGww3ykAAAAAAAAAAetsktgSj4_XAVPUd7P8GnKdDERWNty9u4ZquSBgPtsZ"
const fetch = window.fetch.bind(window);
var dbx = new Dropbox({
    accessToken,
    fetch
});

const CtxtP_SingletonManager = (props) => {

    const [currentDeviceName, setCurrentDeviceName] = useState("Mello");             //Used to set and check the current device selected
    const [toolboxItems, setToolboxItems] = useState([]);                       //Used to set and check the current items in the Toolbox
    const [deviceCode, setDeviceCode] = useState("");
    const [currentXML, setCurrentXML] = useState(" ");                          //Used to set and check the generated code for the current device
    const [loadedXML, setLoadedXML] = useState("")
    const [initialized_workspace, setInitializedWorkspace] = useState(false);   //Used to set and check whether the Blockly Workspace has been initialized
    var [selectedDevice, setSelectedDevice] = useState(DeviceList[2]);          //Used to set and check the selected device's data
    const [currentDeviceChanged, setCurrentDeviceChanged] = useState(0)
    const [upload_status, setUploadStatus] = useState("");
    const [selectedToolbox, setSelectedToolbox] = useState(MelloDOM)
    const [toolboxUpdate, setToolboxUpdate] = useState(0)
    const [toolboxLevel, setToolboxLevel] = useState(1)
    const [selectedToolboxName, setSelectedToolboxName] = useState("")
    const [currentTabPath, setCurrentTabPath] = useState("");
    const [currentFileName, setCurrentFileName] = useState("");
    const [tabSaveData, setTabSaveData] = useState("")
    const [savedOrLoaded, setSavedOrLoaded] = useState(0)
    const [serialport_monitor, setSerialPortMonitor] = useState("No Device Detected");
    const [serialport_status, setSerialPortStatus] = useState(false)
    const [blocklyVariables, setBlocklyVariables] = useState([])
    const [variablesLoadedCorrectly, setVariablesLoadedCorrectly] = useState(true)
    const [windowMax, setWindowMax] = useState(false);
    const [bodyLoaded, setBodyLoaded] = useState(false);
    const [splashScreen, setSplashScreen] = useState(<div></div>);
    const [alertDiv, setAlertDiv] = useState(<div></div>)
    const [available_com_ports, setAvailableCOMports] = useState([])
    const [activeCOMports, setActiveCOMports] = useState("No Arduino Detected")
    const [edited_code, setEditedCode] = useState(
`void setup(){

}
void loop(){
        
}`);
    const {
        dark_theme,
        light_theme
    } = useContext(ThemeContext)

    var fileheader = [
        //New File
        () => {
            if (document.getElementsByClassName("c-WorkspaceAdd-a-Container")[0] !== undefined) {
                currentWorkspace.clear();
                document.getElementsByClassName("c-WorkspaceAdd-a-Container")[0].click()
            }
            clearDropdowns()
        },
        //Open File
        () => {

            clearDropdowns()
        },
        //Save File
        () => {

            clearDropdowns()
        },
        //Save As File
        () => {

            clearDropdowns()
        },
        //Share
        () => {
            uploadToDropbox()
            clearDropdowns();
        },
        //Close
        () => {
            closeApp()
        }
    ]
    var editheader = [
        () => {
            try {
                Blockly.copy(currentBlock)
                Blockly.deleteBlock(currentBlock)
            }
            catch (e) { }
            clearDropdowns()
        },
        () => {
            try {
                Blockly.copy(currentBlock)
            }
            catch (e) { }
            clearDropdowns()
        },
        () => {
            try {
                Blockly.paste(currentBlock)
            }
            catch (e) { }
            clearDropdowns()
        },
        () => {
            try {
                Blockly.deleteBlock(currentBlock)
            }
            catch (e) { }
            clearDropdowns()
        }
    ]

    useEffect(() => {
        /*When Current Device is changed:
            -> Change the device in the Device List
        */
        //Checking List to see if Device exists:
        if (initialized_workspace === true) {
            //console.log(`Selected Device updated in Singleton. Name: ${selectedDevice.device_name}; CurrentName: ${currentDeviceName}`)
            var tmp = DeviceList.findIndex((ele) => (ele.device_name == currentDeviceName))
            if (tmp !== -1) {
                //Assign device to (g_v)selectedDevice
                setSelectedDevice(DeviceList[tmp]);
                if (DeviceList[tmp].toolbox[toolboxLevel - 1] !== undefined) {
                    setSelectedToolbox(DeviceList[tmp].toolbox[toolboxLevel - 1])
                } else {
                    setToolboxLevel(1)
                    document.getElementById("toolbox_selector_level_1").click()
                    setSelectedToolbox(DeviceList[tmp].toolbox[0])
                }

                setSelectedToolboxName(DeviceList[tmp].device_name);
                setCurrentDeviceChanged(1)
                setToolboxUpdate(1)
            } else {
                //setCurrentDeviceName((prevState) => prevState)
            }
        }

    }, [currentDeviceName])

    useEffect(() => {
        globalToolboxName = selectedToolboxName;
    }, [selectedToolboxName])

    useEffect(() => {
        if (toolboxUpdate === 1)
            if (initialized_workspace) {
                if (selectedDevice.toolbox[toolboxLevel - 1] !== undefined) {
                    setSelectedToolbox(selectedDevice.toolbox[toolboxLevel - 1])
                    currentWorkspace.updateToolbox(selectedDevice.toolbox[toolboxLevel - 1]);
                } else {
                    setToolboxLevel(1)
                    document.getElementById("toolbox_selector_level_1").click()
                    setSelectedToolbox(selectedDevice.toolbox[0])
                    currentWorkspace.updateToolbox(selectedDevice.toolbox[0]);
                }
                generateToolbox();
            }
        setToolboxUpdate(0)
    }, [toolboxUpdate])

    useEffect(() => {
        createdVariables = blocklyVariables;
    }, [blocklyVariables])
    useEffect(() => {
        if (loadedXML !== "") {
            console.log("variables changed")
            console.log(blocklyVariables)
            setVariablesLoadedCorrectly(false);
        }
    }, [loadedXML])

    useEffect(() => {
        /*Initializes Blockly injection */
        if (currentDeviceName !== "") {
            if (initialized_workspace === false) {
                var tb = selectedToolbox;
                currentWorkspace = Blockly.inject('blocklyDiv', {
                    toolbox: tb, renderer: "zelos", zoom:
                    {
                        wheel: true,
                        startScale: 1,
                        maxScale: 3,
                        minScale: 0.3,
                        scaleSpeed: 1.2,
                        pinch: true
                    }, grid:
                    {
                        snap: true
                    }, theme: dark_theme
                });
                generateToolbox();
                window.currentWorkspace = currentWorkspace;
                window.mainBlockly = Blockly;
                currentWorkspace.clear();
                currentWorkspace.toolbox_.setVisible(true);
                currentWorkspace.addChangeListener(showCode);
                currentWorkspace.addChangeListener(selectedBlock);
                currentWorkspace.registerButtonCallback("createvar", openVariableDialog)
                AlterBlockly();
                setInitializedWorkspace(true)
            }
        }
        //Disables pointer events for blockly if Modal settings is opened
        var dropdowns = document.getElementsByClassName("c-CustomDrop-a-Content")
        for (var i = 0; i < dropdowns.length; i++) {
            if (dropdowns[i].style.display !== "none") {
                if (dropdowns[i].parentElement.parentElement.parentElement.id !== "Toolbox") {
                    document.getElementById("blocklyDiv").style.pointerEvents = "none";
                }
            }
        }

    });
    function device_manager(event) {
        var popout = document.getElementById("c-device-manager")
        if (event.target.id === "device-add-button") {
            popout.style.display = "inline-flex"
            popout.style.opacity = "1"
            popout.style.backgroundColor = "#0B0533dd";
        }
        else {
            if (currentDeviceName !== event.target.id) {
                setCurrentDeviceName(event.target.id)
                currentWorkspace.clear()
                Blockly.Xml.clearWorkspaceAndLoadFromXml(Blockly.Xml.textToDom(DeviceList[DeviceList.findIndex(e => e.device_name == event.target.id)].default_workspace), currentWorkspace)
            }
            //setCurrentDeviceVar( event.target.id)
            popout.style.opacity = "0"
            popout.style.backgroundColor = "transparent";
            setTimeout(() => {
                popout.style.display = "none"
            }, 500)
        }
    }
    //Upload to DropBox and return share link
    async function uploadToDropbox() {
        console.log("In uploadToDropbox")
        if (loadedXML !== "") {
            if (Blockly.Xml.domToText(loadedXML) == Blockly.Xml.domToText(currentXML)) {
                dbx.filesDeleteV2({
                    path: '/' + currentFileName
                }).then(function (response) {
                    console.log("Deleted File")
                    console.log(response)
                    dbx.filesUpload({
                        path: '/' + currentFileName,
                        contents: tabSaveData,
                        autorename: true
                    }).then(function (response) {
                        console.log(response);
                        dbx.sharingCreateSharedLinkWithSettings({
                            path: response.result.path_lower
                        }).then(function (response) {
                            console.log(response);
                        }).catch(function (error) {
                            console.log(error);
                        });
                    });
                }).catch(function (error) {
                    console.log(error)
                    dbx.filesUpload({
                        path: '/' + currentFileName,
                        contents: tabSaveData
                    }).then(function (response) {
                        console.log(response);
                        dbx.sharingCreateSharedLinkWithSettings({
                            path: response.result.path_lower
                        }).then(function (response) {
                            console.log(response);
                        }).catch(function (error) {
                            console.log(error);
                        });
                    });
                })
            }
            else {
              
            }
        }
        else {
  

        }

    }
    //Exports Blocks

    //Loads Blocks


    //Generates toolbox list for the GUI
    function generateToolbox() {
        var toolbox_temp = [];
        for (var i = 0; i < (currentWorkspace.toolbox_.getToolboxItems()).length; i++) {
            var items = currentWorkspace.toolbox_.getToolboxItems();
            var id = items[i].id_
            var name = items[i].name_
            if (items[i].subcategoriesDiv_ === undefined) {
                toolbox_temp.push([name, id, "non-category"]);
            }
            else {
                var category = currentWorkspace.toolbox_.getToolboxItems()[i];
                category.setExpanded(true)
                var children_count = (category.getChildToolboxItems()).length
                toolbox_temp.push([name, id, "category", children_count]);
            }
        }
        console.log("toolbox:" + toolbox_temp);
        setToolboxItems(toolbox_temp)
    }

    function electronWindowControl(event) {
        var button = event.target.id.split("WindowButton")[0].toLowerCase();
        console.log(button)
        if (button === "close") {
            document.getElementById("c-Body-Notification").style.display = "block";
            setAlertDiv(
                <Alert_Notification
                    type="alert"
                    text="Close gBlox?"
                    acceptAlert={ev => {
                    }}
                    closeAlert={event => {
                        setAlertDiv(<div></div>);
                        document.getElementById("c-Body-Notification").style.display = "none";
                    }} />)
        }
        else {
        }

    }

    //Used to show the generated Blockly code.
    function showCode() {
        if (Blockly.Xml.domToText(Blockly.Xml.workspaceToDom(currentWorkspace)) == "<xml xmlns=\"https://developers.google.com/blockly/xml\"></xml>") {
            Blockly.Xml.domToWorkspace(Blockly.Xml.textToDom(selectedDevice.default_workspace), currentWorkspace)
        }
        var code = Blockly.JavaScript.workspaceToCode(currentWorkspace);
        setCurrentXML(Blockly.Xml.workspaceToDom(currentWorkspace))
        code = mainLoopCode;
        console.log("code: " + code);
        setDeviceCode(code);
    }

    //Used to get the currently selected block in the Blockly Workspace
    function selectedBlock(event) {
        if (event.type == Blockly.Events.SELECTED) {
            currentBlock = currentWorkspace.getBlockById(event.newElementId);
        }
    }

    function openVariableDialog() {
        document.getElementById("c-variableSelector").style.display = "block";
    }
    function closeVariableDialog(event) {
        document.getElementById("variable-name-input").value = ""
        if (event.target.id == "a-CloseButton") {
            document.getElementById("c-variableSelector").style.display = "none";
        }
        else {
            var newvariable_type = document.getElementById("variable-type-select").firstChild.value.toLowerCase();
            if (newvariable_type === "integer") {
                newvariable_type = "int"
            }
            else if (newvariable_type === "String") {
                newvariable_type = "string"
            }
            var newvariable_name = document.getElementById("variable-name-input").value
            setBlocklyVariables((blocklyVariables => [...blocklyVariables, [`${newvariable_type} ${newvariable_name}`, `${newvariable_name}`]]))
            document.getElementById("c-variableSelector").style.display = "none";

        }
    }
    //Used after dropdown functions to clear the dropdown off the screen
    function clearDropdowns() {
        var Boxes = document.getElementsByClassName("blue-dropdown-box")
        for (var i = 0; i < Boxes.length; i++) {
            Boxes[i].style.display = "none"
        }
    }

    function serialport_read() {
        //Starts the serial port monitor
        if (serialport_status === false) {
            //Checks if serial port is already opened. If it is not opened, then start reading the serial port
            
            //Set the Serial port status to ensure that the port does not attempt to open multiple times
            setSerialPortStatus(true);
        }
        else {
            console.log("CLOSING SERIAL PORT")
            //If Serial port is already opened, close the serial monitor and reset the values
            setSerialPortMonitor([]);
            console.log("Serial Port Closed")
            setSerialPortStatus(false);
        }
    }

    function serialport_write(val) {
    }

    //Used to close the app from React
    function closeApp() {
        document.getElementById("c-Body-Notification").style.display = "block";
        setAlertDiv(
            <Alert_Notification
                type="alert"
                text="Close gBlox?"
                acceptAlert={ev => {
                    setAlertDiv(<div></div>);
                    document.getElementById("c-Body-Notification").style.display = "none";
                }}
                closeAlert={event => {
                    setAlertDiv(<div></div>);
                    document.getElementById("c-Body-Notification").style.display = "none";
                }} />)
    }

    function openMingoBlox() {
    }

    return (
        <Ctxt_SingletonManager.Provider
            value={{
                currentDeviceName,
                setCurrentDeviceName,
                toolboxItems,
                setToolboxItems,
                deviceCode,
                setDeviceCode,
                currentWorkspace,
                selectedDevice,
                setSelectedDevice,
                initialized_workspace,
                setInitializedWorkspace,
                selectedToolbox,
                fileheader,
                editheader,
                currentDeviceChanged,
                setCurrentDeviceChanged,
                selectedToolbox,
                setSelectedToolbox,
                closeVariableDialog,
                createdVariables,
                upload_status,
                setUploadStatus,
                toolboxUpdate,
                setToolboxUpdate,
                toolboxLevel,
                setToolboxLevel,
                setSelectedToolboxName,
                currentTabPath,
                setCurrentTabPath,
                savedOrLoaded,
                setSavedOrLoaded,
                serialport_monitor,
                setSerialPortMonitor,
                serialport_read,
                serialport_status,
                setSerialPortStatus,
                serialport_write,
                currentXML,
                setCurrentXML,
                loadedXML,
                setLoadedXML,
                setBlocklyVariables,
                blocklyVariables,
                variablesLoadedCorrectly,
                setVariablesLoadedCorrectly,
                windowMax,
                electronWindowControl,
                bodyLoaded,
                setBodyLoaded,
                splashScreen,
                setSplashScreen,
                alertDiv,
                setAlertDiv,
                device_manager,
                available_com_ports, 
                setAvailableCOMports,
                activeCOMports, 
                setActiveCOMports,
                openMingoBlox,
                edited_code, 
                setEditedCode
            }}
        >
            {props.children}
        </Ctxt_SingletonManager.Provider>
    )
}

export default CtxtP_SingletonManager
export { globalToolboxName, createdVariables, workspaceXML }
