import React from 'react'
import PropTypes from 'prop-types'
import { useState, useEffect } from 'react'

import "./HeaderButton.scss"

const HeaderButton = (props) => {
    var buttonImage;

    var [buttonColor, setButtonColor] = useState("#0000dc");

    useEffect(() => {
        if (props.s_ButtonState === "In") {
            setButtonColor(props.inColor);
        } else if (props.s_ButtonState === "Out") {
            setButtonColor(props.outColor);
        }
    }, [props.s_ButtonState])

    switch (props.buttonImage) {
        case "1":
            buttonImage = <svg id="Component_3_21" data-name="Component 3 – 21" xmlns="http://www.w3.org/2000/svg" width="93" height="40" viewBox="0 0 93 40">
            <path id="Path_33" data-name="Path 33" d="M306.954,42h67.091c5.06,5.1,7.9,7.961,12.955,13.063V82H294V55.063Z" transform="translate(-294 -42)" fill={buttonColor}/>
            <g id="Group_31" data-name="Group 31" transform="translate(30.99 8.794)">
              <text id="File" transform="translate(18.237 17.801)" fill="#fff" font-size="17" font-family="Baloo2-Regular, 'Baloo \32 '"><tspan x="0" y="0">File</tspan></text>
              <g id="Group_424" data-name="Group 424" transform="translate(-4 -2.007)">
                <g id="Group_30" data-name="Group 30" transform="translate(-9.427 4.252)">
                  <path id="Path_291" data-name="Path 291" d="M.573,1.451h6.5L9.17,3.514H18.6l1.81,2.435V18.564H.573Z" transform="translate(-0.573 -1.451)" fill="none" stroke="#fff" stroke-width="2"/>
                </g>
                <path id="Path_292" data-name="Path 292" d="M10.157,9.272H3.734L1.982,11.389H-9.589" transform="translate(0 -0.16)" fill="none" stroke="#fff" stroke-width="2"/>
                <g id="Ellipse_9" data-name="Ellipse 9" transform="translate(4.433 15.795)" fill="none" stroke="#fff" stroke-width="2">
                  <circle cx="1.209" cy="1.209" r="1.209" stroke="none"/>
                  <circle cx="1.209" cy="1.209" r="0.209" fill="none"/>
                </g>
              </g>
            </g>
          </svg>          
            break;
        case "2":
            buttonImage = <svg id="Component_3_2" data-name="Component 3 – 2" xmlns="http://www.w3.org/2000/svg" width="100" height="40" viewBox="0 0 100 40">
            <path id="Path_33" data-name="Path 33" d="M306.954,42h74.091c5.06,5.1,7.9,7.961,12.955,13.063V82H294V55.063Z" transform="translate(-294 -42)" fill={buttonColor}/>
            <g id="Group_31" data-name="Group 31" transform="translate(30.99 8.794)">
              <text id="Edit" transform="translate(18.237 17.801)" fill="#fff" font-size="17" font-family="Baloo2-Regular, 'Baloo \32 '"><tspan x="0" y="0">Edit</tspan></text>
            </g>
            <g id="Group_427" data-name="Group 427" transform="translate(-714.946 -406.786)">
              <path id="Path_294" data-name="Path 294" d="M741.417,433.677l-4.545.909.909-4.545,12.691-12.691,2.764-2.764,3.636,3.636Z" transform="translate(-3.441 2.795)" fill="none" stroke="#fff" stroke-miterlimit="10" stroke-width="2"/>
              <path id="Path_295" data-name="Path 295" d="M3.636,3.636l-.909-.909L0,0" transform="translate(747.953 420.108)" fill="#fff" stroke="#fff" stroke-width="2"/>
              <path id="Path_296" data-name="Path 296" d="M3.636,3.636l-.909-.909L0,0" transform="translate(735.451 430.793)" fill="#fff" stroke="#fff" stroke-width="2"/>
            </g>
          </svg>
          
            break;
        case "3":
            buttonImage = <svg id="Component_14_1" data-name="Component 14 – 1" xmlns="http://www.w3.org/2000/svg" width="103.381" height="40" viewBox="0 0 103.381 40">
            <path id="Path_33" data-name="Path 33" d="M306.954,42h77.472c5.06,5.1,7.9,7.961,12.955,13.063V82H294V55.063Z" transform="translate(-294 -42)" fill={buttonColor}/>
            <g id="Group_426" data-name="Group 426" transform="translate(-504.258 -38.405)">
              <path id="Path_252" data-name="Path 252" d="M0,0H19.035V13.274l-3.006,4.778H0Z" transform="translate(524.001 49.458)" fill="none" stroke="#fff" stroke-width="2"/>
              <rect id="Rectangle_136" data-name="Rectangle 136" width="6.662" height="5.71" transform="translate(529.671 49.458)" fill="none" stroke="#fff" stroke-width="2"/>
            </g>
            <text id="Save" transform="translate(51.227 26.595)" fill="#fff" font-size="17" font-family="Baloo2-Regular, 'Baloo \32 '"><tspan x="0" y="0">Save</tspan></text>
          </svg>
          
            break;
        case "4":
            buttonImage = <svg id="Component_3_6" data-name="Component 3 – 6" xmlns="http://www.w3.org/2000/svg" width="154" height="40" viewBox="0 0 154 40">
            <path id="Path_33" data-name="Path 33" d="M306.954,42H435.045c5.06,5.1,7.9,7.961,12.955,13.063V82H294V55.063Z" transform="translate(-294 -42)" fill={buttonColor}/>
            <g id="Group_31" data-name="Group 31" transform="translate(30.99 8.794)">
              <text id="RoboCentre" transform="translate(18.237 17.801)" fill="#fff" font-size="17" font-family="Baloo2-Regular, 'Baloo \32 '"><tspan x="0" y="0">RoboCentre</tspan></text>
              <g id="Group_433" data-name="Group 433" transform="translate(-189.709 -91.573)">
                <g id="Group_432" data-name="Group 432" transform="translate(177.062 91.374)">
                  <path id="Path_312" data-name="Path 312" d="M194.243,101.027a.665.665,0,0,0-.5.285,8.006,8.006,0,0,0-7.032-5.2V93.636a1.18,1.18,0,1,0-.943,0v2.472a8.005,8.005,0,0,0-7.031,5.2.665.665,0,0,0-.5-.285c-.652,0-1.18,1.373-1.18,3.068s.528,3.068,1.18,3.068a.665.665,0,0,0,.5-.285,8,8,0,0,0,15.006,0,.665.665,0,0,0,.5.285c.651,0,1.18-1.374,1.18-3.068S194.895,101.027,194.243,101.027Zm-8,8.968a5.9,5.9,0,1,1,5.9-5.9A5.9,5.9,0,0,1,186.243,109.994Z" transform="translate(-177.062 -91.374)" fill="#fff" fill-rule="evenodd"/>
                  <path id="Path_313" data-name="Path 313" d="M200.85,125.986a4.956,4.956,0,1,0,4.956,4.956A4.956,4.956,0,0,0,200.85,125.986Zm0,8.025a3.068,3.068,0,1,1,3.068-3.068A3.068,3.068,0,0,1,200.85,134.011Z" transform="translate(-191.669 -118.222)" fill="#fff" fill-rule="evenodd"/>
                </g>
              </g>
            </g>
          </svg>
          
            break;
        case "5":
            buttonImage = <svg id="Component_3_5" data-name="Component 3 – 5" xmlns="http://www.w3.org/2000/svg" width="170" height="40" viewBox="0 0 170 40">
            <path id="Path_33" data-name="Path 33" d="M306.954,42H451.045c5.06,5.1,7.9,7.961,12.955,13.063V82H294V55.063Z" transform="translate(-294 -42)" fill={buttonColor}/>
            <g id="Group_31" data-name="Group 31" transform="translate(30.99 8.794)">
              <text id="Competitions" transform="translate(18.237 17.801)" fill="#fff" font-size="17" font-family="Baloo2-Regular, 'Baloo \32 '"><tspan x="0" y="0">Competitions</tspan></text>
              <g id="Group_428" data-name="Group 428" transform="translate(-849.472 -404.742)">
                <path id="Path_297" data-name="Path 297" d="M850.715,417.639V408H838v9.639l4.488,2.094v3.838h-.748V425.8h5.236v-2.224h-.748v-3.838Z" transform="translate(-0.358)" fill="none" stroke="#fff" stroke-miterlimit="10" stroke-width="2"/>
                <path id="Path_298" data-name="Path 298" d="M857.732,417.374H855V411h3.642Z" transform="translate(-4.642 -0.268)" fill="none" stroke="#fff" stroke-miterlimit="10" stroke-width="2"/>
                <path id="Path_299" data-name="Path 299" d="M834.911,417.374h2.732V411H834Z" transform="translate(0 -0.268)" fill="none" stroke="#fff" stroke-miterlimit="10" stroke-width="2"/>
                <line id="Line_6" data-name="Line 6" x2="11.838" transform="translate(838.081 426.212)" fill="#fff" stroke="#fff" stroke-miterlimit="10" stroke-width="2"/>
              </g>
            </g>
          </svg>
          
            break;
        case "6":
            buttonImage = <svg id="Component_3_3" data-name="Component 3 – 3" xmlns="http://www.w3.org/2000/svg" width="130" height="40" viewBox="0 0 130 40">
            <path id="Path_33" data-name="Path 33" d="M306.954,42H411.045c5.06,5.1,7.9,7.961,12.955,13.063V82H294V55.063Z" transform="translate(-294 -42)" fill="#0000dc"/>
            <g id="Group_31" data-name="Group 31" transform="translate(30.99 8.794)">
              <text id="Settings" transform="translate(18.237 17.801)" fill="#fff" font-size="17" font-family="Baloo2-Regular, 'Baloo \32 '"><tspan x="0" y="0">Settings</tspan></text>
              <path id="Path_302" data-name="Path 302" d="M928,500.214v-4.427h-2.214a8.033,8.033,0,0,0-.716-1.724l1.567-1.567-3.131-3.131-1.567,1.567a8.015,8.015,0,0,0-1.724-.716V488h-4.427v2.214a8.014,8.014,0,0,0-1.724.716l-1.567-1.567-3.131,3.131,1.567,1.567a8.009,8.009,0,0,0-.716,1.724H908v4.427h2.215a8,8,0,0,0,.716,1.724l-1.567,1.567,3.131,3.131,1.567-1.567a8.005,8.005,0,0,0,1.724.716V508h4.427v-2.214a8.006,8.006,0,0,0,1.724-.716l1.567,1.567,3.131-3.131-1.567-1.567a8.029,8.029,0,0,0,.716-1.724ZM920.5,498a2.5,2.5,0,0,1-3.979,2.015,2.524,2.524,0,0,1-.536-.536,2.5,2.5,0,0,1,0-2.959,2.523,2.523,0,0,1,.536-.536,2.5,2.5,0,0,1,2.959,0,2.52,2.52,0,0,1,.536.536A2.495,2.495,0,0,1,920.5,498Z" transform="translate(-922.426 -486.2)" fill="none" stroke="#fff" stroke-miterlimit="10" stroke-width="2"/>
            </g>
          </svg>
          
            break;
        default:
            buttonImage = <svg id="Component_3_1" data-name="Component 3 – 1" xmlns="http://www.w3.org/2000/svg" width="120" height="40" viewBox="0 0 120 40">
                <path id="Path_33" data-name="Path 33" d="M306.954,42h94.091c5.06,5.1,7.9,7.961,12.955,13.063V82H294V55.063Z" transform="translate(-294 -42)" fill={buttonColor} />
                <g id="Group_31" data-name="Group 31" transform="translate(30.99 8.794)">
                    <text id="File" transform="translate(18.237 17.801)" fill="#fff" font-size="17" font-family="Baloo2-Regular, 'Baloo \32"><tspan x="0" y="0">File</tspan></text>
                    <g id="Group_424" data-name="Group 424" transform="translate(-4 -2.007)">
                        <g id="Group_30" data-name="Group 30" transform="translate(-9.427 4.252)">
                            <path id="Path_291" data-name="Path 291" d="M.573,1.451h6.5L9.17,3.514H18.6l1.81,2.435V18.564H.573Z" transform="translate(-0.573 -1.451)" fill="none" stroke="#fff" stroke-width="2" />
                        </g>
                        <path id="Path_292" data-name="Path 292" d="M10.157,9.272H3.734L1.982,11.389H-9.589" transform="translate(0 -0.16)" fill="none" stroke="#fff" stroke-width="2" />
                        <g id="Ellipse_9" data-name="Ellipse 9" transform="translate(4.433 15.795)" fill="none" stroke="#fff" stroke-width="2">
                            <circle cx="1.209" cy="1.209" r="1.209" stroke="none" />
                            <circle cx="1.209" cy="1.209" r="0.209" fill="none" />
                        </g>
                    </g>
                </g>
            </svg>
            break;
    }

    function hoverIn() {
        setButtonColor(props.hoverColor);
    }

    function hoverOut() {
        if (props.s_ButtonState === "Out") {
            setButtonColor(props.outColor)
        } else if (props.s_ButtonState === "In") {
            setButtonColor(props.inColor)
        }
    }

    return (
        <div id="header-button-container">
            {buttonImage}
            <button type="button" id="file-button" className="empty-button" onClick={props.onClick} onMouseEnter={hoverIn} onMouseLeave={hoverOut} href={props.href} />
        </div>
    )
}

HeaderButton.defaultProps = {
    buttonImage: "1",
    inColor: "#0000bc",
    outColor: "#0000dc",
    hoverColor: "#0000bc",
    s_ButtonState: "Out",
}

HeaderButton.propTypes = {
    buttonImage: PropTypes.string,
    inColor: PropTypes.string,
    outColor: PropTypes.string,
    hoverColor: PropTypes.string,
    s_ButtonState: PropTypes.string,
}

export default HeaderButton
