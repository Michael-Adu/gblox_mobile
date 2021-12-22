import React from 'react';

import WorkspaceAdd from '.';

export default {
    title: 'Production/WorkspaceAdd',
    component: WorkspaceAdd,
}

//Defining a template for ease
const Template = (args) => <WorkspaceAdd {...args}/>

export const Default = Template.bind({});