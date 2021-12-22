import React, { useRef } from 'react'
import PropTypes from 'prop-types'
import './Toolbox.scss'
import Button from '../Button'


function Toolbox(props) {
    const { children } = props;
    return (
        <div id="Toolbox">
            <div className="i-Buttons">{children}</div>
        </div>
    )
}

Toolbox.propTypes = {

}

export default Toolbox

