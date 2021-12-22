import React, { useState, useEffect, useContext } from 'react';
import PropTypes from 'prop-types';

import "./Header.scss"
import Dropdown from '../Dropdown';
import HeaderButton from '../HeaderButton';
import Button from '../Button'
import CustomDrop from '../CustomDrop';
import { Ctxt_SingletonManager } from '../contexts/Ctxt_SingletonManager';
import { ThemeContext } from '../contexts/ThemeContext';

const Header = (props) => {
    const {
        fileheader, 
        editheader,
        exportBlocks,
        currentWorkspace
    } = useContext(Ctxt_SingletonManager)
    
    const { 
        changeTheme
    } = useContext(ThemeContext)
    /**Create Overlay for DropList*/
    var overlay = document.createElement('div')
    overlay.classList.add("focusOverlay")

    overlay.onclick = function (event) {
        var drops = document.getElementsByClassName("dropdown-content");
        for (var i = 0; i < drops.length; i++) {
            if (drops[i].classList.contains("show")) {
                drops[i].classList.remove("show");
            }
        }
        overlay.remove()
    }
//Function to change the theme as per the theme selected

    return (
        <div>
            <div className="header-container">
                <div id="logo">
                    <svg xmlns="http://www.w3.org/2000/svg" width="106.412" height="36.223" viewBox="0 0 106.412 36.223">
                        <g id="Group_527" data-name="Group 527" transform="translate(-322.846 -396.538)">
                            <g id="Group_521" data-name="Group 521" transform="translate(322.846 396.538)">
                                <path id="Path_413" data-name="Path 413" d="M336.621,459.334a16.468,16.468,0,0,1-8.016-2.063,10.959,10.959,0,0,0-2.694,4.8,22.108,22.108,0,0,0,21.424,0,11.006,11.006,0,0,0-2.7-4.8A16.474,16.474,0,0,1,336.621,459.334Z" transform="matrix(1, -0.017, 0.017, 1, -333.135, -422.861)" />
                                <path id="Path_414" data-name="Path 414" d="M350.066,415.1a13.858,13.858,0,0,1-13.856,13.858,11.1,11.1,0,0,1-11.1-11.094v-.008a10.966,10.966,0,0,1,.812-4.158,11.093,11.093,0,0,1,20.558-.015.037.037,0,0,1,0,.015.028.028,0,0,1,0,.01.075.075,0,0,1-.005.012,11.091,11.091,0,0,1-4.814,5.479l-.007,0a.064.064,0,0,1-.017,0,.043.043,0,0,1-.042-.044v-.011a5.543,5.543,0,1,0-10.762.1A5.445,5.445,0,0,0,334.058,423a10.331,10.331,0,0,0,6.864-.22,14.558,14.558,0,0,0,8.749-9.932l.037-.169c.016-.078.019-.109.061-.112s.059.018.075.095c.008.034.041.19.041.19A14.068,14.068,0,0,1,350.066,415.1Z" transform="translate(-325.115 -403.848)" />
                                <path id="Path_415" data-name="Path 415" d="M373.51,407.344a.044.044,0,0,1-.045.044.041.041,0,0,1-.036-.023h0a2.437,2.437,0,0,0-1.54-1.236,2.307,2.307,0,0,0-.487-.076.874.874,0,0,0-.148-.009,2.326,2.326,0,0,0-.888.171,2.4,2.4,0,0,0-1.227,1.048c-.02.032-.037.064-.057.1,0,.005,0,.007-.006.011a.042.042,0,0,1-.035.019.047.047,0,0,1-.045-.046v0s.089-.587.143-.875v0a15.969,15.969,0,0,1,.38-1.58c.124-.423.267-.842.428-1.255a14.476,14.476,0,0,1,.589-1.356q.311-.642.677-1.252l0-.005a.051.051,0,0,1,.037-.019.045.045,0,0,1,.036.019l0,.005h0a16.574,16.574,0,0,1,2.215,6.306l0,.013Z" transform="translate(-346.799 -400.997)" />
                            </g>
                            <g id="Group_522" data-name="Group 522" transform="translate(388.584 402.65)">
                                <path id="Path_416" data-name="Path 416" d="M460.7,408.621a10.111,10.111,0,1,0,10.1,10.111A10.124,10.124,0,0,0,460.7,408.621Zm0,16.633a6.522,6.522,0,1,1,6.522-6.522A6.533,6.533,0,0,1,460.7,425.254Z" transform="translate(-450.59 -408.621)" />
                            </g>
                            <g id="Group_523" data-name="Group 523" transform="translate(354.73 396.538)">
                                <path id="Path_417" data-name="Path 417" d="M393.764,402.65a10.173,10.173,0,0,0-5.29,1.506l-1.486.919v-8.536h-3.325V412.76a10.106,10.106,0,1,0,10.1-10.111Zm0,16.633a6.522,6.522,0,1,1,6.522-6.522A6.539,6.539,0,0,1,393.764,419.283Z" transform="translate(-383.663 -396.538)" />
                            </g>
                            <g id="Group_524" data-name="Group 524" transform="translate(380.115 396.538)">
                                <path id="Path_418" data-name="Path 418" d="M437.192,396.538v25.688h-3.325c0-2-.019-6.435-.019-6.61,0-.226.01-.44.019-.685V396.538Z" transform="translate(-433.848 -396.538)" />
                            </g>
                            <path id="Path_419" data-name="Path 419" d="M514.755,412.207v-3.589A10.106,10.106,0,0,0,506.437,413a10.089,10.089,0,0,0-8.311-4.377v3.589a6.532,6.532,0,0,1,6.52,6.478c0,.015,0,.03,0,.044s0,.03,0,.045a6.539,6.539,0,0,1-6.52,6.478v3.588a10.089,10.089,0,0,0,8.311-4.377,10.105,10.105,0,0,0,8.318,4.377v-3.588a6.522,6.522,0,0,1,0-13.045Z" transform="translate(-85.497 -5.97)" />
                        </g>
                    </svg>
                </div>
                <div className="header-buttons-segment">
                    <Dropdown buttonImage="1" list={[["New","Ctrl+N"], ["Open","Ctrl+O"], ["Save","Ctrl+S"], ["Save As","Ctrl+S"], ["Share",""], ["Close"],""]} funcsOnClick={fileheader}/>
                    <Dropdown buttonImage="2" list={[["Cut","Ctrl+X"], ["Copy","Ctrl+C"], ["Paste","Ctrl+V"], ["Delete","Del"]]} funcsOnClick={editheader}/>
                    <HeaderButton buttonImage="3" onClick={exportBlocks}/>
                </div>
                <div id="blank-space" />
                <div className="header-buttons-segment">
                    <HeaderButton buttonImage="4" onClick={props.robocentreURL}/>
                    <HeaderButton buttonImage="5" onClick={props.robocentreURL} />
                    <div style={{
                        marginLeft: '5px'
                    }}>
                        <CustomDrop
                            dropType="modal"
                            funcsOnClick={[
                                () => { },
                                function noRefCheck() { }
                            ]}
                            themeOnClick={changeTheme}
                            modal="SettingsModal"
                            hoverColor="#0000aa"
                            inColor="#0000bc"
                            outColor="#0000dc"
                        />
                    </div>
                </div>
            </div>

        </div>

    )
}

export default Header

/*
Header.PropTypes = {

}

Header.defaultProps = {

}

*/