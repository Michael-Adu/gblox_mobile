import React, { useState, useEffect, useContext } from 'react';
import SyntaxHighlighter from 'react-syntax-highlighter';
import { hybrid } from 'react-syntax-highlighter/dist/esm/styles/hljs';
import PropTypes from 'prop-types'

import Menu from '../Menu'
import './View_Code_Menu.scss'
import { Ctxt_SingletonManager } from '../contexts/Ctxt_SingletonManager';

function Index(props) {
    const {deviceCode} = useContext(Ctxt_SingletonManager)
    //const [viewCode, setViewCode] = useState("")
    return (
        <Menu>
            <div id="view-code-menu">
                <div className="text">View Code</div>
                <div className="code-viewer">
                    <SyntaxHighlighter
                        language="arduino"
                        style={hybrid}
                        showLineNumbers={true}>
                        {deviceCode}
                    </SyntaxHighlighter>
                </div>
            </div>
        </Menu>
    )
}

Index.propTypes = {

}

export default Index