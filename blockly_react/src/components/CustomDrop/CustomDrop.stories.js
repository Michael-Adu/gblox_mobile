import React from 'react';

import CustomDrop from './';

export default {
    title: 'Production/CustomDrop',
    component: CustomDrop,
}

//Defining a template for ease
const Template = (args) => <CustomDrop {...args}/>

export const FirstTry = Template.bind({});
FirstTry.args = {
    buttonType: "SettingsHeaderButton",
    contentButtonType: "LanguageContentButton",
    list: ["Hello", "World"],
    funcsOnClick: [() => { console.log("Hello") }, () => { console.log("World") }],
    dropType: "modal",
    modal: "SettingsModal",
}
