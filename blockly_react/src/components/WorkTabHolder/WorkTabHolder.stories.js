import React from 'react';

import WorkTabHolder from './';

export default {
    title: 'Production/WorkTabHolder',
    component: WorkTabHolder,
}

//Defining a template for ease
const Template = (args) => <WorkTabHolder {...args}/>

export const Default = Template.bind({});   