import React from 'react'
import PropTypes from 'prop-types'
import FrameBar from './'


function FrameBar_component() {
    return (
        <FrameBar/>
    )
}

export default {
    title: 'Production/FrameBar',
    component: FrameBar_component
}

export const FrameBar_Default = () => FrameBar_component();

