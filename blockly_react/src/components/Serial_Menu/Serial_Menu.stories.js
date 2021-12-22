import React from 'react'
import Serial_Menu from '.'

function Serial_Component() {
    return (
        <Serial_Menu/>
    )
}
export default {
    title: 'Serial Menu',
    component: Serial_Menu
}

export const Serial_Default= () => Serial_Component();
