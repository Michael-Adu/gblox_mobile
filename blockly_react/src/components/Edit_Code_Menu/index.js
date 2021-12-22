import React, { useState, useEffect, useRef, useContext } from 'react';
import PropTypes from 'prop-types'
import Menu from '../Menu'
import Prism from "prismjs";
import Button from "../Button"
import {Ctxt_SingletonManager} from '../contexts/Ctxt_SingletonManager'
import "prismjs/components/prism-c";
import "prismjs/components/prism-cpp";
import "prismjs/components/prism-arduino";
import "../prismjsTheme/gbloxTheme.css";
import './Edit_Code_Menu.scss'
import { MATH_SINGLE_OP_ABSOLUTE } from 'blockly/msg/en';

var lines = [1]

function Index(props) {
    
    const { edited_code, setEditedCode } = useContext(Ctxt_SingletonManager)
    const slider_highlighting = useRef(null);
    const editor = useRef(null);
    const [lineNumber, setLineNumber] = useState(<p>{1}</p>);

    function update(event) {
        var result_element = document.querySelector("#menu-highlighting-content");
        setEditedCode(event.target.value)
        // Update code
        result_element.innerHTML = event.target.value.replace(new RegExp("&", "g"), "&").replace(new RegExp("<", "g"), "<"); /* Global RegExp */
        // Syntax Highlight

        Prism.highlightElement(result_element);
    }
    function sync_scroll(element) {
        /* Scroll result to scroll coords of event - sync with textarea */
        slider_highlighting.current.scrollTop = editor.current.scrollTop;
        slider_highlighting.current.scrollLeft = editor.current.scrollLeft;
    }

    function check_tab(event) {
        var code = event.target.value;
        if (event.key == "Tab") {
            event.preventDefault();
            var before_tab = code.slice(0, event.target.selectionStart);
            var after_tab = code.slice(event.target.selectionEnd, event.target.value.length);
            console.log(`Value before slice = ${before_tab}`)
            console.log(`Value after slice = ${after_tab}`)
            var cursor_pos = event.target.selectionEnd + 1;
            event.target.value = before_tab + "\t" + after_tab;
            event.target.selectionStart = cursor_pos;
            event.target.selectionEnd = cursor_pos;
            update(event);
        }
    }
    function expandEditor() {
        document.getElementById("full-editing").value = document.getElementById("menu-editing").value
        document.querySelector("#full-highlighting-content").innerHTML = document.querySelector("#menu-highlighting-content").innerHTML
        var code_editor = document.getElementById("c-codeEditor")
        var toolbox = document.getElementById("Toolbox");
        toolbox.style.filter = "blur(10px)"
        toolbox.style.pointerEvents = "none"
        code_editor.style.display = "block";
        setTimeout(() => {
            code_editor.style.opacity = 1
            code_editor.style.transform = "scaleX(1)"
        }, 200);


    }
    function closeEditorMenu() {
        document.getElementById("code-editor").click();
    }

    useEffect(() => {
        var result_element = document.querySelector("#menu-highlighting-content");
        // Update code
        result_element.innerHTML = document.getElementById("menu-editing").value.replace(new RegExp("&", "g"), "&").replace(new RegExp("<", "g"), "<"); /* Global RegExp */
        // Syntax Highlight

        Prism.highlightElement(result_element);
    })
    return (
        <Menu>
            <div id="edit-code-menu">
                <div className="text">Code Editor</div>
                <div id="code-editor-menu-textarea">
                    <textarea
                        id="menu-editing"
                        ref={editor}
                        spellcheck="false"
                        onInput={e => {
                            update(e);
                            sync_scroll(e)
                        }
                        }
                        onScroll={e =>
                            sync_scroll(e)
                        }
                        onKeyDown={check_tab}
                        defaultValue={edited_code}>
                    </textarea>
                    <pre id="menu-highlighting" ref={slider_highlighting} aria-hidden="true">
                        <code className="language-arduino" id="menu-highlighting-content">
                        </code>
                    </pre>
                </div>
                <div id="code-editor-buttons">
                    <div id="expand-button">
                        <Button
                            id="expand-editor-button"
                            type="ExpandEditor"
                            outColor="#9898F0"
                            onClick={expandEditor}
                        />
                    </div>
                    <div id="close-button">
                        <Button
                            type="MenuXButton"
                            outColor="#9898F0"
                            onClick={closeEditorMenu}
                        />
                    </div>
                </div>
            </div>
        </Menu>
    )
}

Index.propTypes = {

}

export default Index

