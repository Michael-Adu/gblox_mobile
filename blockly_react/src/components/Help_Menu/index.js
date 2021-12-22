import React from 'react'
import PropTypes from 'prop-types'
import './Help_Menu.scss'
import Menu from '../Menu'
import svg_dictionary from '../svg_dictionary'

function help_div(svg, text, onClick) {
    svg = [svg[0]];
    svg.push(<div>{text}</div>);
    return (
        <div className="help-icon">
            <svg className="border_svg" xmlns="http://www.w3.org/2000/svg" width="354" height="220" viewBox="0 0 354 220">
                <g id="Path_330" data-name="Path 330" fill="#0b0533">
                    <path d="M 333.5235595703125 219.5 L 0.5 219.5 L 0.5 23.23928833007812 L 18.92333793640137 0.5 L 353.5 0.5 L 353.5 198.0667419433594 L 333.5235595703125 219.5 Z" stroke="none" />
                    <path id="border-stroke" d="M 19.1617431640625 1 L 1 23.41639709472656 L 1 219 L 333.3060607910156 219 L 353 197.8698425292969 L 353 1 L 19.1617431640625 1 M 18.68490600585938 0 L 354 0 L 354 198.2636413574219 L 333.7410583496094 220 L 0 220 L 0 23.0621337890625 L 18.68490600585938 0 Z" stroke="none" />
                </g>
            </svg>
            <div className="children_help" onClick={onClick}>
                {svg}
            </div>
        </div>
    )
};
function openMail(){
    window.open(`mailto:?subject=Issue with gBlox&body=`)
}
function Help_Menu(props) {
    const { name, children, ...rest } = props;
    return (
        <Menu>
            <div className="help-menu">
                <div className="text">Help</div>
                <div className="Help-Buttons">
                    {help_div(svg_dictionary.help_buttons.learn, "Learn","")}
                    {help_div(svg_dictionary.help_buttons.support, "Support",props.contactSupportViaMail)}
                    {help_div(svg_dictionary.help_buttons.update, "Check for Update")}
                </div>
            </div>
        </Menu>
    )
}

export default Help_Menu

