import React from 'react';

import TestMain from './';

export default {
    title: 'Production/TestMain',
    component: TestMain,
}

//Defining a template for ease
const Template = (args) => <TestMain {...args}/>

export const Default = Template.bind({});