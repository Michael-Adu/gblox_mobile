import React from 'react';

import ModalSettings from './';

export default {
    title: 'Production/ModalSettings',
    component: ModalSettings,
}

//Defining a template for ease
const Template = (args) => <ModalSettings {...args}/>

export const Default = Template.bind({});