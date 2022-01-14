import React, { useState, useEffect, useRef, useContext } from 'react'
import { Ctxt_SingletonManager } from '../contexts/Ctxt_SingletonManager';
import { ThemeContext } from '../contexts/ThemeContext';
import PropTypes from 'prop-types';

import "./Body.scss";
import svg_dictionary from '../svg_dictionary';
import ProgressBar from '../ProgressBar';
import Upload_Circle from '../Upload_Circle'
import Toolbox from '../Toolbox/Toolbox';
import Button from '../Button';
import Header from '../Header/Header'
import ToolSelector from '../ToolSelector/ToolSelector';
import Pull_Out_Menu from '../Pull_Out_Menu'
import CustomDrop from '../CustomDrop';
import WorkTabHolder from '../WorkTabHolder';
import Alert_Notification from '../Alert_Notification'
import NewDeviceManager from '../NewDeviceManager';
import Code_Editor from '../Code_Editor'
import VariableSelector from '../VariableSelector'



const Toolbox_colors = {
    Logic: "#4C97FF",
    Loop: "#DD0A18",
    Math: "#8D00E8",
    Text: "#16CE9C",
    Actuators: "#FE8013",
    Sensors: "#40BF4A",
    COM: "#D51CD5",
    Light: "#EFCA0F",
    Sound: "#FA857B",
    Variables: "#878787",
    Digital: "#1F5D00",
    Analog: "#FF00BB",
    Default: "#000000"
}

const Body = (props) => {
    var [PullOutState, setPullOutState] = useState("Closed")
    var TrashHolder = useRef(null);
    var FlyOutHolder = useRef(null)
    const [device_svg, setDeviceSVG] = useState(svg_dictionary.devices.Arduino_Uno_SVG)
    const [progress_value, setProgressValue] = useState(0)
    const [inUpload, setInUpload] = useState(false);
    const [toolboxButtons, setToolboxButtons] = useState([]);
    const [uploadInProgressStatus, setUploadInProgressStatus] = useState()

    const {
        selectedDevice,
        upload_status,
        setUploadStatus,
        toolboxItems,
        bodyLoaded,
        setBodyLoaded,
        splashScreen,
        setSplashScreen,
        alertDiv,
        setAlertDiv
    } = useContext(Ctxt_SingletonManager)

    function updateProgress(value) {
        var cur = progress_value;
        var interv = setInterval(() => {
            if (cur < value) {
                setProgressValue((p) => p + 1);
                cur++;
            }
            else {
                clearInterval(interv)
            }
        }, 50)
    }

    function uploadCode() {
        console.log(inUpload)
        if (inUpload == true) {

        }
        else {
            setInUpload(true);
            setProgressValue(0);
            document.getElementById("uploadInProgressStatus").style.opacity = "1";
            setUploadInProgressStatus("Upload already in Progress. Please Wait")
            document.getElementById("c-Body-Notification").style.display = "block";
            setAlertDiv(
                <Alert_Notification
                    type="selectCOMPORT"
                    text="Select your COM Port"
                    closeAlert={e => {
                        setAlertDiv(<div></div>);
                        document.getElementById("c-Body-Notification").style.display = "none";
                        props.uploadFunction();
                    }} />
            )
        }
    }
    var TrashContainerChanged = false;
    var FlyoutContainerChanged = false;

    useEffect(() => {
        //variables to hold various properties
        var buttons = [];   //holds button DOMS before setting them to the toolboxButtons
        var children = [];  //holds children of categories. Is reset when category is finished
        var category = "";  //Holds the name of the category
        var category_svg = [];  //Holds the category svg
        var category_color = "";    //Holds the color of the category
        var children_count = 0; //Counts the children inside the category. Once there is one child left, it resets itself and clears the category svg, color, and name
        for (var i = 0; i < toolboxItems.length; i++) { //Go through each item in toolboxItems
            var svg = [];   //Current svg holder for toolbox Item
            var color = ""; //Current color holder for toolbox Item
            switch (toolboxItems[i][0]) {   //Sets the appropriate svg and color to the above variables
                case "Loops":
                    svg = svg_dictionary.toolbox.Loop
                    color = Toolbox_colors.Loop;
                    break;
                case "Logic":
                    svg = svg_dictionary.toolbox.Logic;
                    color = Toolbox_colors.Logic;
                    break;
                case "Math":
                    svg = svg_dictionary.toolbox.Math;
                    color = Toolbox_colors.Math;
                    break;
                case "Text":
                    svg = svg_dictionary.toolbox.Text;
                    color = Toolbox_colors.Text;
                    break;
                case "Actuators":
                    svg = svg_dictionary.toolbox.Actuators;
                    color = Toolbox_colors.Actuators;
                    break;
                case "Sensors":
                    svg = svg_dictionary.toolbox.Sensors;
                    color = Toolbox_colors.Sensors;
                    break;
                case "COM":
                    svg = svg_dictionary.toolbox.COM;
                    color = Toolbox_colors.COM;
                    break;
                case "LEDs":
                    svg = svg_dictionary.toolbox.LEDs;
                    color = Toolbox_colors.Light;
                    break;
                case "Sound":
                    svg = svg_dictionary.toolbox.Sound;
                    color = Toolbox_colors.Sound;
                    break;
                case "Digital":
                    svg = svg_dictionary.toolbox.Default;
                    color = Toolbox_colors.Digital;
                    break;
                case "Analog":
                    svg = svg_dictionary.toolbox.Default;
                    color = Toolbox_colors.Analog;
                    break;
                case "Variables":
                    svg = svg_dictionary.toolbox.Variables;
                    color = Toolbox_colors.Variables;
                    break;
                default:
                    svg = svg_dictionary.toolbox.Default;
                    color = Toolbox_colors.Default;
                    break;
            }
            if (toolboxItems[i][2] == "category") { //Checks to see if the toolbox item is a category
                children_count = toolboxItems[i][3];    //Checks the number of children in the category and sets them to children_count
                category = toolboxItems[i][0]   //Sets the current category name to category
                category_svg = svg; //Sets the current category svg to category
                category_color = color; //Sets the current category color to category
            }
            else {  //if the toolbox item is not a category
                children_count -= 1;    //reduce children_count by 1
                if (children_count < 0) {   //Checks to see if children_count is less than zero. That means that the category is finished or was not present
                    children_count = 0; //sets children_count to 0
                    //Level 0 Buttons
                    buttons.push(
                        <Button
                            id={toolboxItems[i][1]}
                            type="ToolboxCategoryButton"
                            outColor={color}
                            hoverColor="#0000dc"
                            s_ButtonState="Out"
                            children={[svg]}
                            text={toolboxItems[i][0]}
                            toolbox_type={toolboxItems[i][2]}
                            child_count={children_count}
                            hoverEffect="fill"
                            onClick={props.ToolboxFunction}
                        />
                    )
                }
                else {
                    children.push(
                        <Button
                            id={toolboxItems[i][1]}
                            type="ToolboxCategoryButton"
                            outColor={category_color}
                            hoverColor="#0000dc"
                            s_ButtonState="Out"
                            children={[category_svg]}
                            text={toolboxItems[i][0]}
                            toolbox_type={toolboxItems[i][2]}
                            child_count={children_count}
                            hoverEffect="fill"
                            onClick={props.ToolboxFunction}
                        />
                    )
                    if (children_count === 0) {
                        buttons.push(
                            <CustomDrop
                                buttonType="ToolboxCategoryButton"
                                text={category}
                                childrenlist={children}
                                outColor={category_color}
                                dropType="toolbox_list"
                                svg={[category_svg]}
                                modal=""
                            />
                        )
                        children = []
                        category = ""
                        category_svg = [];
                    }
                }
            }
        }
        setToolboxButtons(buttons)
    }, [toolboxItems])

    // useEffect(() => {
    //     if (TrashContainerChanged === false) {
    //         var Trash = document.getElementsByClassName("blocklyTrash")[0];
    //         if (Trash !== undefined) {
    //             TrashHolder.current.appendChild(Trash);
    //             TrashContainerChanged = true;
    //         }
    //     }
    // })
    useEffect(() => {
        if (progress_value > 100) {
            setProgressValue(100);
        }
    }, [progress_value])

    useEffect(() => {
        console.log(upload_status)
        switch (upload_status) {
            case "Verifying Code":
                updateProgress(50);
                break;
            case "Uploading Code":
                updateProgress(70);
                break;
            case "Upload Successful":
                updateProgress(100);
                setInUpload(false);
                setUploadInProgressStatus()
                document.getElementById("uploadInProgressStatus").style.opacity = "0";
                break;
            case "Upload Failed : Error in Code":
                setProgressValue(0);
                setInUpload(false);
                setUploadStatus("");
                setUploadInProgressStatus();
                document.getElementById("uploadInProgressStatus").style.opacity = "0";
                break;
            case "Upload Failed":
                setProgressValue(0);
                setInUpload(false);
                setUploadStatus("");
                setUploadInProgressStatus();
                document.getElementById("uploadInProgressStatus").style.opacity = "0";
                break;
            case "No Arduino Detected":
                setProgressValue(0);
                setInUpload(false);
                document.getElementById("c-Body-Notification").style.display = "block";
                setAlertDiv(
                    <Alert_Notification
                        type="notification"
                        text="No device has been detected. Make sure that a device is connected"
                        closeAlert={e => {
                            setAlertDiv(<div></div>);
                            document.getElementById("c-Body-Notification").style.display = "none";
                        }} />
                )
                setUploadStatus("")
                setUploadInProgressStatus()
                document.getElementById("uploadInProgressStatus").style.opacity = "0";
                break;
            case "Arduino found on ":
                setProgressValue(0);
                setInUpload(false);
                document.getElementById("c-Body-Notification").style.display = "block";
                setAlertDiv(
                    <Alert_Notification type="notification" text="No device has been detected. Make sure that an Arduino is connected" closeAlert={e => { setAlertDiv(<div></div>); document.getElementById("c-Body-Notification").style.display = "none"; }} />
                )
                setUploadInProgressStatus()
                document.getElementById("uploadInProgressStatus").style.opacity = "0";
                break;
            default:
                setProgressValue(0);
                setInUpload(false);
                break;
        }
    }, [upload_status])
    useEffect(() => {
        try{
            var blocklyTrash = document.getElementsByClassName("blocklyTrash")[0]
            var newTrash = document.getElementById("TrashTotal");
            blocklyTrash.replaceChildren(newTrash);
        }
        catch(e){}
        setBodyLoaded(true);
    }, [])
    return (
        <div id="body-container">
            <div className="c-Body-a-WorkspaceContainer">
                <div id="blocklyDiv">
                </div>
            </div>

            <div className="c-Body-a-Overlay">
                <div className="workspace-controls">
                    <Button
                        id="zoom-to-fit"
                        type="WorkspaceControlButton"
                        outColor="#E9E9FF"
                        hoverColor="#0000FF"
                        children={svg_dictionary.workspace_controls.zoom_fit}
                        hoverEffect="svg-fill"
                        onClick={props.workspaceClick}
                    />
                    <Button
                        id="workspace-previous"
                        type="WorkspaceControlButton_Previous"
                        inColor="#E9E9FF"
                        outColor="#E9E9FF"
                        hoverColor="#0000FF"
                        s_ButtonState="Out"
                        hoverEffect="svg-fill"
                        onClick={props.workspaceClick}
                    />
                    <Button
                        id="workspace-after"
                        type="WorkspaceControlButton_After"
                        inColor="#060841"
                        outColor="#E9E9FF"
                        hoverColor="#0000FF"
                        s_ButtonState="Out"
                        hoverEffect="svg-fill"
                        onClick={props.workspaceClick}
                    />
                </div>
                <div id="TrashTotal">
                    <div id="num15HoverHolder">

                        <svg id="lid" xmlns="http://www.w3.org/2000/svg" width="45.049" height="9.565" viewBox="0 0 45.049 9.565">
                            <path id="Path_81" data-name="Path 81" d="M1849.7,938.283h-10.84v-1.969l-1.052-1.052h-8.6L1827.943,934H1821.9v4.283h-10.4l-3.059,2.141v2.141h44.049v-2.141Z" transform="translate(-1807.942 -933.5)" stroke="rgba(0,0,0,0)" stroke-width="1" />
                        </svg>
                        <svg id="bin" xmlns="http://www.w3.org/2000/svg" width="36.944" height="36.37" viewBox="0 0 36.944 36.37">
                            <path id="Path_82" data-name="Path 82" d="M1812.688,946.74V957.9l2.371,2.371V977.33l4.78,4.78h25.428V967.541l3.365-3.364V946.74Zm10.129,32.425-2.175-1.919V951.023h2.175Zm5.8-1.919-2.175,1.919V951.023h2.175Zm5.8,1.919-2.175-1.919V951.023h2.175Zm5.8-1.919-2.175,1.919V951.023h2.175Z" transform="translate(-1812.188 -946.24)" stroke="rgba(0,0,0,0)" stroke-width="1" />
                        </svg>


                    </div>
                    <svg id="num15trash" ref={TrashHolder}>
                    </svg>
                </div>
            </div>
            <div className="c-Body-a-OverlayExtras" />
            <div id="c-device-manager">
                <div id="closeDeviceBackground" onClick={(e) => {
                    document.getElementById("c-device-manager").style.display = 'none'
                    e.stopPropagation();
                }}>
                </div>
                <NewDeviceManager deviceOnClick={props.deviceOnClick} />
            </div>
            <div id="c-Body-Notification">
                {alertDiv}
            </div>
            <div id="c-variableSelector">
                <VariableSelector />
            </div>
        </div >
    )

}

export default Body