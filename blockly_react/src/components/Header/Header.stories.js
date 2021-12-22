import React from 'react';

import Header from './Header';

export default {
    title: 'Production/Header',
    component: Header,
}

//Defining a template for ease
const Template = (args) => <Header {...args}/>

export const FirstTry = Template.bind({});
