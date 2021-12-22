import React from 'react';

import Body from './Body';

export default {
    title: 'Production/Body',
    component: Body,
}

//Defining a template for ease
const Template = (args) => <Body {...args}/>

export const FirstTry = Template.bind({});
