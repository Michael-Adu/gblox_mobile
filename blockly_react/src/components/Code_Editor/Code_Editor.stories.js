import React from 'react'
import Code_Editor from '.'

function Code_Editor_Component() {
    return (
        <Code_Editor/>
    )
}
export default {
    title: 'Production/Code_Editor',
    component: Code_Editor
}

export const Code_Editor_Default= () => Code_Editor_Component();
