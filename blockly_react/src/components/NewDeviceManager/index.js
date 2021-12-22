import React, { useState, useEffect, useRef, useContext } from 'react'
import "./NewDeviceManager.scss"
import PropTypes from 'prop-types'
import Upload_Circle from '../Upload_Circle'
import Button from "../Button"
import svg_dictionary from '../svg_dictionary'


function Index(props) {
    var slide_out = useRef(null);
    var device_id = useRef(null);

    function add_device(svg, device_name) {
        return (
            <div className="device_icon" id={device_name} onClick={props.deviceOnClick}>
                <svg id={device_name} className="border" xmlns="http://www.w3.org/2000/svg" width="227.914" height="175.467" viewBox="0 0 227.914 175.467">
                    <defs>
                        <filter id="Union_3" x="0" y="0" width="227.914" height="175.467" filterUnits="userSpaceOnUse">
                            <feOffset input="SourceAlpha" />
                            <feGaussianBlur stdDeviation="7.5" result="blur" />
                            <feFlood flood-color="#0000dc" />
                            <feComposite operator="in" in2="blur" />
                            <feComposite in="SourceGraphic" />
                        </filter>
                    </defs>
                    <g transform="matrix(1, 0, 0, 1, 0, 0)" filter="url(#Union_3)">
                        <path id={device_name} data-name="Union 3" d="M-426.485-10.52l6.37-6.774h44.594l12.741-13.549V-98.588l6.37,6.774v60.97L-375.521-10.52Zm-111.131,0V-34.607L-536.2-33.1v21.076h74.323l-1.416,1.5Zm.707-48.173v-60.971l19.112-20.323h50.965l-6.371,6.774H-517.8l-12.74,13.549v67.745Zm179.792-58.712v-21.076H-431.44l1.416-1.5H-355.7V-115.9Z" transform="translate(560.62 162.99)" stroke="rgba(0,0,0,0)" stroke-miterlimit="10" stroke-width="1" />
                    </g>
                </svg>
                <div id={device_name} className="children">
                    {svg}
                </div>
            </div>
        )

    }
    return (
        <div id="c-NewDeviceManager">
            <div id="Device-Background" ref={slide_out}>
                <svg id="background-svg" xmlns="http://www.w3.org/2000/svg" width="1507.982" height="869.612" viewBox="0 0 1507.982 869.612" preserveAspectRatio="none">
                    <defs>
                        <filter id="Path_366" x="0" y="0" width="1507.982" height="869.612" filterUnits="userSpaceOnUse">
                            <feOffset input="SourceAlpha" />
                            <feGaussianBlur stdDeviation="3" result="blur" />
                            <feFlood flood-opacity="0.471" />
                            <feComposite operator="in" in2="blur" />
                        </filter>
                        <filter id="Path_366-2" x="0" y="0" width="1507.982" height="869.612" filterUnits="userSpaceOnUse">
                            <feOffset input="SourceAlpha" />
                            <feGaussianBlur stdDeviation="10.5" result="blur-2" />
                            <feFlood flood-color="#0000dc" flood-opacity="0.51" result="color" />
                            <feComposite operator="out" in="SourceGraphic" in2="blur-2" />
                            <feComposite operator="in" in="color" />
                            <feComposite operator="in" in2="SourceGraphic" />
                        </filter>
                    </defs>
                    <g id="Group_532" data-name="Group 532" transform="translate(-201.01 -108.194)">
                        <g data-type="innerShadowGroup">
                            <g transform="matrix(1, 0, 0, 1, 201.01, 108.19)" filter="url(#Path_366)">
                                <path id="Path_366-3" data-name="Path 366" d="M470.259,1507.169H1739l106.454,106.454-1.579,226.161L1805,1883.5v444.283l-29,29H446.746l-89.271-89.271V1733.755l63.436-63.436v-163.15Z" transform="translate(-347.47 -1497.17)" stroke-width="2" />
                            </g>
                            <path id="Path_366-4" data-name="Path 366" d="M470.259,1507.169H1739l106.454,106.454-1.579,226.161L1805,1883.5v444.283l-29,29H446.746l-89.271-89.271V1733.755l63.436-63.436v-163.15Z" transform="translate(-146.464 -1388.975)" fill="#0b0533" />
                            <g transform="matrix(1, 0, 0, 1, 201.01, 108.19)" filter="url(#Path_366-2)">
                                <path id="Path_366-5" data-name="Path 366" d="M470.259,1507.169H1739l106.454,106.454-1.579,226.161L1805,1883.5v444.283l-29,29H446.746l-89.271-89.271V1733.755l63.436-63.436v-163.15Z" transform="translate(-347.47 -1497.17)" fill="#fff" />
                            </g>
                            <path id="Path_366-6" data-name="Path 366" d="M470.259,1507.169H1739l106.454,106.454-1.579,226.161L1805,1883.5v444.283l-29,29H446.746l-89.271-89.271V1733.755l63.436-63.436v-163.15Z" transform="translate(-146.464 -1388.975)" fill="none" stroke="#0000dc" stroke-width="2" />
                        </g>
                        <path id="Path_368" data-name="Path 368" d="M1703.99,480.6l-21.552,21.552V924.55L1703.99,903Z" transform="translate(0 3)" />
                        <path id="Path_372" data-name="Path 372" d="M1703.99,800.6l-21.552,21.552v26.716l21.552-21.552Z" transform="translate(-1439.427 -671.104)" fill="none" stroke="#0000dc" stroke-width="2" />
                        <path id="Path_373" data-name="Path 373" d="M1703.99,800.6l-21.552,21.552v26.716l21.552-21.552Z" transform="translate(-1439.427 -631.104)" fill="none" stroke="#0000dc" stroke-width="2" />
                        <path id="Path_374" data-name="Path 374" d="M1703.99,800.6l-21.552,21.552v26.716l21.552-21.552Z" transform="translate(-1439.427 -591.104)" fill="none" stroke="#0000dc" stroke-width="2" />
                        <path id="Path_375" data-name="Path 375" d="M1703.99,800.6l-21.552,21.552v26.716l21.552-21.552Z" transform="translate(-1439.427 -551.104)" fill="none" stroke="#0000dc" stroke-width="2" />
                        <path id="Path_371" data-name="Path 371" d="M1693.916,539.565l-11.478,11.478V697.214l11.478-11.478Z" transform="translate(-1466.427 -378.687)" fill="#0000dc" stroke="#0000dc" stroke-width="2" />
                    </g>
                </svg>
                <div className="initial-text">Select Your Device</div>
                <div className="Device-Items">
                    {add_device(svg_dictionary.devices.Arduino_Uno_SVG, "Arduino Uno")}
                    {add_device(svg_dictionary.devices.mello, "Mello")}
                    {add_device(svg_dictionary.devices.mingo, "Mingo")}
                </div>
            </div>
        </div>
    )
}

export default Index
