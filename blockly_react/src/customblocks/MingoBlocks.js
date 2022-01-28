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
            .appendField(new Blockly.FieldDropdown([["move forward", "forward"], ["move backward", "backward"], ["turn left", "left"], ["turn right", "right"]]), "direction")

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
            .appendField("stop Mingo");
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
            .appendField(new Blockly.FieldDropdown([["C4", "C 4"],
            ["C#4", "C# 4"],
            ["D4", "D 4"],
            ["D#4", "D# 4"],
            ["E4", "E 4"],
            ["F4", "F 4"],
            ["F#4", "F# 4"],
            ["G4", "G 4"],
            ["G#4", "G# 4"],
            ["A4", "A 4"],
            ["A#4", "A# 4"],
            ["B4", "B 4"],
            ["C5", "C 5"],
            ["C#5", "C# 5"],
            ["D5", "D 5"],
            ["D#5", "D# 5"],
            ["E5", "E 5"],
            ["F5", "F 5"],
            ["F#5", "F# 5"],
            ["G5", "G 5"],
            ["G#5", "G# 5"],
            ["A5", "A 5"],
            ["A#5", "A# 5"],
            ["B5", "B 5"],
            ["C6", "C 6"]]), "Note");
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
                ["C4", "C 4"],
            ["C#4", "C# 4"],
            ["D4", "D 4"],
            ["D#4", "D# 4"],
            ["E4", "E 4"],
            ["F4", "F 4"],
            ["F#4", "F# 4"],
            ["G4", "G 4"],
            ["G#4", "G# 4"],
            ["A4", "A 4"],
            ["A#4", "A# 4"],
            ["B4", "B 4"],
            ["C5", "C 5"],
            ["C#5", "C# 5"],
            ["D5", "D 5"],
            ["D#5", "D# 5"],
            ["E5", "E 5"],
            ["F5", "F 5"],
            ["F#5", "F# 5"],
            ["G5", "G 5"],
            ["G#5", "G# 5"],
            ["A5", "A 5"],
            ["A#5", "A# 5"],
            ["B5", "B 5"],
            ["C6", "C 6"]
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