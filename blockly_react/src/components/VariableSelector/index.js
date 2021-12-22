import React, { useState, useEffect, useContext } from 'react';
import Button from '../Button'
import CustomDrop from '../CustomDrop'
import { Ctxt_SingletonManager } from '../contexts/Ctxt_SingletonManager';
import './VariableSelector.scss'

function Index(props) {
    const { name, state, children, ...rest } = props;
    const { 
        closeVariableDialog
    } = useContext(Ctxt_SingletonManager)
    return (
        <div className={`dialog-container`}>
            <div id="variable-type-text">Variable Type: </div>
            <div id="variable-type-select">
            <select>
                <option>Float</option>
                <option>Integer</option>
                <option>String</option>
            </select>
            </div>
            <div id="variable-name-text">
                Variable Name:
            </div>
            <input type="text" id="variable-name-input"></input>
            <div id="close-button">
                <Button
                    type="ExampleButton"
                    id="a-CloseButton"
                    s_ButtonState="Out"
                    inColor="#060841"
                    outColor="#0000DC"
                    hoverColor="#060841"
                    text={"Close"}
                    hoverEffect="fill"
                    onClick={closeVariableDialog}
                    >
                </Button>
            </div>
            <div id="ok-button">
                <Button
                    type="ExampleButton"
                    id="a-OkButton"
                    s_ButtonState="Out"
                    inColor="#060841"
                    outColor="#0000DC"
                    hoverColor="#060841"
                    text={"Create New Variable"}
                    hoverEffect="fill"
                    onClick={closeVariableDialog}>
                        
                </Button>
            </div>
        </div>
    )
}

export default Index
