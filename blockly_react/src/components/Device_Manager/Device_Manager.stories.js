import React from 'react'
import Device_Manager from '.'

function Device_Manager_Component() {
    return (
        <Device_Manager/>
    )
}

export default {
    title: "Production/Device Manager",
    component: Device_Manager_Component,
}

export const Device_Manager_Default = () => Device_Manager_Component();
