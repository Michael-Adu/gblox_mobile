import React, { useEffect, useState, useRef } from 'react';
import PropTypes from "prop-types"

import "./WorkspaceTab.scss"

const WorkspaceTab = (props) => {

    /*var [clickState, setClickState] = useState("Off");*/

    const container = useRef(null);

    useEffect(() => {
        let aText = container.current.querySelectorAll(".c-WorkspaceTab-a-Text")[0];
        let aShadow = container.current.querySelectorAll(".i-dropShadow")[0];

        if (props.clickState === "On") {
            container.current.style.maxWidth = "fit-content";
            container.current.style.opacity = "1";
            container.current.style.flexGrow = "1";
            container.current.style.flexShrink = "0";

            aText.style.maxWidth = "1000px"
            aShadow.style.backgroundImage = "linear-gradient(to right, #0000,#0B0533)"
        } else if (props.clickState === "Off") {
            container.current.style.maxWidth = "180px";
            container.current.style.opacity = "0.5";
            container.current.style.flexGrow = "0";
            container.current.style.flexShrink = "1";

            aText.style.maxWidth = "162px"
            aShadow.style.backgroundImage = "linear-gradient(to right, #0000,#0B0533CC)"
        }
    }, [props.clickState])

    function RunOnClick(e) {
        //Changing Transparency and Size
        if (props.ChangeTab !== undefined) {
            props.ChangeTab(e);
        }
    }

    function CloseOnClick(e) {
        if (props.closeOnClick !== undefined) {
            props.closeOnClick(e)
        }
        e.stopPropagation();
        //container.current.remove();
    }

    function drawCircle() {
        if (props.savedTab === false) {
            return (<svg id="saveCircle" xmlns="http://www.w3.org/2000/svg" width="11" height="11" viewBox="0 0 11 11">
                <circle id="Ellipse_51" data-name="Ellipse 51" cx="5.5" cy="5.5" r="5.5" fill="rgba(255,255,255,0.69)" />
            </svg>)
        }
        else {
            return (<div></div>)
        }
    }

    return (
        <div className="c-WorkspaceTab-a-Container" ref={container} onClick={RunOnClick} id={props.id}>
            <p className="c-WorkspaceTab-a-Text"> {props.text}
                <div className="i-dropShadow" />
            </p>
            <div className="i-dropShadow" />
            {drawCircle()}
            <div className="c-WorkspaceTab-a-Close" onClick={CloseOnClick}>
                X
            </div>
        </div >
    )
}


export default WorkspaceTab

WorkspaceTab.defaultProps = {
    text: "Hello World",
    clickState: "Off",
}

WorkspaceTab.propTypes = {
    text: PropTypes.string,
    clickState: PropTypes.string,

}


