import React, { useRef } from 'react'
import PropTypes from 'prop-types'
import { useState, useEffect } from 'react'

import "./Button.scss"

const Button = (props) => {
    var buttonType;
    var buttonTyper = useRef(null);

    var size = [];

    var [buttonColor, setButtonColor] = useState("#0000dc");
    var [borderColor, setBorderColor] = useState("#0000dc")
    var [hoverState, setHoverState] = useState(false);
    var [svgColor, setSVGColor] = useState("#0000dc");

    useEffect(() => {
        if (props.s_ButtonState === "In") {
            setButtonColor(props.inColor);
            setSVGColor(props.inColor);
        } else if (props.s_ButtonState === "Out") {
            setButtonColor(props.outColor);
            setSVGColor(props.outColor);
        }
    }, [props.s_ButtonState])


    useEffect(() => {

        switch (props.hoverEffect) {
            case "fill":
                if (hoverState) {
                    setButtonColor(props.hoverColor);
                } else if (!hoverState) {
                    if (props.s_ButtonState === "Out") {
                        setButtonColor(props.outColor)
                    } else if (props.s_ButtonState === "In") {
                        setButtonColor(props.inColor)
                    }
                }
                break;
            case "fill-tooltip":
                var tooltip = document.getElementById(`tooltip-${props.id}`)
                if (hoverState) {
                    tooltip.style.opacity = "1"
                } else if (!hoverState) {
                    tooltip.style.opacity = "0"
                    if (props.s_ButtonState === "Out") {
                        setButtonColor(props.outColor)
                    } else if (props.s_ButtonState === "In") {
                        setButtonColor(props.inColor)
                    }
                }
                break;
            case "border":
                if (hoverState) {
                    setBorderColor(props.hoverColor);
                    buttonTyper.current.style.margin = "2px"
                    buttonTyper.current.style.borderWidth = "4px"
                } else if (!hoverState) {
                    setBorderColor(props.borderColor)
                    buttonTyper.current.style.margin = "4px";
                    buttonTyper.current.style.borderWidth = "2px"
                }
                break;
            case "svg-fill":
                if (hoverState) {
                    setSVGColor(props.hoverColor)
                } else if (!hoverState) {
                    if (props.s_ButtonState === "Out") {
                        setSVGColor(props.outColor)
                    } else if (props.s_ButtonState === "In") {
                        setSVGColor(props.inColor)
                    }
                }
                break;
            case "":
                if (hoverState) {

                } else if (!hoverState) {

                }
                break;
        }
    }, [hoverState])

    function hoverIn() {
        setHoverState(true)
    }

    function hoverOut() {
        setHoverState(false)
    }

    const emptybutton = <button type="button" id={props.id} className="empty-button" onClick={props.onClick} onMouseEnter={hoverIn} onMouseLeave={hoverOut} />

    switch (props.type) {
        case "SettingsColor":
            buttonType = (
                <div>
                    <div className="modal-lighting-buttons" ref={buttonTyper} style={{
                        backgroundColor: buttonColor,
                        borderColor: borderColor
                    }} />
                    {emptybutton}
                </div>
            )
            break;
        case "SettingsButton":
            buttonType = (
                <div>
                    <div className="modal-lighting-buttons" style={
                        {
                            backgroundColor: buttonColor,
                            width: '330px',
                            height: '43px',
                            display: 'flex',
                            alignItems: 'center',
                            justifyContent: 'center',
                            borderColor: "#FFF0"
                        }
                    }>
                        <p className="button-text"> {props.text}</p>
                    </div>
                    {emptybutton}
                </div>
            )
            break;
        case "SettingsXButton":
            buttonType = (
                <div>
                    <div id="settings-close-button">
                        <h1>X</h1>
                    </div>
                    {emptybutton}
                </div>
            )
            break;
        case "LanguageMenuButton":
            buttonType = (
                <div>
                    <div className="c-Button-a-LanguageMenuButton" style={{
                        backgroundColor: buttonColor
                    }}>
                        <div className="i-FlagBox">{props.children}</div>
                        <p className="i-Text">{props.text}</p>
                    </div>
                    {emptybutton}
                </div>
            )
            break;
        case "LanguageContentButton":
            buttonType = (
                <div>
                    <div className="c-Button-a-LanguageContentButton" style={{
                        backgroundColor: buttonColor
                    }}>
                        <div className="i-FlagBox">{props.children}</div>
                        <p className="i-Text">{props.text}</p>
                    </div>
                    {emptybutton}
                </div>
            )
            break;
        case "SettingsHeaderButton":
            buttonType = (
                <div>
                    <div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="130" height="40" viewBox="0 0 130 40">
                            <g id="Group_533" data-name="Group 533" transform="translate(-226.5)">
                                <path id="Path_33" data-name="Path 33" d="M306.954,42H411.045c5.06,5.1,7.9,7.961,12.955,13.063V82H294V55.063Z" transform="translate(-67.5 -42)" fill={buttonColor} />
                                <g id="Group_31" data-name="Group 31" transform="translate(243.901 8.595)">
                                    <text id="Settings" transform="translate(31.826 18)" fill="#fff" font-size="17" font-family="Baloo2-Regular, 'Baloo \32 '"><tspan x="0" y="0">Settings</tspan></text>
                                    <path id="Path_302" data-name="Path 302" d="M928,500.214v-4.427h-2.214a8.033,8.033,0,0,0-.716-1.724l1.567-1.567-3.131-3.131-1.567,1.567a8.015,8.015,0,0,0-1.724-.716V488h-4.427v2.214a8.014,8.014,0,0,0-1.724.716l-1.567-1.567-3.131,3.131,1.567,1.567a8.009,8.009,0,0,0-.716,1.724H908v4.427h2.215a8,8,0,0,0,.716,1.724l-1.567,1.567,3.131,3.131,1.567-1.567a8.005,8.005,0,0,0,1.724.716V508h4.427v-2.214a8.006,8.006,0,0,0,1.724-.716l1.567,1.567,3.131-3.131-1.567-1.567a8.029,8.029,0,0,0,.716-1.724ZM920.5,498a2.5,2.5,0,0,1-3.979,2.015,2.524,2.524,0,0,1-.536-.536,2.5,2.5,0,0,1,0-2.959,2.523,2.523,0,0,1,.536-.536,2.5,2.5,0,0,1,2.959,0,2.52,2.52,0,0,1,.536.536A2.495,2.495,0,0,1,920.5,498Z" transform="translate(-908.837 -486)" fill="none" stroke="#fff" stroke-miterlimit="10" stroke-width="2" />
                                </g>
                            </g>
                        </svg>
                    </div>
                    {emptybutton}
                </div>
            )
            break;
        case "WorkspaceTabButton":
            buttonType = (
                <div id={props.id} className="empty-button" onClick={props.onClick} onMouseEnter={hoverIn} onMouseLeave={hoverOut}>
                    <div className="c-button-a-WorkspaceTabButton" style={{
                        backgroundColor: buttonColor
                    }}>
                        <p className="workspace-button-text"> {props.text}</p>
                        <div className="workspace-close-button" onClick={props.closeOnClick}>
                            X
                        </div>
                    </div>
                </div>

            )
            break;
        case "CircularOverlayMenuButton":
            buttonType = (
                <div>
                    <div className="c-button-a-CircularOverlayMenuButton">
                        <div className="button-svg">{props.children}</div>
                    </div>
                    <span id={`tooltip-${props.id}`} className="tooltiptext">{props.tooltip[0]}<div className="shortcutText2">{props.tooltip[1]}</div></span>

                    {emptybutton}
                </div>
            )
            break;
        case "WorkspaceControlButton":
            buttonType = (
                <div>
                    <div className="c-button-a-WorkspaceControlButton" ref={buttonTyper} style={{
                        fill: `${svgColor}`
                    }}>
                        <div className="workspace-control-bordersvg">
                            <svg xmlns="http://www.w3.org/2000/svg" width="61.098" height="61.454" viewBox="0 0 61.098 61.454">
                                <defs>
                                    <filter id="Path_83" x="0" y="0" width="61.098" height="60.507" filterUnits="userSpaceOnUse">
                                        <feOffset input="SourceAlpha" />
                                        <feGaussianBlur stdDeviation="3" result="blur" />
                                        <feFlood flood-color="#0000dc" />
                                        <feComposite operator="in" in2="blur" />
                                        <feComposite in="SourceGraphic" />
                                    </filter>
                                    <filter id="Path_84" x="23.492" y="29.754" width="35.676" height="31.7" filterUnits="userSpaceOnUse">
                                        <feOffset input="SourceAlpha" />
                                        <feGaussianBlur stdDeviation="3" result="blur-2" />
                                        <feFlood flood-color="#0000dc" />
                                        <feComposite operator="in" in2="blur-2" />
                                        <feComposite in="SourceGraphic" />
                                    </filter>
                                </defs>
                                <g transform="matrix(1, 0, 0, 1, 0, 0)" filter="url(#Path_83)">
                                    <path id="Path_83-2" data-name="Path 83" d="M383.6,936.475a21.615,21.615,0,0,0-5.405.685l.146.569a20.633,20.633,0,0,0-4.129,1.551l-.264-.526a21.58,21.58,0,0,0-10.7,26.369l.561-.195A20.956,20.956,0,0,0,383.6,978.982v-3.2a17.755,17.755,0,0,1-17.393-14.174,17.9,17.9,0,0,1-.361-3.581h-1.392a19.048,19.048,0,0,1,5.46-13.4l1,.978A17.616,17.616,0,0,1,383.6,940.27a17.944,17.944,0,0,1,3.324.311l.257-1.361a18.956,18.956,0,0,1,4.462,1.437l-.582,1.254a17.733,17.733,0,0,1,4.254,2.774l.911-1.036a19.138,19.138,0,0,1,4.763,22.4l2.18,1.008A21.558,21.558,0,0,0,383.6,936.475Z" transform="translate(-353.05 -927.48)" />
                                </g>
                                <g transform="matrix(1, 0, 0, 1, 0, 0)" filter="url(#Path_84)">
                                    <path id="Path_84-2" data-name="Path 84" d="M399.461,965.979a17.965,17.965,0,0,1-14.112,9.719l.426,3.981A21.958,21.958,0,0,0,403.025,967.8ZM387.5,978.224a1.093,1.093,0,1,1,1.093-1.093A1.093,1.093,0,0,1,387.5,978.224Zm12.864-8.84a1.093,1.093,0,1,1,1.092-1.093A1.093,1.093,0,0,1,400.367,969.384Z" transform="translate(-352.86 -927.23)" />
                                </g>
                            </svg>


                        </div>
                        <div className="button-children-svg"> {props.children} </div>

                    </div>
                    {emptybutton}

                </div>
            )
            break;
        case "WorkspaceControlButton_Previous":
            buttonType = (
                <div>

                    <div className="c-button-WorkspaceControlButton_Previous-After" ref={buttonTyper} style={{
                        fill: `${svgColor}`
                    }}>
                        <div className="workspace-control-bordersvg">
                            <svg xmlns="http://www.w3.org/2000/svg" width="66.398" height="60.152" viewBox="0 0 66.398 60.152">
                                <defs>
                                    <filter id="Path_145" x="0" y="0" width="66.398" height="60.152" filterUnits="userSpaceOnUse">
                                        <feOffset input="SourceAlpha" />
                                        <feGaussianBlur stdDeviation="3" result="blur" />
                                        <feFlood flood-color="#0000dc" />
                                        <feComposite operator="in" in2="blur" />
                                        <feComposite in="SourceGraphic" />
                                    </filter>
                                </defs>
                                <g transform="matrix(1, 0, 0, 1, 0, 0)" filter="url(#Path_145)">
                                    <path id="Path_145-2" data-name="Path 145" d="M582.747,939.01l-.257.52A20.542,20.542,0,0,0,578.4,938l.142-.57a21.392,21.392,0,0,0-25.62,13.911q-.227.666-.406,1.348l-.453-1.021-2.662-6.018,1.067-2.754-4.312,1.15,4.97,11.221,1.039,2.346,1.836-.835,10.192-4.6,1.187-3.061-8.217,3.747-1.972-.76c.047-.141.081-.29.131-.43a19.136,19.136,0,0,1,5.342-7.806l.905,1.026a17.3,17.3,0,0,1,4.217-2.75L565.2,940.9a18.671,18.671,0,0,1,4.423-1.425l.256,1.354A17.574,17.574,0,0,1,585.76,945.8l.99-.968a18.875,18.875,0,0,1,5.413,13.283h-1.382a17.6,17.6,0,0,1-17.6,17.608V978.9A20.8,20.8,0,0,0,592.8,964.965l.556.193a21.384,21.384,0,0,0-10.613-26.148Z" transform="translate(-537.15 -927.75)" />
                                </g>
                            </svg>


                        </div>
                    </div>
                    {emptybutton}
                </div>
            )
            break;
        case "WorkspaceControlButton_After":
            buttonType = (
                <div>
                    <div className="c-button-WorkspaceControlButton_Previous-After" ref={buttonTyper} style={{
                        fill: `${svgColor}`
                    }}>
                        <div className="workspace-control-bordersvg">
                            <svg xmlns="http://www.w3.org/2000/svg" width="66.398" height="60.152" viewBox="0 0 66.398 60.152">
                                <defs>
                                    <filter id="Path_146" x="0" y="0" width="66.398" height="60.152" filterUnits="userSpaceOnUse">
                                        <feOffset input="SourceAlpha" />
                                        <feGaussianBlur stdDeviation="3" result="blur" />
                                        <feFlood flood-color="#0000dc" />
                                        <feComposite operator="in" in2="blur" />
                                        <feComposite in="SourceGraphic" />
                                    </filter>
                                </defs>
                                <g transform="matrix(1, 0, 0, 1, 0, 0)" filter="url(#Path_146)">
                                    <path id="Path_146-2" data-name="Path 146" d="M557.953,939.01l.257.52A20.542,20.542,0,0,1,562.3,938l-.142-.57a21.392,21.392,0,0,1,25.62,13.911q.227.666.406,1.348l.453-1.021,2.662-6.018-1.067-2.754,4.312,1.15-4.97,11.221-1.039,2.346-1.836-.835-10.192-4.6-1.187-3.061,8.217,3.747,1.972-.76c-.047-.141-.081-.29-.131-.43a19.136,19.136,0,0,0-5.342-7.806l-.905,1.026a17.3,17.3,0,0,0-4.217-2.75l.577-1.246a18.671,18.671,0,0,0-4.423-1.425l-.256,1.354A17.574,17.574,0,0,0,554.94,945.8l-.99-.968a18.875,18.875,0,0,0-5.413,13.283h1.382a17.6,17.6,0,0,0,17.6,17.608V978.9A20.8,20.8,0,0,1,547.9,964.965l-.556.193a21.384,21.384,0,0,1,10.613-26.148Z" transform="translate(-537.15 -927.75)" />
                                </g>
                            </svg>



                        </div>
                    </div>
                    {emptybutton}
                </div>
            )
            break;
        case "UploadButton":
            buttonType = (
                <div>
                    <div className="c-button-a-UploadButton" style={{
                        fill: `${svgColor}`
                    }}>
                        <svg xmlns="http://www.w3.org/2000/svg" width="252.517" height="38.69" viewBox="0 0 252.517 38.69">
                            <path id="Path_376" data-name="Path 376" d="M486.373,906.208H286.982v16.284l-12.6,12.6V943.9H525.172Z" transform="translate(-273.887 -905.708)" stroke="#0000dc" stroke-width="1" />
                        </svg>
                        <p className="button-text">{props.text}</p>
                    </div>
                    {emptybutton}
                </div>
            )
            break;
        case "ToolboxCategoryButton":
            buttonType = (
                <div className="c-button-a-ToolboxCategoryButton" ref={buttonTyper} style={{
                    backgroundColor: buttonColor,
                    borderColor: borderColor
                }}>
                    <div className="c-button-a-ToolboxCategoryContents" >
                        <div className="button-svg">
                            {props.children}
                        </div>
                        <div className="button-text">
                            {props.text}
                        </div>
                    </div>
                    {emptybutton}
                </div>
            )
            break;
        case "ToolboxLevelButton":
            buttonType = (
                <div>
                    <div className="c-button-a-ToolboxLevel" ref={buttonTyper} style={{
                        backgroundColor: buttonColor,
                        borderColor: borderColor
                    }}>
                        <p className="button-text">
                            {props.text}
                        </p>
                    </div>
                    {emptybutton}
                </div>
            )
            break;
        case "FilterButton":
            buttonType = (
                <div>
                    <div>
                        <svg id="Component_3_20" data-name="Component 3 – 20" xmlns="http://www.w3.org/2000/svg" width="120" height="40" viewBox="0 0 120 40">
                            <path id="Path_33" data-name="Path 33" d="M306.954,42h94.091c5.06,5.1,7.9,7.961,12.955,13.063V82H294V55.063Z" transform="translate(-294 -42)" fill={buttonColor} />
                            <g id="Group_31" data-name="Group 31" transform="translate(30.99 8.794)">
                                <text id="Filter" transform="translate(17.237 17.801)" fill="#fff" font-size="17" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">Filter</tspan></text>
                                <path id="Union_5" data-name="Union 5" d="M-2569.748-80.167l-6.242-11.041h16l-6.242,11.041v5.035l-3.515,1.424Z" transform="translate(2566 93.258)" fill="none" stroke="#fff" stroke-width="2" />
                            </g>
                        </svg>
                    </div>
                    {emptybutton}
                </div>
            )
            break;
        case "DeviceAddButton":
            buttonType = (
                <div>
                    <div>
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 25 25">
                            <g id="Add_Button" data-name="Add Button" transform="translate(-166 -240)">
                                <circle id="Ellipse_4" data-name="Ellipse 4" cx="12.5" cy="12.5" r="12.5" transform="translate(166 240)" fill="#4c97ff" />
                                <rect id="Rectangle_137" data-name="Rectangle 137" width="11.263" height="1.449" transform="translate(172.869 251.795)" fill="#e9e9ff" />
                                <rect id="Rectangle_138" data-name="Rectangle 138" width="1.449" height="11.263" transform="translate(177.775 246.885)" fill="#e9e9ff" />
                            </g>
                        </svg>
                    </div>
                    {emptybutton}
                </div>
            )
            break;
        case "ExampleButton":
            buttonType = (
                <div>
                    <div className="c-button-a-ExampleButton">
                        <p className="button-text"> {props.text}</p>
                    </div>
                    {emptybutton}
                    
                </div>
            )
            break;
        case "FancyButton":
            buttonType = (
                <div className="c-Button-a-FancyButton" ref={buttonTyper} style={{
                    fill: `${svgColor}`,
                    backgroundColor: buttonColor,
                    borderColor: borderColor
                }}>
                    <svg xmlns="http://www.w3.org/2000/svg" width="322" height="72" viewBox="0 0 322 72">
                        <path id="Path_33" data-name="Path 33" d="M317.173,42H592.825C601.876,51.182,606.95,56.33,616,65.513V114H294V65.513Z" transform="translate(-294 -42)" />
                    </svg>

                    <p>
                        {props.text}
                    </p>
                    {emptybutton}
                </div>

            )
            break;
        case "CollapseEditor":
            buttonType = (
                <div className="c-Button-a-CollapseEditor">
                    <svg
                        xmlns="http://www.w3.org/2000/svg" width="27.212" height="22" viewBox="0 0 27.212 22">
                        <g id="Path_461" data-name="Path 461" transform="translate(19.212)" fill="none">
                            <path d="M0,0H8V22H0Z" stroke={props.outColor} />
                            <path d="M 3 3 L 3 19 L 5 19 L 5 3 L 3 3 M 0 0 L 8 0 L 8 22 L 0 22 L 0 0 Z" stroke={props.outColor} fill={props.outColor} />
                        </g>
                        <path id="Path_460" data-name="Path 460" d="M0,0H14.833" transform="translate(0 11)" fill="none" stroke={props.outColor} stroke-width="3" />
                        <path id="Path_459" data-name="Path 459" d="M3006.783,118.152l6.449,6.449-6.449,6.449" transform="translate(-2998.084 -113.601)" stroke={props.outColor} fill="none" stroke-width="3" />
                    </svg>
                    {emptybutton}
                </div>
            )
            break;
        case "ExpandEditor":
            buttonType = (
                <div className="c-Button-a-ExpandEditor">
                    <svg xmlns="http://www.w3.org/2000/svg" width="29.334" height="22" viewBox="0 0 29.334 22">
                        <g id="Path_463" data-name="Path 463" transform="translate(11.334)" fill="none" stroke-dasharray="64 11">
                            <path d="M0,0H18V22H0Z" stroke="none" />
                            <path d="M 0 0 L 18 0 L 18 3 C 18 9.019613265991211 18 22 18 22 L 15 22 C 9.879446029663086 22 0 22 0 22 L 0 16 L 3 16 L 3 19 L 15 19 L 15 3 L 3 3 L 3 5 L 0 5 L 0 0 Z" stroke="none" fill={props.outColor} />
                        </g>
                        <path id="Path_462" data-name="Path 462" d="M14.833,0H0" transform="translate(2.437 11)" fill="none" stroke={props.outColor} stroke-width="3" />
                        <path id="Path_459" data-name="Path 459" d="M3013.232,118.152l-6.449,6.449,6.449,6.449" transform="translate(-3004.661 -113.601)" fill="none" stroke={props.outColor} stroke-width="3" />
                    </svg>
                    {emptybutton}
                </div>
            )
            break;
        case "MenuXButton":
            buttonType = (
                <div className="c-Button-a-MenuCloseButton">
                    <svg xmlns="http://www.w3.org/2000/svg" width="22.121" height="22.121" viewBox="0 0 22.121 22.121">
                        <line id="Line_34" data-name="Line 34" x2="20" y2="20" transform="translate(1.061 1.061)" fill="none" stroke={props.outColor} stroke-width="3" />
                        <line id="Line_35" data-name="Line 35" x1="19" y2="19" transform="translate(1.561 1.561)" fill="none" stroke={props.outColor} stroke-width="3" />
                    </svg>
                    {emptybutton}
                </div>
            )
            break;
        case "TitleButton":
            buttonType = (
                <div className="c-Button-a-TitleButton">
                    {props.children}
                </div>
            )
            break;
        case "FrameBarButton":
            buttonType = (
                <div className="c-Button-a-FrameBarButton" style={{
                    fill: `${svgColor}`
                }}>
                    {props.children}
                    {emptybutton}
                </div>
            )
            break;
        case " ":
            buttonType = (
                <div>
                    {emptybutton}
                </div >
            )
            break;

    }



    return (
        <div id="button-container">
            {buttonType}
        </div>
    )
}

Button.defaultProps = {
    type: "LanguageMenuButton",
    inColor: "#0000bc",
    outColor: "#FAC",
    hoverColor: "#0000bc",
    s_ButtonState: "Out",
    borderColor: "#3722FF",
    text: "Insert Text Here",
    hoverEffect: "fill"
}

Button.propTypes = {
    type: PropTypes.string,
    inColor: PropTypes.string,
    outColor: PropTypes.string,
    hoverColor: PropTypes.string,
    s_ButtonState: PropTypes.string,
}

export default Button
