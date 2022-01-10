import Blockly, { Block } from 'blockly';
import Actuators from "./../SVGs/Actuators.png"
import Sensors from "./../SVGs/Sensors.png"
import COM from "./../SVGs/COM.png"
import LED from "./../SVGs/LED.png"
import Default from "./../SVGs/Default.png"
import Sound from "./../SVGs/Sound.png"

import Smiling from "./../DisplayPNGS/Smiling Face.png"
import Happy from "./../DisplayPNGS/Happy Face.png"
import Heart from "./../DisplayPNGS/Heart.png"
import Sad from "./../DisplayPNGS/Sad Face.png"
import Crying from "./../DisplayPNGS/Crying Face.png"
import laugh from "./../DisplayPNGS/laugh.gif"

Blockly.Blocks['mingo_motor_move_indef'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Actuators, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("")
            .appendField(new Blockly.FieldDropdown([["move forward", "forward"], ["move backward", "backward"], ["turn left", "left"], ["turn right", "right"], ["rotate left", "rleft"], ["rotate right", "rright"]]), "direction")
            .appendField("at")
            .appendField(new Blockly.FieldNumber(50, 0, 100, 1), "speed")
            .appendField("% speed");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(120);
        this.setTooltip("");
        this.setStyle("actuator_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_motor_single_move_indef'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Actuators, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("turn")
            .appendField(new Blockly.FieldDropdown([["Left Motor", "lm"], ["Right Motor", "rm"]]), "motorselect")
            .appendField(new Blockly.FieldDropdown([["forward", "forward"], ["backward", "backward"], ["to a stop", "stop"]]), "direction")
            .appendField("at")
            .appendField(new Blockly.FieldNumber(50, 0, 100, 1), "speed")
            .appendField("% speed");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(120);
        this.setTooltip("");
        this.setStyle("actuator_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_motor_stop_indef'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Actuators, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("stop")
            .appendField(new Blockly.FieldDropdown([["all motors", "all"], ["left motor", "left"], ["right motor", "right"]]), "motor");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(120);
        this.setTooltip("");
        this.setStyle("actuator_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_grabber_move'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Actuators, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField(" ")
            .appendField(new Blockly.FieldDropdown([["open", "open"], ["close", "close"]]), "action")
            .appendField("grabber at Port")
            .appendField(new Blockly.FieldDropdown([["1", "1"], ["2", "2"]]), "port");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setTooltip("");
        this.setStyle("actuator_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_led_range'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(LED, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("set color of ")
            .appendField(new Blockly.FieldDropdown([["all", "all"], ["left", "left"], ["right", "right"]]), "ledSelect")
            .appendField("LED on port")
            .appendField(new Blockly.FieldDropdown([["1", "1"], ["2", "2"]]), "port")
            .appendField("to");
        this.appendValueInput("red")
            .setCheck("Number")
            .appendField("Red:");
        this.appendValueInput("green")
            .setCheck("Number")
            .appendField("Green:");
        this.appendValueInput("blue")
            .setCheck("Number")
            .appendField("Blue:");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setTooltip("");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_led_definite'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(LED, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("set color of ")
            .appendField(new Blockly.FieldDropdown([["all", "all"], ["left", "left"], ["right", "right"]]), "ledSelect")
            .appendField("LED on port")
            .appendField(new Blockly.FieldDropdown([["1", "1"], ["2", "2"]]), "port")
            .appendField("to")
            .appendField(new Blockly.FieldDropdown([["red", "red"], ["green", "green"], ["blue", "blue"], ["none", "none"]]), "colorSelect");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setTooltip("");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_sound_play'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Sound, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("play note ")
            .appendField(new Blockly.FieldDropdown([["C4", "262"],
            ["C#4", "277"],
            ["D4", "294"],
            ["Eb4", "311"],
            ["E4", "330"],
            ["F4", "349"],
            ["F#4", "370"],
            ["G4", "392"],
            ["G#4", "415"],
            ["A4", "440"],
            ["Bb4", "466"],
            ["B4", "494"],
            ["C5", "523"],
            ["C#5", "554"],
            ["D5", "587"],
            ["Eb5", "622"],
            ["E5", "659"],
            ["F5", "699"],
            ["F#5", "740"],
            ["G5", "784"],
            ["G#5", "831"],
            ["A5", "880"],
            ["Bb5", "932"],
            ["B5", "988"],
            ["C6", "1047"]]), "Note");
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setInputsInline(true);
        this.setTooltip("");
        this.setStyle("sound_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_sound_play_timed'] = {
    init: function () {
        this.appendValueInput("Buzzer Time")
            .setCheck("Number")
            .appendField(new Blockly.FieldImage(Sound, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField(" play note")
            .appendField(new Blockly.FieldDropdown([
                ["C4", "262"],
                ["C#4", "277"],
                ["D4", "294"],
                ["Eb4", "311"],
                ["E4", "330"],
                ["F4", "349"],
                ["F#4", "370"],
                ["G4", "392"],
                ["G#4", "415"],
                ["A4", "440"],
                ["Bb4", "466"],
                ["B4", "494"],
                ["C5", "523"],
                ["C#5", "554"],
                ["D5", "587"],
                ["Eb5", "622"],
                ["E5", "659"],
                ["F5", "699"],
                ["F#5", "740"],
                ["G5", "784"],
                ["G#5", "831"],
                ["A5", "880"],
                ["Bb5", "932"],
                ["B5", "988"],
                ["C6", "1047"]
            ]), "note")
            .appendField("for");
        this.appendDummyInput()
            .appendField("seconds");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setTooltip("");
        this.setStyle("sound_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_sound_stop'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Sound, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField(" stop the buzzer");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setTooltip("");
        this.setStyle("sound_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_sound_play_song'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Sound, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("play")
            .appendField(new Blockly.FieldDropdown([
                ["Merry Christmas", "merry"],
                ["Happy Birthday", "bday"],
                ["Fur Elise", "furelise"],
                ["Silent Night", "silent"],
                ["Lion Sleeps Tonight", "lion"],
                ["Game of Thrones", "got"],
                ["Police Siren A", "sirenA"],
                ["Police Siren B", "sirenB"]]), "song");
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setInputsInline(true);
        this.setTooltip("");
        this.setStyle("sound_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_light_read'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Sensors, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("read")
            .appendField(new Blockly.FieldDropdown([["left light sensor", "left"], ["right light sensor", "right"]]), "sensor")
            .appendField("from port")
            .appendField(new Blockly.FieldDropdown([["3", "3"], ["4", "4"]]), "port");
        this.setOutput(true, null);
        this.setColour(230);
        this.setInputsInline(true);
        this.setTooltip("");
        this.setStyle("sensor_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_line_read'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Sensors, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("read")
            .appendField(new Blockly.FieldDropdown([["left line sensor", "left"], ["right line sensor", "right"]]), "sensor")
            .appendField("from port")
            .appendField(new Blockly.FieldDropdown([["3", "3"], ["4", "4"]]), "port");
        this.setOutput(true, null);
        this.setColour(230);
        this.setInputsInline(true);
        this.setTooltip("");
        this.setStyle("sensor_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_ultrasonic_sensor'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Sensors, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("read ultrasonic sensor on port")
            .appendField(new Blockly.FieldDropdown([["1", "1"], ["2", "2"]]), "port");
        this.setOutput(true, null);
        this.setColour(230);
        this.setInputsInline(true);
        this.setTooltip("");
        this.setStyle("sensor_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_ir_begin'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(COM, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("start infrared communication");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setTooltip("");
        this.setStyle("communication_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_ir_read'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(COM, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("When Remote button ")
            .appendField(new Blockly.FieldDropdown([["Up", "46"], ["Down", "15"], ["Right", "43"], ["Left", "44"], ["Ok", "40"], ["1", "16"], ["2", "19"], ["3", "D"], ["4", "C"], ["5", "18"], ["6", "5E"], ["7", "8"], ["8", "1C"], ["9", "5A"], ["0", "52"], ["#", "4A"], ["*", "42"]]), "Received_Character")
            .appendField("is pressed");
        this.appendStatementInput("IR_Decode_Loop")
            .setCheck(null);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setTooltip("");
        this.setStyle("communication_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_bluetooth_begin'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(COM, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField(" start Bluetooth Communication");
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setInputsInline(true);
        this.setTooltip("");
        this.setStyle("communication_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_bluetooth_read'] = {
    init: function () {
        this.appendValueInput("NAME")
            .setCheck(["Number", "String"])
            .appendField(new Blockly.FieldImage(COM, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("When Bluetooth Character is");
        this.setInputsInline(true);
        this.setOutput(true, null);
        this.setColour(230);
        this.setTooltip("");
        this.setStyle("communication_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_bluetooth_send'] = {
    init: function () {
        this.appendValueInput("NAME")
            .setCheck(null)
            .appendField(new Blockly.FieldImage(COM, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField(" send Bluetooth Character ");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setTooltip("");
        this.setStyle("communication_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_display_text'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Default, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField(" write ")
            .appendField(new Blockly.FieldTextInput("text"), "text")
            .appendField(" to display on port ")
            .appendField(new Blockly.FieldDropdown([["1", "1"], ["2", "2"], ["3", "3"], ["4", "4"]]), "port");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setTooltip("");
        //this.setStyle("sound_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_display_clear'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Default, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("clear display on port")
            .appendField(new Blockly.FieldDropdown([["1", "1"], ["2", "2"], ["3", "3"], ["4", "4"]]), "port");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setTooltip("");
        //this.setStyle("sound_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_display_face'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Default, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("print")
            .appendField(new Blockly.FieldDropdown(
                [
                    [{ 'src': Smiling, 'width': 75, 'height': 50, 'alt': 'Smiling Face' }, 'smile'],
                    [{ 'src': Happy, 'width': 75, 'height': 50, 'alt': 'Smiling Face' }, 'happy'],
                    [{ 'src': Heart, 'width': 75, 'height': 50, 'alt': 'Smiling Face' }, 'heart'],
                    [{ 'src': Sad, 'width': 75, 'height': 50, 'alt': 'Smiling Face' }, 'sad'],
                    [{ 'src': Crying, 'width': 75, 'height': 50, 'alt': 'Smiling Face' }, 'crying'],
                    [{ 'src': laugh, 'width': 75, 'height': 50, 'alt': 'Smiling Face' }, 'laugh'],
                ]), "face")
            .appendField(" to display on port ")
            .appendField(new Blockly.FieldDropdown([["1", "1"], ["2", "2"], ["3", "3"], ["4", "4"]]), "port");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setTooltip("");
        //this.setStyle("sound_blocks");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['mingo_display_animation'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage(Default, 25, 25, { alt: "*", flipRtl: "FALSE" }))
            .appendField("play")
            .appendField(new Blockly.FieldDropdown([["Loading Animation", "1"]]), "anim")
            .appendField(" on display oconnected to port ")
            .appendField(new Blockly.FieldDropdown([["1", "1"], ["2", "2"], ["3", "3"], ["4", "4"]]), "port");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(230);
        this.setTooltip("");
        //this.setStyle("sound_blocks");
        this.setHelpUrl("");
    }
};