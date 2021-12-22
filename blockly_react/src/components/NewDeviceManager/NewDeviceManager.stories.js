import React from 'react'
import NewDeviceManager from '.'

function NewDeviceManager_Component() {
    return (
        <NewDeviceManager/>
    )
}

export default {
    title: "Production/New Device Manager",
    component: NewDeviceManager_Component,
}

export const NewDeviceManager_Default = () => NewDeviceManager_Component();
