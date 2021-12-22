import React from 'react'
import PropTypes from 'prop-types'
import './Menu.scss'

function Menu(props) {
    const {name, children, ...rest } = props;
    return (
        <div className="menu" >
            {children}
        </div>
    )
}

export default Menu
