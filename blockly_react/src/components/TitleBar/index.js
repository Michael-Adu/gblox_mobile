import React, { useState, useEffect } from 'react'
import Button from "../Button"
import "./TitleBar.scss"


function index() {
    return (
        <div id="title-bar">
            
            <div id="title-background"/>
            <div id="title-name">gBlox</div>
            <Button
            id="minimize"
            type= "TitleButton"
            children="-"
            />
        </div>
    )
}

export default index
