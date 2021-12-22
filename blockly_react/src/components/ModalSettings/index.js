import React from 'react'
import Button from '../Button'
import CustomDrop from '../CustomDrop'
import './ModalSettings.scss'

const ModalSettings = (props) => {
    function removepointerEvent(){
        document.getElementById("blocklyDiv").style.pointerEvents="none";
    }
    return (
        <div className="modal-container" onClick={removepointerEvent}>
            <div className="modal-section">
                <h1>Themes</h1>
                <div style={{
                    display: 'flex',
                    maxHeight: '112px',
                    maxWidth: '365px',
                    position: 'relative',
                    left: '-12px'
                }}>
                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', margin: '5px', flexGrow: '0', flexShrink: '0' }}>
                        <p>Dark Mode</p>
                        <Button id="dark-theme" type="SettingsColor" outColor="#0b0533" hoverEffect="border" onClick={props.themeOnClick}/>
                    </div>
                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center', margin: '5px', flexGrow: '0', flexShrink: '0' }}>
                        <p>Light Mode</p>
                        <Button id="light-theme" type="SettingsColor" outColor="#FFF" hoverEffect="border" onClick={props.themeOnClick}/>
                    </div>
                </div>
            </div>
            {/* <div className="modal-section-break" />
            <div className="modal-section">
                <div style={{
                    marginTop: '15px'
                }}>
                    <Button type="SettingsButton" outColor="#0000FF" inColor="#0000AA" hoverColor="#0000AA" text="Revert all settings" />
                </div>
            </div> */}

        </div >
    )
}

export default ModalSettings
