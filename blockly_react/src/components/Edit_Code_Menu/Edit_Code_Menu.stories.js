import React from 'react'
import Edit_Code_Menu from '.'

function Edit_Code_Menu_Component() {
    return (
        <Edit_Code_Menu/>
    )
}
export default {
    title: 'Edit Code Menu',
    component: Edit_Code_Menu
}

export const Edit_Code_Default= () => Edit_Code_Menu_Component();
