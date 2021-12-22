import React, { useEffect, useRef, useState } from 'react'

import "./LoadScreen.scss"

const LoadScreen = () => {
    const OuterCircle = useRef(null)
    const LongDot = useRef(null)
    var Dotter = [];
    const DotNum = 14;

    for (var i = 0; i < DotNum; i++) {
        var DotCode = (<div id={`i-DC-${i}`} className="i-DotController"><div className="i-Dot" /></div>)
        Dotter = [...Dotter, DotCode]
    }
    function DoDot(object, num) {
        if (!object.classList.contains("i-anim-DC-" + num)) {
            object.classList.add("i-anim-DC-" + num)
        }
        return num;
    }
    function RemoveDot(object, num) {
        if (object.classList.contains("i-anim-DC-" + num)) {
            object.classList.remove("i-anim-DC-" + num)
        }
        return num;
    }
    useEffect(() => {
        //OuterCircle and LongDot
        setInterval(() => {
            if (!OuterCircle.current.classList.contains("i-anim-OuterCircle")) {
                OuterCircle.current.classList.add("i-anim-OuterCircle")
                setTimeout(() => {
                    if (!LongDot.current.classList.contains("i-anim-LongDot")) {
                        LongDot.current.classList.add("i-anim-LongDot")

                    }
                }, 200)
                setTimeout(() => {
                    for (var i = 0; i < DotNum; i++) {
                        var CurrDot = document.getElementById("i-DC-" + i);
                        DoDot(CurrDot, i)
                    }
                }, 200)
            }
            setTimeout(() => {
                if (OuterCircle.current.classList.contains("i-anim-OuterCircle")) {
                    OuterCircle.current.classList.remove("i-anim-OuterCircle")
                    setTimeout(() => {
                        if (LongDot.current.classList.contains("i-anim-LongDot")) {
                            LongDot.current.classList.remove("i-anim-LongDot")

                        }
                    }, 200)
                    setTimeout(() => {
                        for (var i = 0; i < DotNum; i++) {
                            var CurrDot = document.getElementById("i-DC-" + i);
                            RemoveDot(CurrDot, i)
                        }
                    }, 400)
                }
            }, 1200)
        }, 2000)

    }, [])
    return (
        <div className="c-LoadScreen-a-Container">
            <div className="c-LoadScreen-a-Background" />
            <div className="c-LoadScreen-a-LoadAnim">
                <div id="SideSVGS">
                    <div id="LeftSide">
                        <div id="ErraticTop">
                            <svg xmlns="http://www.w3.org/2000/svg" width="82.169" height="8.489" viewBox="0 0 82.169 8.489">
                                <path id="Path_466" data-name="Path 466" d="M8.361,7.448l63.447.394L81.169-.647H-1Z" transform="translate(1 0.647)" fill="#0000dc" />
                            </svg>
                        </div>
                        <div id="ErraticLeft">
                            <svg xmlns="http://www.w3.org/2000/svg" width="27" height="38" viewBox="0 0 27 38">
                                <defs>
                                    <filter id="Rectangle_240" x="0" y="0" width="27" height="38" filterUnits="userSpaceOnUse">
                                        <feOffset dy="3" input="SourceAlpha" />
                                        <feGaussianBlur stdDeviation="2.5" result="blur" />
                                        <feFlood flood-color="#0000dc" />
                                        <feComposite operator="in" in2="blur" />
                                    </filter>
                                </defs>
                                <g transform="matrix(1, 0, 0, 1, 0, 0)" filter="url(#Rectangle_240)">
                                    <rect id="Rectangle_240-2" data-name="Rectangle 240" width="12" height="23" transform="translate(7.5 4.5)" fill="#fff" />
                                </g>
                            </svg>

                        </div>
                        <div id="ErraticMid">
                            <svg xmlns="http://www.w3.org/2000/svg" width="28.753" height="77" viewBox="0 0 28.753 77">
                                <defs>
                                    <filter id="Path_565" x="0" y="0" width="28.753" height="77" filterUnits="userSpaceOnUse">
                                        <feOffset dy="3" input="SourceAlpha" />
                                        <feGaussianBlur stdDeviation="2.5" result="blur" />
                                        <feFlood flood-color="#0000dc" />
                                        <feComposite operator="in" in2="blur" />
                                    </filter>
                                </defs>
                                <g transform="matrix(1, 0, 0, 1, 0, 0)" filter="url(#Path_565)">
                                    <path id="Path_565-2" data-name="Path 565" d="M-168-5192v-9h13.753v9Zm0-53v-9h13.753v9Z" transform="translate(175.5 5258.5)" fill="#fff" />
                                </g>
                            </svg>

                        </div>
                        <svg className="MainSVG" xmlns="http://www.w3.org/2000/svg" width="578.368" height="339.578" viewBox="0 0 578.368 339.578">
                            <defs>
                                <filter id="Rectangle_240" x="116.104" y="151.391" width="27" height="38" filterUnits="userSpaceOnUse">
                                    <feOffset dy="3" input="SourceAlpha" />
                                    <feGaussianBlur stdDeviation="2.5" result="blur" />
                                    <feFlood flood-color="#0000dc" />
                                    <feComposite operator="in" in2="blur" />
                                </filter>
                                <filter id="Path_563" x="0" y="121.926" width="40.045" height="101.464" filterUnits="userSpaceOnUse">
                                    <feOffset dy="3" input="SourceAlpha" />
                                    <feGaussianBlur stdDeviation="5" result="blur-2" />
                                    <feFlood flood-color="#002bff" />
                                    <feComposite operator="in" in2="blur-2" />
                                    <feComposite in="SourceGraphic" />
                                </filter>
                            </defs>
                            <g transform="matrix(1, 0, 0, 1, 0, 0)" filter="url(#Rectangle_240)">
                                <rect id="Rectangle_240-2" data-name="Rectangle 240" width="12" height="23" transform="translate(123.6 155.89)" fill="#fff" />
                            </g>
                            <path id="Path_564" data-name="Path 564" d="M-154.06-5008.577H57.618L75-4987.239H87.706l43.241,54.884-207.4.33Zm1-117.043,77.607-76.552,207.4.331L88.706-5146.96H76l-17.381,21.339Z" transform="translate(403.989 5236.888)" fill="#110d40" />
                            <g id="Group_551" data-name="Group 551" transform="translate(-290.396 -370.109)">
                                <g transform="matrix(1, 0, 0, 1, 290.4, 370.11)" filter="url(#Path_563)">
                                    <g id="Path_563-2" data-name="Path 563" transform="translate(183 5387.93)" fill="none">
                                        <path d="M-168-5182.536v-12.33h10.045v12.33Zm0-59.133V-5254h10.045v12.331Z" stroke="none" />
                                        <path d="M -158.9553680419922 -5183.53564453125 L -158.9553680419922 -5193.86572265625 L -167.0003051757812 -5193.86572265625 L -167.0003051757812 -5183.53564453125 L -158.9553680419922 -5183.53564453125 M -158.9553680419922 -5242.6689453125 L -158.9553680419922 -5253 L -167.0003051757812 -5253 L -167.0003051757812 -5242.6689453125 L -158.9553680419922 -5242.6689453125 M -157.9553680419922 -5182.53564453125 L -168.0003051757812 -5182.53564453125 L -168.0003051757812 -5194.86572265625 L -157.9553680419922 -5194.86572265625 L -157.9553680419922 -5182.53564453125 Z M -157.9553680419922 -5241.6689453125 L -168.0003051757812 -5241.6689453125 L -168.0003051757812 -5254 L -157.9553680419922 -5254 L -157.9553680419922 -5241.6689453125 Z" stroke="none" fill="#20f" />
                                    </g>
                                </g>
                                <path id="Triangle_End" data-name="Triangle End" d="M300.282-552.3l-6.8-5,6.8-5Z" transform="translate(1 1097)" fill="#fff" />
                            </g>
                            <rect id="Rectangle_237" data-name="Rectangle 237" width="270" height="12" transform="translate(208.604 163.891)" fill="#110d40" />
                            <g id="Small_Circles_-_Side" data-name="Small Circles - Side" transform="translate(-290.396 -318.109)">
                                <g id="Group_549" data-name="Group 549">
                                    <circle id="Ellipse_52" data-name="Ellipse 52" cx="2" cy="2" r="2" transform="translate(744 512)" fill="#0000dc" />
                                    <circle id="Ellipse_57" data-name="Ellipse 57" cx="2" cy="2" r="2" transform="translate(744 460)" fill="#0000dc" />
                                </g>
                                <g id="Group_548" data-name="Group 548">
                                    <circle id="Ellipse_53" data-name="Ellipse 53" cx="2" cy="2" r="2" transform="translate(754 512)" fill="#fff" />
                                    <circle id="Ellipse_56" data-name="Ellipse 56" cx="2" cy="2" r="2" transform="translate(754 460)" fill="#fff" />
                                </g>
                                <g id="Group_547" data-name="Group 547">
                                    <circle id="Ellipse_54" data-name="Ellipse 54" cx="2" cy="2" r="2" transform="translate(764 512)" fill="#fff" />
                                    <circle id="Ellipse_55" data-name="Ellipse 55" cx="2" cy="2" r="2" transform="translate(764 460)" fill="#fff" />
                                </g>
                            </g>
                            <g id="Group_550" data-name="Group 550" transform="translate(-290.396 -370.109)">
                                <path id="Path_560" data-name="Path 560" d="M52.079-4914.422-30.389-4992.9l-5.626.574-8.795-8.935h-13.1l-10.227-8.868H-73.4l-5.058,5.979h-81.973l-7.566-8.158H-48.176l19.68,18.339,80.762,77.724h262.5v1.828ZM-167-5156.109l7.565-8.159h81.974l5.058,5.979h5.268l10.228-8.869h13.1l8.795-8.935,5.626.575L53.078-5254H315.764v1.829H53.265l-80.76,77.723-19.68,18.34Z" transform="translate(553 5624.109)" fill="#0000dc" />
                            </g>
                            <path id="Path_568" data-name="Path 568" d="M18.433,0H154.371l20.42-18.182L430-18" transform="translate(14.104 161.391)" fill="none" stroke="#707070" stroke-width="1" />
                            <path id="Path_569" data-name="Path 569" d="M18.433-18.182H154.371L174.791,0,430-.182" transform="translate(14.104 196.391)" fill="none" stroke="#707070" stroke-width="1" />
                            <line id="Line_37" data-name="Line 37" x2="12" transform="translate(14.104 161.391)" fill="none" stroke="#707070" stroke-width="1" />
                            <line id="Line_38" data-name="Line 38" x2="12" transform="translate(14.104 178.209)" fill="none" stroke="#707070" stroke-width="1" />
                        </svg>
                        <div id="ErraticBottom">
                            <svg xmlns="http://www.w3.org/2000/svg" width="82.169" height="8.489" viewBox="0 0 82.169 8.489">
                                <path id="Path_550" data-name="Path 550" d="M8.361-.253,71.808-.647l9.361,8.489H-1Z" transform="translate(1 0.647)" fill="#0000dc" />
                            </svg>
                        </div>
                    </div>
                    <div className="c-LoadScreen-a-OuterCircle">
                        <svg id="i-OC" ref={OuterCircle} xmlns="http://www.w3.org/2000/svg" width="312" height="312" viewBox="0 0 312 312">
                            <g id="Outer_Circle" data-name="Outer Circle" fill="none" stroke-width="10">
                                <circle cx="156" cy="156" r="151" fill="none" />
                            </g>
                        </svg>

                        <div className="c-LoadScreen-a-StaticCircle">
                            <svg xmlns="http://www.w3.org/2000/svg" width="283" height="283" viewBox="0 0 283 283">
                                <g id="Middle_Circle" data-name="Middle Circle" fill="none" stroke-width="2">
                                    <circle cx="141.5" cy="141.5" r="141.5" stroke="none" />
                                    <circle cx="141.5" cy="141.5" r="140.5" fill="none" />
                                </g>
                            </svg>
                        </div>
                        <div className="c-LoadScreen-a-Logo">
                            <svg xmlns="http://www.w3.org/2000/svg" width="78.932" height="105.276" viewBox="0 0 78.932 105.276">
                                <path id="Logo" d="M1005.093-589.331c1.006,2.684,2.125,6.374,2.572,8.052l.783,3.131-2.907-1.9c-2.348-1.565-3.467-1.677-5.7-.559-3.578,1.566-3.8,1.566-3.8-.447,0-3.243,4.7-14.09,5.927-13.643C1002.744-594.475,1004.086-592.015,1005.093-589.331Zm-30.976,4.361c6.486,2.46,13.978,8.834,16.886,14.537,1.677,3.355,1.677,3.69-1.006,8.387a37.776,37.776,0,0,1-6.486,7.828l-3.578,3.019-1.23-5.032c-2.46-9.953-8.163-14.649-17.221-14.426-8.946.112-16.327,8.275-15.432,17.109.895,9.841,7.6,15.544,18.451,15.544,15.208,0,29.3-10.176,35.561-25.385,2.348-6.039,2.46-6.039,2.907-2.572,1.566,10.4-4.7,25.944-13.419,33.548-7.828,7.045-13.978,9.393-24.6,9.841-14.537.671-24.154-4.361-30.976-15.991C918.651-564.617,945.489-595.593,974.117-584.97ZM948.509-507.7c8.722,3.131,22.7,2.572,31.535-1.23,6.933-2.907,7.716-2.572,11.518,5.591,3.131,6.71,3.467,6.374-9.505,10.735-14.537,4.808-29.41,4.138-44.954-2.013-7.045-2.684-7.269-3.914-2.572-11.406,2.572-3.914,4.026-5.256,5.368-4.808C940.9-510.382,944.818-509.04,948.509-507.7Z" transform="translate(-929.515 594.712)" fill="#fff" />
                            </svg>

                        </div>
                        <div id="i-LongDot">
                            <svg ref={LongDot} xmlns="http://www.w3.org/2000/svg" width="277" height="277" viewBox="0 0 277 277">
                                <g id="Path_Of_Travel" data-name="Path Of Travel" fill="none" stroke="#0000dc" stroke-width="4">
                                    <circle cx="138.5" cy="138.5" r="138.5" stroke="none" />
                                    <circle cx="138.5" cy="138.5" r="136.5" fill="none" />
                                </g>
                            </svg>
                            {Dotter}
                        </div>

                    </div>
                    <div id="RightSide">
                        <div id="ErraticTop">
                            <svg xmlns="http://www.w3.org/2000/svg" width="82.169" height="8.489" viewBox="0 0 82.169 8.489">
                                <path id="Path_466" data-name="Path 466" d="M8.361,7.448l63.447.394L81.169-.647H-1Z" transform="translate(1 0.647)" fill="#0000dc" />
                            </svg>
                        </div>
                        <div id="ErraticLeft">
                            <svg xmlns="http://www.w3.org/2000/svg" width="27" height="38" viewBox="0 0 27 38">
                                <defs>
                                    <filter id="Rectangle_240" x="0" y="0" width="27" height="38" filterUnits="userSpaceOnUse">
                                        <feOffset dy="3" input="SourceAlpha" />
                                        <feGaussianBlur stdDeviation="2.5" result="blur" />
                                        <feFlood flood-color="#0000dc" />
                                        <feComposite operator="in" in2="blur" />
                                    </filter>
                                </defs>
                                <g transform="matrix(1, 0, 0, 1, 0, 0)" filter="url(#Rectangle_240)">
                                    <rect id="Rectangle_240-2" data-name="Rectangle 240" width="12" height="23" transform="translate(7.5 4.5)" fill="#fff" />
                                </g>
                            </svg>

                        </div>
                        <div id="ErraticMid">
                            <svg xmlns="http://www.w3.org/2000/svg" width="28.753" height="77" viewBox="0 0 28.753 77">
                                <defs>
                                    <filter id="Path_565" x="0" y="0" width="28.753" height="77" filterUnits="userSpaceOnUse">
                                        <feOffset dy="3" input="SourceAlpha" />
                                        <feGaussianBlur stdDeviation="2.5" result="blur" />
                                        <feFlood flood-color="#0000dc" />
                                        <feComposite operator="in" in2="blur" />
                                    </filter>
                                </defs>
                                <g transform="matrix(1, 0, 0, 1, 0, 0)" filter="url(#Path_565)">
                                    <path id="Path_565-2" data-name="Path 565" d="M-168-5192v-9h13.753v9Zm0-53v-9h13.753v9Z" transform="translate(175.5 5258.5)" fill="#fff" />
                                </g>
                            </svg>

                        </div>
                        <svg className="MainSVG" xmlns="http://www.w3.org/2000/svg" width="578.368" height="339.578" viewBox="0 0 578.368 339.578">
                            <defs>
                                <filter id="Rectangle_240" x="116.104" y="151.391" width="27" height="38" filterUnits="userSpaceOnUse">
                                    <feOffset dy="3" input="SourceAlpha" />
                                    <feGaussianBlur stdDeviation="2.5" result="blur" />
                                    <feFlood flood-color="#0000dc" />
                                    <feComposite operator="in" in2="blur" />
                                </filter>
                                <filter id="Path_563" x="0" y="121.926" width="40.045" height="101.464" filterUnits="userSpaceOnUse">
                                    <feOffset dy="3" input="SourceAlpha" />
                                    <feGaussianBlur stdDeviation="5" result="blur-2" />
                                    <feFlood flood-color="#002bff" />
                                    <feComposite operator="in" in2="blur-2" />
                                    <feComposite in="SourceGraphic" />
                                </filter>
                            </defs>
                            <g transform="matrix(1, 0, 0, 1, 0, 0)" filter="url(#Rectangle_240)">
                                <rect id="Rectangle_240-2" data-name="Rectangle 240" width="12" height="23" transform="translate(123.6 155.89)" fill="#fff" />
                            </g>
                            <path id="Path_564" data-name="Path 564" d="M-154.06-5008.577H57.618L75-4987.239H87.706l43.241,54.884-207.4.33Zm1-117.043,77.607-76.552,207.4.331L88.706-5146.96H76l-17.381,21.339Z" transform="translate(403.989 5236.888)" fill="#110d40" />
                            <g id="Group_551" data-name="Group 551" transform="translate(-290.396 -370.109)">
                                <g transform="matrix(1, 0, 0, 1, 290.4, 370.11)" filter="url(#Path_563)">
                                    <g id="Path_563-2" data-name="Path 563" transform="translate(183 5387.93)" fill="none">
                                        <path d="M-168-5182.536v-12.33h10.045v12.33Zm0-59.133V-5254h10.045v12.331Z" stroke="none" />
                                        <path d="M -158.9553680419922 -5183.53564453125 L -158.9553680419922 -5193.86572265625 L -167.0003051757812 -5193.86572265625 L -167.0003051757812 -5183.53564453125 L -158.9553680419922 -5183.53564453125 M -158.9553680419922 -5242.6689453125 L -158.9553680419922 -5253 L -167.0003051757812 -5253 L -167.0003051757812 -5242.6689453125 L -158.9553680419922 -5242.6689453125 M -157.9553680419922 -5182.53564453125 L -168.0003051757812 -5182.53564453125 L -168.0003051757812 -5194.86572265625 L -157.9553680419922 -5194.86572265625 L -157.9553680419922 -5182.53564453125 Z M -157.9553680419922 -5241.6689453125 L -168.0003051757812 -5241.6689453125 L -168.0003051757812 -5254 L -157.9553680419922 -5254 L -157.9553680419922 -5241.6689453125 Z" stroke="none" fill="#20f" />
                                    </g>
                                </g>
                                <path id="Triangle_End" data-name="Triangle End" d="M300.282-552.3l-6.8-5,6.8-5Z" transform="translate(1 1097)" fill="#fff" />
                            </g>
                            <rect id="Rectangle_237" data-name="Rectangle 237" width="270" height="12" transform="translate(208.604 163.891)" fill="#110d40" />
                            <g id="Small_Circles_-_Side" data-name="Small Circles - Side" transform="translate(-290.396 -318.109)">
                                <g id="Group_549" data-name="Group 549">
                                    <circle id="Ellipse_52" data-name="Ellipse 52" cx="2" cy="2" r="2" transform="translate(744 512)" fill="#0000dc" />
                                    <circle id="Ellipse_57" data-name="Ellipse 57" cx="2" cy="2" r="2" transform="translate(744 460)" fill="#0000dc" />
                                </g>
                                <g id="Group_548" data-name="Group 548">
                                    <circle id="Ellipse_53" data-name="Ellipse 53" cx="2" cy="2" r="2" transform="translate(754 512)" fill="#fff" />
                                    <circle id="Ellipse_56" data-name="Ellipse 56" cx="2" cy="2" r="2" transform="translate(754 460)" fill="#fff" />
                                </g>
                                <g id="Group_547" data-name="Group 547">
                                    <circle id="Ellipse_54" data-name="Ellipse 54" cx="2" cy="2" r="2" transform="translate(764 512)" fill="#fff" />
                                    <circle id="Ellipse_55" data-name="Ellipse 55" cx="2" cy="2" r="2" transform="translate(764 460)" fill="#fff" />
                                </g>
                            </g>
                            <g id="Group_550" data-name="Group 550" transform="translate(-290.396 -370.109)">
                                <path id="Path_560" data-name="Path 560" d="M52.079-4914.422-30.389-4992.9l-5.626.574-8.795-8.935h-13.1l-10.227-8.868H-73.4l-5.058,5.979h-81.973l-7.566-8.158H-48.176l19.68,18.339,80.762,77.724h262.5v1.828ZM-167-5156.109l7.565-8.159h81.974l5.058,5.979h5.268l10.228-8.869h13.1l8.795-8.935,5.626.575L53.078-5254H315.764v1.829H53.265l-80.76,77.723-19.68,18.34Z" transform="translate(553 5624.109)" fill="#0000dc" />
                            </g>
                            <path id="Path_568" data-name="Path 568" d="M18.433,0H154.371l20.42-18.182L430-18" transform="translate(14.104 161.391)" fill="none" stroke="#707070" stroke-width="1" />
                            <path id="Path_569" data-name="Path 569" d="M18.433-18.182H154.371L174.791,0,430-.182" transform="translate(14.104 196.391)" fill="none" stroke="#707070" stroke-width="1" />
                            <line id="Line_37" data-name="Line 37" x2="12" transform="translate(14.104 161.391)" fill="none" stroke="#707070" stroke-width="1" />
                            <line id="Line_38" data-name="Line 38" x2="12" transform="translate(14.104 178.209)" fill="none" stroke="#707070" stroke-width="1" />
                        </svg>
                        <div id="ErraticBottom">
                            <svg xmlns="http://www.w3.org/2000/svg" width="82.169" height="8.489" viewBox="0 0 82.169 8.489">
                                <path id="Path_550" data-name="Path 550" d="M8.361-.253,71.808-.647l9.361,8.489H-1Z" transform="translate(1 0.647)" fill="#0000dc" />
                            </svg>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    )
}

export default LoadScreen

LoadScreen.defaultProps = {

}