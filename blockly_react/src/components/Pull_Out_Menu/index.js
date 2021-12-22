import React, { useRef, useState, useEffect, useContext } from 'react'
import PropTypes from 'prop-types'
import "./Pull_Out_Menu.scss"
import { Ctxt_SingletonManager } from '../contexts/Ctxt_SingletonManager'
import svg_dictionary from "../svg_dictionary"
import Button from '../Button'
import Help_Menu from '../Help_Menu'
import Serial_Menu from '../Serial_Menu'
import View_Code_Menu from '../View_Code_Menu'
import Edit_Code_Menu from '../Edit_Code_Menu'
import Example_Code_Menu from '../Example_Code_Menu'

function Pull_Out_Menu(props) {
    const [contents, setContents] = useState([<div></div>]);
    const { setSerialPortMonitor, serialport_read, serialport_status, setSerialPortStatus } = useContext(Ctxt_SingletonManager)
    const [currentMenu, setCurrentMenu] = useState("")
    var [menuOpen, setMenuOpen] = useState("Open");
    var pull_out_menu = useRef(null);
    var pull_out_container = useRef(null);





    function closeSerial() {
        if (serialport_status === true) {
            setSerialPortStatus(false)
            serialport_read()
        }
    }

    function Menu(event) {
        var button_clicked = event.target.id;
        setMenuOpen("Open")

        if (button_clicked !== "") {
            switch (button_clicked) {
                case "example-code":
                    if (currentMenu !== button_clicked) {
                        setContents([
                            <Example_Code_Menu example_codes={props.example_codes}>
                            </Example_Code_Menu>
                        ])
                        setCurrentMenu(button_clicked)
                    }
                    break;
            }
        }
        
        if (currentMenu !== button_clicked) {
            setCurrentMenu(button_clicked);
            highlightSelectedMenu(button_clicked, true);
            
            setMenuOpen("Closed")
            pull_out_menu.current.style.marginLeft = "-410px"
            pull_out_container.current.style.opacity = "1"
        }
        else {
            setCurrentMenu("None");
            highlightSelectedMenu(button_clicked, false)
            pull_out_menu.current.style.marginLeft = "0px"
            pull_out_container.current.style.opacity = "0"
        }

    }

    function highlightSelectedMenu(buttonID, fill){
        if (fill==true){
            var buttons = document.getElementsByClassName("c-button-a-CircularOverlayMenuButton")
            for (var i=0; i<buttons.length; i++){
                buttons[i].style.backgroundColor = "var(--primary-color)"
            }
            document.getElementById(buttonID).parentElement.firstChild.style.backgroundColor="var(--border-color)"
        }
        else{
            var buttons = document.getElementsByClassName("c-button-a-CircularOverlayMenuButton")
            for (var i=0; i<buttons.length; i++){
                buttons[i].style.backgroundColor = "var(--primary-color)"
            }

        }
    }
    // useEffect(() => {
    //     var Overlay = document.getElementsByClassName("c-Body-a-Overlay")[0];
    //     var OverlayExtras = document.getElementsByClassName("c-Body-a-OverlayExtras")[0];
    //     var TabHolder = document.getElementById("c-WorkTabHolder-B-Container");

    //     if (menuOpen === "Closed") {
    //         if (!Overlay.classList.contains("t-Transition")) {
    //             Overlay.classList.add("t-Transition")
    //         }
    //         if (!OverlayExtras.classList.contains("t-Transition")) {
    //             OverlayExtras.classList.add("t-Transition")
    //         }
    //         if (!TabHolder.classList.contains("t-Transition")) {
    //             TabHolder.classList.add("t-Transition")
    //         }
    //         Overlay.style.width = "calc(100vw - 420px)"
    //         OverlayExtras.style.width = "420px"
    //         TabHolder.style.width = "calc(100vw - 706px)"
    //         setTimeout(function () {
    //             if (Overlay.classList.contains("t-Transition")) {
    //                 Overlay.classList.remove("t-Transition")
    //             }
    //             if (OverlayExtras.classList.contains("t-Transition")) {
    //                 OverlayExtras.classList.remove("t-Transition")
    //             }
    //             if (TabHolder.classList.contains("t-Transition")) {
    //                 TabHolder.classList.remove("t-Transition")
    //             }
    //         }, 500);

    //     } else {
    //         if (!Overlay.classList.contains("t-Transition")) {
    //             Overlay.classList.add("t-Transition")
    //         }
    //         if (!OverlayExtras.classList.contains("t-Transition")) {
    //             OverlayExtras.classList.add("t-Transition")
    //         }
    //         if (!TabHolder.classList.contains("t-Transition")) {
    //             TabHolder.classList.add("t-Transition")
    //         }
    //         Overlay.style.width = "100vw"
    //         OverlayExtras.style.width = "0px"
    //         TabHolder.style.width = "calc(100vw - 286px)"
    //         setTimeout(function () {
    //             if (Overlay.classList.contains("t-Transition")) {
    //                 Overlay.classList.remove("t-Transition")
    //             }
    //             if (OverlayExtras.classList.contains("t-Transition")) {
    //                 OverlayExtras.classList.remove("t-Transition")
    //             }
    //             if (TabHolder.classList.contains("t-Transition")) {
    //                 TabHolder.classList.remove("t-Transition")
    //             }
    //         }, 500);
    //     }
    // }, [menuOpen])



    return (
        <div className="pull-out-menu" ref={pull_out_menu}>
            <div className="c-Pull-Out-Menu-a-buttongroup" >

                <Button
                    id="example-code"
                    type="CircularOverlayMenuButton"
                    outColor="#060841"
                    hoverColor="#0000FF"
                    s_ButtonState="Out"
                    children={svg_dictionary.menu_buttons.exampleCode}
                    onClick={Menu}
                    hoverEffect="fill-tooltip"
                    tooltip={["Sample Codes","Alt+X"]}
                />

            </div>
            <div className="pull-out-container" ref={pull_out_container} >
                <div className="container-background">
                    {contents}
                </div>
            </div>
        </div>

    )
}

export default Pull_Out_Menu
