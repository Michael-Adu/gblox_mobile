import React from 'react';

import SplashScreen from './';

export default {
    title: 'Production/SplashScreen',
    component: SplashScreen,
}

//Defining a template for ease
const Template = (args) => <SplashScreen {...args}/>

export const Default = Template.bind({});