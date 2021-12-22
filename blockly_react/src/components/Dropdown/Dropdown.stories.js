import React from 'react';

import Dropdown from './Dropdown';

export default {
    title: 'Production/Dropdown',
    component: Dropdown,
}

//Defining a template for ease
const Template = (args) => <Dropdown {...args}/>

export const FirstTry = Template.bind({});
