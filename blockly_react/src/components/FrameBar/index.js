import React, { useState, useEffect, useContext } from 'react';
import PropTypes from 'prop-types';
import svg_dictionary from '../svg_dictionary'
import {Ctxt_SingletonManager} from '../contexts/Ctxt_SingletonManager'
import Button from '../Button'
import "./FrameBar.scss"

function Index(props) {
    const [windowIcon, setWindowIcon] = useState([<Button
        id="MaximizeWindowButton"
        type="FrameBarButton"
        children={svg_dictionary.window_button.maximize}
    />])
    const {
        windowMax,
        electronWindowControl
    } = useContext(Ctxt_SingletonManager)

    useEffect(() => {
        if (windowMax == false) {
            setWindowIcon([<Button
                id="MaximizeWindowButton"
                type="FrameBarButton"
                children={svg_dictionary.window_button.maximize}
                onClick={electronWindowControl}
            />])
        }
        else{
            setWindowIcon([<Button
                id="RestoreWindowButton"
                type="FrameBarButton"
                children={svg_dictionary.window_button.restore}
                onClick={electronWindowControl}
            />])
        }
    }, [windowMax])
    return (
        <div className="framebar">
            <div className="framebar-background"></div>
            <div className="framebar-buttons">
                <Button
                    id="MinimizeWindowButton"
                    type="FrameBarButton"
                    children={svg_dictionary.window_button.minimize}
                    onClick={electronWindowControl}
                />
                {windowIcon}
                <Button
                    id="CloseWindowButton"
                    type="FrameBarButton"
                    children={svg_dictionary.window_button.close}
                    onClick={electronWindowControl}
                />
            </div>
        </div>
    )
}

export default Index