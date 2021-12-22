import React from 'react'
import View_Code_Menu from '.'

function View_Code_Menu_Component() {
    return (
        <View_Code_Menu/>
    )
}
export default {
    title: 'View Code Menu',
    component: View_Code_Menu
}

export const View_Code_Default= () => View_Code_Menu_Component();
