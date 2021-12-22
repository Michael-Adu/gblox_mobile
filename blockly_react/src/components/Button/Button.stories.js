import React from 'react';

import Button from './';

export default {
    title: 'Production/Button',
    component: Button,
}

//Defining a template for ease
const Template = (args) => <Button {...args} />

export const Default = Template.bind({});

export const SettingsColor = Template.bind({})
SettingsColor.args = {
    type: "SettingsColor",
    inColor: "#0000bc",
    outColor: "#FAC",
    hoverColor: "#0000bc",
    s_ButtonState: "Out",
    text: "Insert Text Here",
    hoverEffect: "border"
}

export const SettingsButton = Template.bind({})
SettingsButton.args = {
    type: "SettingsButton",
    inColor: "#0000bc",
    outColor: "#FAC",
    hoverColor: "#0000bc",
    s_ButtonState: "Out",
    text: "Insert Text Here",
    hoverEffect: "fill"
}

export const SettingsXButton = Template.bind({})
SettingsXButton.args = {
    type: "SettingsXButton",
    inColor: "#0000bc",
    outColor: "#FAC",
    hoverColor: "#0000bc",
    s_ButtonState: "Out",
    text: "Insert Text Here",
    hoverEffect: "fill"
}

export const LanguageMenuButton = Template.bind({})
LanguageMenuButton.args = {
    type: "LanguageMenuButton",
    inColor: "#0000bc",
    outColor: "#0b0533",
    hoverColor: "#0000bc",
    s_ButtonState: "Out",
    text: "Insert Text Here",
    hoverEffect: "fill"
}

export const LanguageContentButton = Template.bind({})
LanguageContentButton.args = {
    type: "LanguageContentButton",
    inColor: "#0000aa",
    outColor: "#0000bc",
    hoverColor: "#0000aa",
    s_ButtonState: "Out",
    text: "Insert Text Here",
    hoverEffect: "fill"
}

export const SettingsHeaderButton = Template.bind({})
SettingsHeaderButton.args = {
    type: "SettingsHeaderButton",
    inColor: "#0000aa",
    outColor: "#0000bc",
    hoverColor: "#0000aa",
    s_ButtonState: "Out",
    text: "Insert Text Here",
    hoverEffect: "fill"
}

export const WorkspaceTabButton = Template.bind({})
WorkspaceTabButton.args = {
    type: "WorkspaceTabButton",
    inColor: "#060841",
    outColor: "#0B0533",
    hoverColor: "#0000FF",
    s_ButtonState: "Out",
    text: "Workspace 1",
    hoverEffect: "fill"
}

export const CircularOverlayMenuButton_ViewCode = Template.bind({})
CircularOverlayMenuButton_ViewCode.args = {
    type: "CircularOverlayMenuButton",
    inColor: "#060841",
    outColor: "#060841",
    hoverColor: "#0000FF",
    s_ButtonState: "Out",
    children: [
        <svg xmlns="http://www.w3.org/2000/svg" width="32.18" height="22.266" viewBox="0 0 32.18 22.266">
            <g id="Group_457" data-name="Group 457" transform="translate(1.414 0.191)">
                <path id="Path_2" data-name="Path 2" d="M1856.659,371.3,1849,378.955l7.687,7.687" transform="translate(-1849 -367.739)" fill="none" stroke="#e9e9ff" stroke-miterlimit="10" stroke-width="2" />
                <path id="Path_3" data-name="Path 3" d="M1876.027,371.3l7.659,7.659L1876,386.642" transform="translate(-1854.335 -367.739)" fill="none" stroke="#e9e9ff" stroke-miterlimit="10" stroke-width="2" />
                <line id="Line_1" data-name="Line 1" x1="4.264" y2="21.884" transform="translate(13.129)" fill="none" stroke="#e9e9ff" stroke-miterlimit="10" stroke-width="2" />
            </g>
        </svg>
    ],
    hoverEffect: "fill"
}

export const CircularOverlayMenuButton_ExampleCodes = Template.bind({})
CircularOverlayMenuButton_ExampleCodes.args = {
    type: "CircularOverlayMenuButton",
    inColor: "#060841",
    outColor: "#060841",
    hoverColor: "#0000FF",
    s_ButtonState: "Out",
    children: [
        <svg xmlns="http://www.w3.org/2000/svg" width="29.172" height="20.077" viewBox="0 0 29.172 20.077">
            <g id="Group_434" data-name="Group 434" transform="translate(-1596.705 -230.374)">
                <path id="Path_317" data-name="Path 317" d="M78.751,357.47H60.463l-.98.914H56l-.7-.914H51.58V352H55.3l.7.91h3.482l.98-.91H78.751Z" transform="translate(1546.126 -120.626)" fill="none" stroke="#fff" stroke-width="2" />
                <path id="Path_319" data-name="Path 319" d="M78.751,357.47H60.463l-.98.914H56l-.7-.914H51.58V352H55.3l.7.91h3.482l.98-.91H78.751Z" transform="translate(1546.126 -108.933)" fill="none" stroke="#fff" stroke-width="2" />
                <path id="Path_318" data-name="Path 318" d="M69.189,357.47H60.463l-.98.914H56l-.7-.914H51.58V352H55.3l.7.91h3.482l.98-.91h8.726Z" transform="translate(1546.126 -114.779)" fill="none" stroke="#fff" stroke-width="2" />
            </g>
        </svg>

    ],
    hoverEffect: "fill"
}

export const WorkspaceControlButton_ZoomIn = Template.bind({})
WorkspaceControlButton_ZoomIn.args = {
    type: "WorkspaceControlButton",
    inColor: "#E9E9FF",
    outColor: "#E9E9FF",
    hoverColor: "#0000FF",
    s_ButtonState: "Out",
    children: [
        <svg xmlns="http://www.w3.org/2000/svg" width="16.745" height="16.745" viewBox="0 0 16.745 16.745">
            <rect id="Rectangle_6" data-name="Rectangle 6" width="16.745" height="2.155" transform="translate(0 7.295)" />
            <rect id="Rectangle_7" data-name="Rectangle 7" width="2.155" height="16.745" transform="translate(7.295)" />
        </svg>
    ],
    hoverEffect: "svg-fill"
}

export const WorkspaceControlButton_ZoomOut = Template.bind({})
WorkspaceControlButton_ZoomOut.args = {
    type: "WorkspaceControlButton",
    inColor: "#060841",
    outColor: "#E9E9FF",
    hoverColor: "#0000FF",
    s_ButtonState: "Out",
    children: [
        <svg xmlns="http://www.w3.org/2000/svg" width="16.745" height="2.232" viewBox="0 0 16.745 2.232">
            <rect id="Rectangle_8" data-name="Rectangle 8" width="16.745" height="2.232" />
        </svg>
    ],
    hoverEffect: "svg-fill"
}

export const WorkspaceControlButton_Previous = Template.bind({})
WorkspaceControlButton_Previous.args = {
    type: "WorkspaceControlButton_Previous",
    inColor: "#E9E9FF",
    outColor: "#E9E9FF",
    hoverColor: "#0000FF",
    s_ButtonState: "Out",
    hoverEffect: "svg-fill"
}

export const WorkspaceControlButton_After = Template.bind({})
WorkspaceControlButton_After.args = {
    type: "WorkspaceControlButton_After",
    inColor: "#060841",
    outColor: "#E9E9FF",
    hoverColor: "#0000FF",
    s_ButtonState: "Out",
    hoverEffect: "svg-fill"
}

export const UploadButton = Template.bind({})
UploadButton.args = {
    type: "UploadButton",
    inColor: "#060841",
    outColor: "#0000FF",
    hoverColor: "#0000dc",
    s_ButtonState: "Out",
    text: "Upload",
    hoverEffect: "svg-fill"
}

export const ToolboxCategoryButton_Loop = Template.bind({})
ToolboxCategoryButton_Loop.args = {
    type: "ToolboxCategoryButton",
    inColor: "#060841",
    outColor: "#0000FF",
    hoverColor: "#0000dc",
    s_ButtonState: "Out",
    children: [
        <svg xmlns="http://www.w3.org/2000/svg" width="21.961" height="25.013" viewBox="0 0 21.961 25.013">
            <path id="Path_264" data-name="Path 264" d="M0,8.478V0H18.475" transform="translate(20.547 20.365) rotate(180)" fill="none" stroke="#fff" stroke-width="2" />
            <path id="Path_265" data-name="Path 265" d="M-20.935,1250.045v-8.478H-2.46" transform="translate(22.349 -1236.919)" fill="none" stroke="#fff" stroke-width="2" />
            <path id="Path_263" data-name="Path 263" d="M0,0H5.573V5.573" transform="translate(5.355 24.306) rotate(-135)" fill="none" stroke="#fff" stroke-width="2" />
            <path id="Path_266" data-name="Path 266" d="M0,0H5.573V5.573" transform="translate(16.606 0.707) rotate(45)" fill="none" stroke="#fff" stroke-width="2" />
        </svg>
    ],
    text: "Loop",
    hoverEffect: "fill"
}

export const ToolboxCategoryButton_Logic = Template.bind({})
ToolboxCategoryButton_Logic.args = {
    type: "ToolboxCategoryButton",
    inColor: "#060841",
    outColor: "#4C97FF",
    hoverColor: "#0000dc",
    s_ButtonState: "Out",
    children: [
        <svg xmlns="http://www.w3.org/2000/svg" width="24.041" height="20" viewBox="0 0 24.041 20">
            <g id="Path_270" data-name="Path 270" fill="none">
                <path d="M0,20H20V14.088l4.041,1.158V6.326L20,7.075V0H10.492l1.43,3.466h-4.9L8.653,0H0Z" stroke="none" />
                <path d="M 17.99999618530273 18 L 17.99999618530273 11.4343900680542 L 22.04141616821289 12.59189128875732 L 22.04141616821289 8.730239868164062 L 17.99999618530273 9.479229927062988 L 17.99999618530273 2 L 13.48047924041748 2 L 14.91034603118896 5.465819835662842 L 3.865156173706055 5.465819835662842 L 5.499288558959961 2 L 1.999996185302734 2 L 1.999996185302734 18 L 17.99999618530273 18 M 19.99999618530273 20 L -3.823241968348157e-06 20 L -3.823241968348157e-06 0 L 8.653446197509766 0 L 7.01931619644165 3.465820074081421 L 11.92169570922852 3.465820074081421 L 10.49182605743408 0 L 19.99999618530273 0 L 19.99999618530273 7.074520111083984 L 24.04141616821289 6.325530052185059 L 24.04141616821289 15.24512004852295 L 19.99999618530273 14.08761978149414 L 19.99999618530273 20 Z" stroke="none" fill="#fff" />
            </g>
        </svg>

    ],
    text: "Logic",
    hoverEffect: "fill"
}

export const ToolboxLevelButton = Template.bind({})
ToolboxLevelButton.args = {
    type: "ToolboxLevelButton",
    inColor: "#060841",
    outColor: "#060841",
    hoverColor: "#0000DC",
    s_ButtonState: "Out",
    text: "1",
    hoverEffect: "fill"
}

export const FilterButton = Template.bind({})
FilterButton.args = {
    type: "FilterButton",
    inColor: "#0000aa",
    outColor: "#0000bc",
    hoverColor: "#0000aa",
    s_ButtonState: "Out",
    text: "Filter",
    hoverEffect: "fill"
}

export const DeviceAddButton = Template.bind({})
DeviceAddButton.args = {
    type: "DeviceAddButton",
    inColor: "#0000aa",
    outColor: "#0000bc",
    hoverColor: "#0000aa",
    s_ButtonState: "Out",
    text: "Filter",
    hoverEffect: "fill"
}

export const CloseWindow = Template.bind({})
CloseWindow.args = {
    type: "FrameBarButton",
    children: [<svg xmlns="http://www.w3.org/2000/svg" width="16.598" height="17.619" viewBox="0 0 16.598 17.619">
    <g id="Group_540" data-name="Group 540" transform="translate(0.604 0.21)">
      <line id="Line_34" data-name="Line 34" x2="15" y2="16" transform="translate(0.126 0.474)" fill="none" stroke="#fff" stroke-width="2"/>
      <line id="Line_35" data-name="Line 35" x1="15.087" y2="16.239" transform="translate(0.175 0.49)" fill="none" stroke="#fff" stroke-width="2"/>
    </g>
  </svg>
  ]
}