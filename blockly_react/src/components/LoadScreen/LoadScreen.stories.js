import React from 'react';

import LoadScreen from './';

export default {
    title: 'Production/LoadScreen',
    component: LoadScreen,
}

//Defining a template for ease
const Template = (args) => <LoadScreen {...args}/>

export const Default = Template.bind({});