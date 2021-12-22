import React from 'react';
import { useState, useEffect } from 'react'
import VariableSelector from '.'

function Dialog_Component() {
    return (
        <VariableSelector name="Variable-Selector">
        </VariableSelector>
    )
}

export default {
    title: "VariableSelector",
    component: VariableSelector
}


export const Variable_Dialog = () => Dialog_Component()
