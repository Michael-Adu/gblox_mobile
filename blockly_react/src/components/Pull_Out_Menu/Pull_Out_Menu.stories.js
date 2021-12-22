import React from 'react'
import Pull_Out_Menu from './'

function Pull_Out_Menu_Component() {
    return (
        <div>
            <Pull_Out_Menu/>
        </div>
    )
}

export default {
    title: 'Pull Out Menu',
    component: Pull_Out_Menu_Component,
}
export const Pull_Out_Menu_Default = () => Pull_Out_Menu_Component();