import React from 'react'
import PropTypes from 'prop-types'
import ToolSelector from './ToolSelector'
import Button from '../Button'

export default {
    title: 'Production/ToolSelector',
    component: ToolSelector
}


//Defining a template for ease
const Template = (args) => <ToolSelector {...args}/>

export const FirstTry = Template.bind({});
