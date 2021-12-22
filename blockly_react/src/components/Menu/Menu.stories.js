import React from 'react'
import Menu from '.'

function Menu_Component() {
    return (
        <Menu/>
    )
}
export default {
    title: 'Menu',
    component: Menu_Component
}

export const Menu_Default= () => Menu_Component();
