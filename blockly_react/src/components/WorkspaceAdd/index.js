import React, { useEffect, useState, useRef } from 'react';
import PropTypes from "prop-types"

import "./WorkspaceAdd.scss"

const WorkspaceAdd = (props) => {
    return (
        <div className="c-WorkspaceAdd-a-Container" onClick={props.onClick}>
            <svg xmlns="http://www.w3.org/2000/svg" width="80" height="36" viewBox="0 0 80 36">
                <path id="Path_453" data-name="Path 453" d="M29.595,0h21.04L80,36H0Z" />
            </svg>
            <div className="c-WorkspaceAdd-a-Plus">
                +
            </div>
        </div >
    )
}

export default WorkspaceAdd

WorkspaceAdd.defaultProps = {
    text: "Hello World",
}

WorkspaceAdd.propTypes = {
    text: PropTypes.string,
}


