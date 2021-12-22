import React from 'react';

import Alert_Notification from './';

export default {
    title: 'Production/Alert_Notification',
    component: Alert_Notification
}

//Defining a template for ease
const Template = (args) => <Alert_Notification {...args}/>

export const Alert = Template.bind({})
Alert.args = {
    type:"alert",
    text: "Upload In Progress"
}

export const Notification = Template.bind({})
Notification.args = {
    type:"notification",
    text: "Upload In Progress"
}