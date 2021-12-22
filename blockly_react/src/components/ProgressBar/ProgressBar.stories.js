import React from 'react';

import ProgressBar from './';

export default {
    title: 'Production/ProgressBar',
    component: ProgressBar,
}

//Defining a template for ease
const Template = (args) => <ProgressBar {...args}/>

export const Default = Template.bind({});