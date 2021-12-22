import React, { useState, useRef, useEffect } from 'react'
import PropTypes from "prop-types"

import HeaderButton from "./../HeaderButton"

import "./Dropdown.scss"

const Dropdown = (props) => {
    var [buttonState, setButtonState] = useState("Out");
    const dropDownContainer = useRef(null);
    const dropdownBox = useRef(null)
    useOutsideAlerter(dropDownContainer)

    // On click outside of dropbox
    function useOutsideAlerter(ref) {
        useEffect(() => {
            //Alert on click outside of element
            function handleClickOutside(event) {
                if (ref.current && !ref.current.contains(event.target)) {
                    setButtonState("Out");
                    dropdownBox.current.style.display = "none"
                    document.getElementById("blocklyDiv").style.pointerEvents = "auto"
                }
            }

            document.addEventListener("mousedown", handleClickOutside)
            return () => {
                document.removeEventListener("mousedown", handleClickOutside)
            }
        }, [ref])
    }

    function buttonClicked() {
        if (buttonState === "Out") {
            setButtonState("In");
            dropdownBox.current.style.display = "block"
            document.getElementById("blocklyDiv").style.pointerEvents = "none"
        } else if (buttonState === "In") {
            setButtonState("Out");
            dropdownBox.current.style.display = "none"
            document.getElementById("blocklyDiv").style.pointerEvents = "auto"
        }
        //console.log(dropdownBox)
    }

    var ButtonHolder = [];
    function populateDropbox() {
        var i = 0;
        if (props.list !== undefined && props.funcsOnClick !== undefined) {
            for (i; i < props.list.length; i++) {
                ButtonHolder.push(<button className="button-no-border" onClick={props.funcsOnClick[i]} >{props.list[i][0]} <div className="shortcutText"> {props.list[i][1]} </div></button>)
            }
        }
    }

    return (
        <div className="dropdown-container" ref={dropDownContainer}>
            <HeaderButton buttonImage={props.buttonImage} onClick={buttonClicked} s_ButtonState={buttonState} />
            <div className="blue-dropdown-box" ref={dropdownBox}>
                {populateDropbox()}
                {ButtonHolder}
            </div>
        </div>
    )
}

Dropdown.defaultProps = {
    buttonImage: 5,
    list: [["Hello",], ["World",]],
    funcsOnClick: [() => { console.log("Hello") }, () => { console.log("World") }],
    type: "2"
}

Dropdown.propTypes = {
    buttonImage: PropTypes.string,
    list: PropTypes.arrayOf(PropTypes.string),
    funcs: PropTypes.arrayOf(PropTypes.func)
}

export default Dropdown
