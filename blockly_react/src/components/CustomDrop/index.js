import React, { useRef, useEffect, useState } from 'react';
import Button from '../Button'
import ModalSettings from '../ModalSettings';
import './CustomDrop.scss'

const CustomDrop = (props) => {
    var [buttonState, setButtonState] = useState("Out");
    const dropContainer = useRef(null);
    const dropContent = useRef(null);
    useOutsideAlerter(dropContainer);

    function useOutsideAlerter(ref) {
        useEffect(() => {
            //Alert on click outside of element
            function handleClickOutside(event) {
                if (ref.current && !ref.current.contains(event.target)) {
                    setButtonState("Out");
                    dropContent.current.style.display = "none"
                    // document.getElementById("blocklyDiv").style.pointerEvents = "auto"
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
            dropContent.current.style.display = "block"
            document.getElementById("blocklyDiv").style.pointerEvents = "none"
        } else if (buttonState === "In") {
            setButtonState("Out");
            dropContent.current.style.display = "none"
            // document.getElementById("blocklyDiv").style.pointerEvents = "auto"
        }
    }

    var ButtonHolder = [];
    switch (props.dropType) {
        case "list":
            var i = 0;
            if (props.list !== undefined && props.funcsOnClick !== undefined) {
                for (i; i < props.list.length; i++) {
                    ButtonHolder.push(
                        <div class="c-CustomDrop-a-MenuButton">
                            <Button type={props.contentButtonType} onClick={props.funcsOnClick[i]} text={props.list[i]} inColor={props.contentInColor} outColor={props.contentOutColor} hoverColor={props.contentHoverColor} />
                        </div>
                    )
                }
            }
            break;
        case "variable-list":
            var i = 0;
            if (props.list !== undefined && props.funcsOnClick !== undefined) {
                for (i; i < props.list.length; i++) {
                    ButtonHolder.push(
                        <div class="c-CustomDrop-a-MenuButton">
                            <Button type={props.contentButtonType} onClick={props.funcsOnClick[i]} text={props.list[i]} inColor={props.contentInColor} outColor={props.contentOutColor} hoverColor={props.contentHoverColor} />
                        </div>
                    )
                }
            }
            break;
        case "modal":
            switch (props.modal) {
                case "SettingsModal":
                    ButtonHolder = (
                        <div style={{
                            position: 'absolute',
                            right: '50px',
                            filter: 'drop-shadow(0 0 50px black)'
                        }}>
                            <ModalSettings themeOnClick={props.themeOnClick}/>
                        </div>
                    )
                    break;
                case " ":
                    break;
            }
            break;
        case "toolbox_list":
            for (var i=0 ; i < props.childrenlist.length; i++) {
                ButtonHolder.push(
                    <div class="c-CustomDrop-a-ToolboxChildButton">
                        {props.childrenlist[i]}
                    </div>
                );
            }
            break;
    }

    return (
        <div className="c-CustomDrop-a-Container" ref={dropContainer}>
            <Button
                type={props.buttonType}
                onClick={buttonClicked}
                s_ButtonState={buttonState}
                inColor={props.inColor}
                outColor={props.outColor}
                text={props.text}
                contentInColor={props.contentInColor}
                contentOutColor={props.contentOutColor}
                contentHoverColor={props.contentHoverColor}
                children={props.svg}
            />
            <div className="c-CustomDrop-a-Content" ref={dropContent}>
                {[ButtonHolder]}
            </div>
        </div>
    )
}

CustomDrop.defaultProps = {
    buttonType: "SettingsHeaderButton",
    contentButtonType: "LanguageContentButton",
    list: ["Hello", "World"],
    funcsOnClick: [() => { console.log("Hello") }, () => { console.log("World") }],
    dropType: "list",
    modal: "",
}

export default CustomDrop
