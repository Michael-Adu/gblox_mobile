import React from 'react'
import WorkspaceDiv from './WorkspaceDiv'

function WorkspaceDiv_component() {
    return (
        <WorkspaceDiv/>
    )
}

export default{
    title: 'Workspace',
    component: WorkspaceDiv_component,
} 

export const Workspace_Div = () => WorkspaceDiv_component();
