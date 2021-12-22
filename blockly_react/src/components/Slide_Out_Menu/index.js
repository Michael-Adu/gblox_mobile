import React from 'react'
import { useState, useEffect, useRef } from 'react'
import './Slide_Out_Menu.scss'

function Index(props) {
    const { name, children, ...rest } = props;
    var slide_out = props.ref;
    return (
        <div id={name} id={`sidebar-nav`} ref={props.ref}>
            <div className="initial-text">Select Your Device</div>
            {children}
        </div>
    )
}

export default Index
