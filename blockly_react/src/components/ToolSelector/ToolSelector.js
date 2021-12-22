import React, { useRef, useEffect, useState, useContext } from 'react';
import PropTypes from 'prop-types'
import './ToolSelector.scss'
import Button from '../Button'
import { Ctxt_SingletonManager } from '../contexts/Ctxt_SingletonManager';


function level_group(level) {
    var button_levels = [];
    for (var i = 1; i <= level; i++) {
        if (i != level) {
            button_levels.push(
                <Button
                    type="ToolboxLevelButton"
                    s_ButtonState="Out"
                    inColor="#060841"
                    outColor="#060841"
                    hoverColor="#0000DC"
                    text={i}
                    hoverEffect="fill">
                </Button>
            )
            button_levels.push(
                <div className="level-connector"></div>
            )
        }
        else {
            button_levels.push(
                <div className="level-connector"></div>
            )
            button_levels.push(
                <Button
                    type="ToolboxLevelButton"
                    s_ButtonState="Out"
                    inColor="#060841"
                    outColor="#060841"
                    hoverColor="#0000DC"
                    text={i}
                    hoverEffect="fill">
                </Button>
            )
        }

    }
    return button_levels;
}

var init = false;

function ToolSelector(props) {
    var Connector = useRef(null);
    const [level, setLevel] = useState("")

    const {toolboxUpdate, setToolboxUpdate,toolboxLevel, setToolboxLevel} = useContext(Ctxt_SingletonManager)

    function level1OnClick() {
        setToolboxLevel(1)
        setToolboxUpdate(1)
        setLevel("Beginner")
        if (Connector.current.classList.contains("con-pos-1")) {
            Connector.current.classList.remove("con-pos-1");
        }
        if (Connector.current.classList.contains("con-pos-2")) {
            Connector.current.classList.remove("con-pos-2");
        }
        if (Connector.current.classList.contains("con-pos-3")) {
            Connector.current.classList.remove("con-pos-3");
        }
        if (Connector.current.classList.contains("con-pos-4")) {
            Connector.current.classList.remove("con-pos-4");
        }
        if (Connector.current.classList.contains("con-pos-5")) {
            Connector.current.classList.remove("con-pos-5");
        }

        Connector.current.classList.add("con-pos-1");
    }
    function level2OnClick() {
        setToolboxLevel(2)
        setToolboxUpdate(1)
        setLevel("Apprentice")
        if (Connector.current.classList.contains("con-pos-1")) {
            Connector.current.classList.remove("con-pos-1");
        }
        if (Connector.current.classList.contains("con-pos-2")) {
            Connector.current.classList.remove("con-pos-2");
        }
        if (Connector.current.classList.contains("con-pos-3")) {
            Connector.current.classList.remove("con-pos-3");
        }
        if (Connector.current.classList.contains("con-pos-4")) {
            Connector.current.classList.remove("con-pos-4");
        }
        if (Connector.current.classList.contains("con-pos-5")) {
            Connector.current.classList.remove("con-pos-5");
        }

        Connector.current.classList.add("con-pos-2");
    }
    function level3OnClick() {
        setToolboxLevel(3)
        setToolboxUpdate(1)
        setLevel("Intermediate")
        if (Connector.current.classList.contains("con-pos-1")) {
            Connector.current.classList.remove("con-pos-1");
        }
        if (Connector.current.classList.contains("con-pos-2")) {
            Connector.current.classList.remove("con-pos-2");
        }
        if (Connector.current.classList.contains("con-pos-3")) {
            Connector.current.classList.remove("con-pos-3");
        }
        if (Connector.current.classList.contains("con-pos-4")) {
            Connector.current.classList.remove("con-pos-4");
        }
        if (Connector.current.classList.contains("con-pos-5")) {
            Connector.current.classList.remove("con-pos-5");
        }

        Connector.current.classList.add("con-pos-3");
    }
    function level4OnClick() {
        setToolboxLevel(4)
        setToolboxUpdate(1)
        setLevel("Pro")
        if (Connector.current.classList.contains("con-pos-1")) {
            Connector.current.classList.remove("con-pos-1");
        }
        if (Connector.current.classList.contains("con-pos-2")) {
            Connector.current.classList.remove("con-pos-2");
        }
        if (Connector.current.classList.contains("con-pos-3")) {
            Connector.current.classList.remove("con-pos-3");
        }
        if (Connector.current.classList.contains("con-pos-4")) {
            Connector.current.classList.remove("con-pos-4");
        }
        if (Connector.current.classList.contains("con-pos-5")) {
            Connector.current.classList.remove("con-pos-5");
        }

        Connector.current.classList.add("con-pos-4");
    }
    function level5OnClick() {
        setToolboxLevel(5)
        setToolboxUpdate(1)
        setLevel("Master")
        if (Connector.current.classList.contains("con-pos-1")) {
            Connector.current.classList.remove("con-pos-1");
        }
        if (Connector.current.classList.contains("con-pos-2")) {
            Connector.current.classList.remove("con-pos-2");
        }
        if (Connector.current.classList.contains("con-pos-3")) {
            Connector.current.classList.remove("con-pos-3");
        }
        if (Connector.current.classList.contains("con-pos-4")) {
            Connector.current.classList.remove("con-pos-4");
        }
        if (Connector.current.classList.contains("con-pos-5")) {
            Connector.current.classList.remove("con-pos-5");
        }

        Connector.current.classList.add("con-pos-5");
    }
    useEffect(() => {
        if (init === false) {
            init = true;
            document.getElementById("toolbox_selector_level_1").click()
        }
    })

    return (
        <div className="c-ToolSelector">
            <div className="toolbox-title">Level: {level}</div>
            <div className="c-buttongroup-a-Levels">
                {/*level_group(5)*/}
                <Button
                    id="toolbox_selector_level_1"
                    type="ToolboxLevelButton"
                    s_ButtonState="Out"
                    inColor="#060841"
                    outColor="#060841"
                    hoverColor="#0000DC"
                    text={1}
                    hoverEffect="fill"
                    onClick={level1OnClick}>
                </Button>
                <div className="level-connector"></div>
                <Button
                    id="toolbox_selector_level_2"
                    type="ToolboxLevelButton"
                    s_ButtonState="Out"
                    inColor="#060841"
                    outColor="#060841"
                    hoverColor="#0000DC"
                    text={2}
                    hoverEffect="fill"
                    onClick={level2OnClick}>
                </Button>
                <div className="level-connector"></div>
                <Button
                    id="toolbox_selector_level_3"
                    type="ToolboxLevelButton"
                    s_ButtonState="Out"
                    inColor="#060841"
                    outColor="#060841"
                    hoverColor="#0000DC"
                    text={3}
                    hoverEffect="fill"
                    onClick={level3OnClick}>
                </Button>
                <div className="level-connector"></div>
                <Button
                    id="toolbox_selector_level_4"
                    type="ToolboxLevelButton"
                    s_ButtonState="Out"
                    inColor="#060841"
                    outColor="#060841"
                    hoverColor="#0000DC"
                    text={4}
                    hoverEffect="fill"
                    onClick={level4OnClick}>
                </Button>
                <div className="level-connector"></div>
                <Button
                    id="toolbox_selector_level_5"
                    type="ToolboxLevelButton"
                    s_ButtonState="Out"
                    inColor="#060841"
                    outColor="#060841"
                    hoverColor="#0000DC"
                    text={5}
                    hoverEffect="fill"
                    onClick={level5OnClick}>
                </Button>
            </div>
            <div className="connector" ref={Connector}>
                <div id="connector-bottom" />
                <div id="connector-middle" />
                <div id="connector-top" />
            </div>
        </div>

    )
}

ToolSelector.propTypes = {

}

export default ToolSelector

