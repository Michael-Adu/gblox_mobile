import React from 'react';

import TitleBar from './';

export default {
    title: 'Production/TitleBar',
    component: TitleBar,
}

//Defining a template for ease
const Template = (args) => <TitleBar {...args}/>

export const TitleBar_Default = Template.bind({});
