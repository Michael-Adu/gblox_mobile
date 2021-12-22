import React from 'react';

import WorkspaceTab from './';

export default {
    title: 'Production/WorkspaceTab',
    component: WorkspaceTab,
}

//Defining a template for ease
const Template = (args) => <WorkspaceTab {...args}/>

export const Default = Template.bind({});