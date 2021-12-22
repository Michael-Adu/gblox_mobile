import React from 'react';

import HeaderButton from './HeaderButton';

export default {
    title: 'Production/HeaderButton',
    component: HeaderButton,
}

//Defining a template for ease
const Template = (args) => <HeaderButton {...args}/>

export const FirstTry = Template.bind({});
