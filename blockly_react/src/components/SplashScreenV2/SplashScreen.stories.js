import React from 'react';

import SplashScreenV2 from '.';

export default {
    title: 'Production/SplashScreenV2',
    component: SplashScreenV2,
}

//Defining a template for ease
const Template = (args) => <SplashScreenV2 {...args}/>

export const Default = Template.bind({});