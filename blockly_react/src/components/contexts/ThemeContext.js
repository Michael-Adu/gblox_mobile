import { createContext, useState, useEffect, useContext } from "react";
import Blockly from "blockly";

export const ThemeContext = createContext();
const block_styles = {
    "logic_blocks": {
        "colourPrimary": "#4C97FF",
        "colourSecondary": "#FFFFFF",
        "colourTertiary": "#FFFFFF"
    },
    "loop_blocks": {
        "colourPrimary": "#DD0A18",
        "colourSecondary": "#FFFFFF",
        "colourTertiary": "#FFFFFF"
    },
    "text_blocks": {
        "colourPrimary": "#16CE9C",
        "colourSecondary": "#FFFFFF",
        "colourTertiary": "#FFFFFF"
    },
    "math_blocks": {
        "colourPrimary": "#8D00E8",
        "colourSecondary": "#FFFFFF",
        "colourTertiary": "#FFFFFF"
    },
    "actuator_blocks": {
        "colourPrimary": "#FE8013",
        "colourSecondary": "#FFFFFF",
        "colourTertiary": "#FFFFFF"
    },
    "sensor_blocks": {
        "colourPrimary": "#40BF4A",
        "colourSecondary": "#FFFFFF",
        "colourTertiary": "#FFFFFF"
    },
    "communication_blocks": {
        "colourPrimary": "#D51CD5",
        "colourSecondary": "#FFFFFF",
        "colourTertiary": "#FFFFFF"
    },
    "led_blocks": {
        "colourPrimary": "#EFCA0F",
        "colourSecondary": "#FFFFFF",
        "colourTertiary": "#FFFFFF"
    },
    "sound_blocks": {
        "colourPrimary": "#FA857B",
        "colourSecondary": "#FFFFFF",
        "colourTertiary": "#FFFFFF"
    },
    "variable_blocks": {
        "colourPrimary": "#878787",
        "colourSecondary": "#FFFFFF",
        "colourTertiary": "#FFFFFF"
    },
    "digital_blocks":{
        "colourPrimary": "#1F5D00",
        "colourSecondary": "#FFFFFF",
        "colourTertiary": "#FFFFFF"
    },
    "analog_blocks":{
        "colourPrimary": "#FF00BB",
        "colourSecondary": "#FFFFFF",
        "colourTertiary": "#FFFFFF"
    }

}
const font_styles = {
    "family": "Baloo2-Regular",
    "size": 14
}
const dark_component_styles = {
    "workspaceBackgroundColour": "#060841",
    "flyoutBackgroundColour": "#0B0533"
}

const light_component_styles = {
    "workspaceBackgroundColour": "#EFEFF2",
    "flyoutBackgroundColour": "#DEDEF1"
}
var dark_theme = Blockly.Theme.defineTheme('dark_theme', {
    'blockStyles': block_styles,
    'fontStyle': font_styles,
    'componentStyles': dark_component_styles,
    'startHats': true
});
var light_theme = Blockly.Theme.defineTheme('light_theme', {
    'blockStyles': block_styles,
    'fontStyle': font_styles,
    'componentStyles': light_component_styles,
    'startHats': true
});



const ThemeContextProvider = (props) => {
    const [current_theme, setCurrentTheme] = useState("dark-theme")
    const [currentThemeName, setCurrentThemeName] = useState("dark-theme")

    class Theme {
        primaryColor
        secondaryColor
        tetiaryColor
        borderColor
        innerShadowColor
        titleTextColor
        textColor
        logoColor
        progressEmptyBarColor
        progressFilledBarColor
        primaryButtonColor
        tabColor
        trashColor
        dropShadowStatus
        keyword_code_color
        operator_code_color
        builtin_code_color
        directive_hash_code
        directive_keyword_code
        punctuation_code_color
        function_code_color
        shortcut_text_color

        constructor(primary,
            secondary,
            tetiary,
            border,
            innerShadow,
            titleTextColor,
            textColor,
            logoColor,
            progressEmptyBarColor,
            progressFilledBarColor,
            primaryButtonColor,
            tabColor,
            trashColor,
            dropShadowStatus,
            keyword_code_color,
            operator_code_color,
            builtin_code_color,
            directive_hash_code,
            directive_keyword_code,
            punctuation_code_color,
            function_code_color,
            shortcut_text_color) {
            this.primaryColor = primary;
            this.secondaryColor = secondary;
            this.tetiaryColor = tetiary;
            this.borderColor = border;
            this.innerShadowColor = innerShadow
            this.titleTextColor = titleTextColor;
            this.textColor = textColor;
            this.logoColor = logoColor;
            this.progressEmptyBarColor = progressEmptyBarColor
            this.progressFilledBarColor = progressFilledBarColor;
            this.primaryButtonColor = primaryButtonColor;
            this.tabColor = tabColor
            this.trashColor = trashColor;
            this.dropShadowStatus = dropShadowStatus;
            this.keyword_code_color = keyword_code_color;
            this.operator_code_color = operator_code_color;
            this.builtin_code_color = builtin_code_color;
            this.directive_hash_code = directive_hash_code;
            this.directive_keyword_code = directive_keyword_code;
            this.punctuation_code_color = punctuation_code_color;
            this.function_code_color = function_code_color
            this.shortcut_text_color = shortcut_text_color
        }
    }

    var globalDarkTheme = new Theme(
        "#0B0533",  //primaryColor
        "#0000DC",  //secondaryColor
        "#060841",  //tetiaryColor
        "#0000DC",  //borderColor
        "#0713BF52",    //innerShadowColor
        "#4C97FF",  //titleTextColor
        "#FFFFFF",  //textColor
        "#FFFFFF",  //logoColor
        "#1C1E4D",  //progressEmptyBar
        "#E9E9FF",  //progressFilledBar
        "#FFFFFF",  //primaryButtonColor
        "#0B0533",   //tabColor
        "#E9E9FF",  //trashColor
        true,        //dropShadowStatus
        "rgba(255, 0, 0, 0.534)", //keyword_code_color
        "grey", //operator_code_color
        "plum", //builtin_code_color
        "goldenrod", //directive_hash_code
        "goldenrod", //directive_keyword_code
        "grey", //punctuation_code_color
        "rgb(205, 5, 255)", //function_code_color
        "#FFF8" //shortcut_text_color
    )
        ;
    var globalLightTheme = new Theme(
        "#DEDEF1",  //primaryColor
        "#0000DC",  //secondaryColor
        "#FFFFFF",  //tetiaryColor
        "#9898F0",  //borderColor
        "#BCBCEE",  //innerShadowColor
        "#0000DC",  //titleTextColor
        "#000092",  //textColor
        "#0000DC",  //logoColor
        "#BCBCEE",  //progressEmptyBar
        "#0000DC",  //progressFilledBar
        "#0000DC",  //primaryButtonColor
        "#DEDEF1",   //tabColor
        "#9898F0",  //trashColor
        false,       //dropShadowStatus
        "rgba(255, 0, 0, 0.534)", //keyword_code_color
        "grey", //operator_code_color
        "plum", //builtin_code_color
        "black", //directive_hash_code
        "black", //directive_keyword_code
        "grey", //punctuation_code_color
        "rgb(205, 5, 255)", //function_code_color
        "#0000dc"   //shortcut_text_color
    );

    function changeTheme(event) {
        if (event.target.id == "dark-theme") {
            setCurrentThemeName(event.target.id) 
        }
        else {
            setCurrentThemeName(event.target.id)
        }
    }

    useEffect(() => {
        if (current_theme !== null) {
            document.documentElement.style.setProperty('--primary-color', current_theme.primaryColor);
            document.documentElement.style.setProperty('--secondary-color', current_theme.secondaryColor);
            document.documentElement.style.setProperty('--tetiary-color', current_theme.tetiaryColor);
            document.documentElement.style.setProperty('--border-color', current_theme.borderColor);
            document.documentElement.style.setProperty('--logo-color', current_theme.logoColor);
            document.documentElement.style.setProperty('--inner-shadow-color', current_theme.innerShadowColor)
            document.documentElement.style.setProperty('--title-text-color', current_theme.titleTextColor);
            document.documentElement.style.setProperty('--text-color', current_theme.textColor)
            document.documentElement.style.setProperty('--logo-color', current_theme.logoColor);
            document.documentElement.style.setProperty('--progress-empty-bar-color', current_theme.progressEmptyBarColor);
            document.documentElement.style.setProperty('--progress-filled-bar-color', current_theme.progressFilledBarColor);
            document.documentElement.style.setProperty('--primary-button-color', current_theme.primaryButtonColor);
            document.documentElement.style.setProperty('--tab-color', current_theme.tabColor)
            document.documentElement.style.setProperty('--trash-color', current_theme.trashColor)
            // if (current_theme.dropShadowStatus == true) {
            //     // var bars = document.getElementsByClassName("i-FilledBar")
            //     document.getElementById("lid").style.filter = "drop-shadow(0 0 9px #3A00FF)"
            //     document.getElementById("bin").style.filter = "drop-shadow(0 0 9px #3A00FF)"
            //     var border_svgs = document.getElementsByClassName("workspace-control-bordersvg")
            //     for (var i = 0; i < border_svgs.length; i++) {
            //         border_svgs[i].style.filter = "drop-shadow(0 0 6px var(--secondary-color))"
            //     }
            //     // for (var i = 0; i < bars.length; i++) {
            //     //     bars[i].style.filter = "drop-shadow(0 0 6px var(--secondary-color))"
            //     // }
            // }
            // else {
            //     // var bars = document.getElementsByClassName("i-FilledBar")
            //     document.getElementById("lid").style.filter = "none"
            //     document.getElementById("bin").style.filter = "none"
            //     var border_svgs = document.getElementsByClassName("workspace-control-bordersvg")
            //     for (var i = 0; i < border_svgs.length; i++) {
            //         border_svgs[i].style.filter = "none"
            //     }
            //     // for (var i = 0; i < bars.length; i++) {
            //     //     bars[i].style.filter = "none"
            //     // }
            // }
            document.documentElement.style.setProperty('--keyword_code_color', current_theme.keyword_code_color);
            document.documentElement.style.setProperty('--operator_code_color', current_theme.operator_code_color);
            document.documentElement.style.setProperty('--builtin_code_color', current_theme.builtin_code_color);
            document.documentElement.style.setProperty('--directive_hash_code', current_theme.directive_hash_code);
            document.documentElement.style.setProperty('--directive_keyword_code', current_theme.directive_keyword_code);
            document.documentElement.style.setProperty('--punctuation_code_color', current_theme.punctuation_code_color);
            document.documentElement.style.setProperty('--function_code_color', current_theme.function_code_color);
            document.documentElement.style.setProperty('--shortcut_text_color', current_theme.shortcut_text_color);
        }

    }, [current_theme])
    useEffect(() => {
        if(currentThemeName == "dark-theme"){
            setCurrentTheme(globalDarkTheme);
            if (Blockly.mainWorkspace!== null){
                Blockly.mainWorkspace.setTheme(dark_theme)
                Blockly.mainWorkspace.toolbox_.setVisible(false);
            }
            
        }
        else{
            
            setCurrentTheme(globalLightTheme);
            if (Blockly.mainWorkspace!== null){
            Blockly.mainWorkspace.setTheme(light_theme)
            Blockly.mainWorkspace.toolbox_.setVisible(false);
            }
        }
    },[currentThemeName])

    return (
    <ThemeContext.Provider value={{
        current_theme,
        dark_theme,
        light_theme,
        changeTheme,
        currentThemeName,
        setCurrentThemeName
    }}>
        {props.children}
    </ThemeContext.Provider>
    )
}

export default ThemeContextProvider
export { dark_theme }