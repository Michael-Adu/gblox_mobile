import React from 'react';
import { useState, useEffect } from 'react'
import Upload_Circle from './'
import './Upload_Circle.scss'

function Upload_Circle_Component() {
    return (
        <div>
        <Upload_Circle>
        </Upload_Circle>
        </div>
    )
}

export default {
    title: 'Upload Circle',
    component: Upload_Circle
}

export const Upload_Circle_Test = () => Upload_Circle_Component();