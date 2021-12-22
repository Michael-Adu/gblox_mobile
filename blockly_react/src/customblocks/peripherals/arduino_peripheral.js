import Blockly from 'blockly';

var peripheral_PreDeclarations = "";
var peripheral_BulkFunctions = "";
var peripheral_SetupCode = "";

var US_Trigger;
var US_Echo;
var Servo_Pin;

function clearvars() {
    peripheral_PreDeclarations = "";
    peripheral_BulkFunctions = "";
    peripheral_SetupCode = "";
}

var IR_Loop = ``;

Blockly.Blocks['n_ultra_read'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage("https://www.clipartmax.com/png/full/1-17510_radio-waves-clip-art-radio-wave.png", 40, 40, { alt: "*", flipRtl: "FALSE" }))
            .appendField("Read Ultrasonic Sensor Value (cm)")
        this.setOutput(true, "Number");
        this.setColour(230);
        this.setTooltip("Read Ultrasonic Sensor Value in centimeters");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['n_servo_rotate'] = {
    init: function () {
        this.appendValueInput("degrees")
            .setCheck("Number")
            .appendField(new Blockly.FieldImage("https://static.thenounproject.com/png/1230725-200.png", 40, 40, { alt: "*ServoMotorIcon", flipRtl: "FALSE" }))
            .appendField("Rotate Servo Motor to ");
        this.appendDummyInput()
            .appendField("Degrees");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(0);
        this.setTooltip("Rotates Servo Motor to specified number of degrees");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['n_led_state'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage("https://www.nicepng.com/png/full/92-920070_led-lamp-clipart-led-lights-png.png", 40, 40, { alt: "*", flipRtl: "FALSE" }))
            .appendField("Switch LED")
            .appendField(new Blockly.FieldDropdown([["On", "HIGH"], ["Off", "LOW"]]), "led_state");
        this.setColour(230);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setTooltip("Turns the LED ON or OFF depending on the assigned WriteState");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['n_buzzer_play_note'] = {
    init: function () {
        this.appendValueInput("frequency")
            .setCheck("MusicNote")
            .appendField(new Blockly.FieldImage("https://i.kisscc0.com/20180813/rue/kisscc0-buzzer-computer-icons-electronics-sound-piezoelect-buzzer-5b714095dc7ed2.9012614415341487579032.png", 40, 40, { alt: "*", flipRtl: "FALSE" }))
            .appendField("Play note ");
        this.appendDummyInput();
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(60);
        this.setTooltip("Plays a music note indefinitely.");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['n_buzzer_play_note_def'] = {
    init: function () {
        this.appendValueInput("frequency")
            .setCheck("MusicNote")
            .appendField(new Blockly.FieldImage("https://i.kisscc0.com/20180813/rue/kisscc0-buzzer-computer-icons-electronics-sound-piezoelect-buzzer-5b714095dc7ed2.9012614415341487579032.png", 40, 40, { alt: "*", flipRtl: "FALSE" }))
            .appendField("Play note ");
        this.appendValueInput("seconds")
            .setCheck("Number")
            .appendField("for");
        this.appendDummyInput()
            .appendField("milliseconds");
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(60);
        this.setTooltip("Plays a note for a specified number of milliseconds.");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['n_note'] = {
    init: function () {
        this.appendDummyInput()
            .appendField("Music Note:")
            .appendField(new Blockly.FieldDropdown([["C6", "1047"], ["C#6", "1109"], ["D6", "1175"], ["Eb6", "1245"], ["E6", "1319"], ["F6", "1397"], ["F#6", "1480"], ["G6", "1568"], ["G#6", "1661"], ["A6", "1760"], ["Bb6", "1865"], ["B6", "1976"], ["C7", "2093"], ["C#7", "2217"], ["D7", "2349"], ["Eb7", "2489"], ["E7", "2637"], ["F7", "2794"], ["F#7", "2960"], ["G7", "3136"], ["G#7", "3322"], ["A7", "3520"], ["Bb7", "3729"], ["B7", "3951"], ["C8", "4186"]]), "note");
        this.setOutput(true, "MusicNote");
        this.setColour(300);
        this.setTooltip("Delays the program for a number of seconds.");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['n_buzzer_stop'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage("https://i.kisscc0.com/20180813/rue/kisscc0-buzzer-computer-icons-electronics-sound-piezoelect-buzzer-5b714095dc7ed2.9012614415341487579032.png", 40, 40, { alt: "*", flipRtl: "FALSE" }))
            .appendField("Stop the Buzzer");
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(60);
        this.setTooltip("Stops the buzzer from playing a note.");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['n_buzzer_play'] = {
    init: function () {
        this.appendValueInput("frequency")
            .setCheck("Number")
            .appendField(new Blockly.FieldImage("https://i.kisscc0.com/20180813/rue/kisscc0-buzzer-computer-icons-electronics-sound-piezoelect-buzzer-5b714095dc7ed2.9012614415341487579032.png", 40, 40, { alt: "*", flipRtl: "FALSE" }))
            .appendField("Play note at frequency of");
        this.appendDummyInput()
            .appendField("Hz");
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(60);
        this.setTooltip("Plays a note at a particular frequency indefinitely.");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['n_buzzer_play_def'] = {
    init: function () {
        this.appendValueInput("frequency")
            .setCheck("Number")
            .appendField(new Blockly.FieldImage("https://i.kisscc0.com/20180813/rue/kisscc0-buzzer-computer-icons-electronics-sound-piezoelect-buzzer-5b714095dc7ed2.9012614415341487579032.png", 40, 40, { alt: "*", flipRtl: "FALSE" }))
            .appendField("Play note at frequency of");
        this.appendDummyInput()
            .appendField("Hz");
        this.appendValueInput("seconds")
            .setCheck("Number")
            .appendField("for");
        this.appendDummyInput()
            .appendField("milliseconds");
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setColour(60);
        this.setTooltip("Plays a note at a particular frequency for a specified number of milliseconds.");
        this.setHelpUrl("");
    }
};

Blockly.JavaScript['n_ultra_read'] = function (block) {
    var code = "\tread_ultrasonic(" + US_Trigger + "," + US_Echo + ")\n";
    if (peripheral_PreDeclarations.includes(`int US_Trigger = ${US_Trigger};\nint US_Echo = ${US_Echo};\n\n`) == 0) {
        if (block.getRootBlock().type == "m_mainloop") {
            peripheral_PreDeclarations += `int US_Trigger = ${US_Trigger};\nint US_Echo = ${US_Echo};\n\n`;
            peripheral_SetupCode += `\tpinMode(${US_Trigger}, OUTPUT);\n\tpinMode(${US_Echo}, INPUT);\n`;
            peripheral_BulkFunctions += `\nint read_ultrasonic(int trigger, int echo){
            digitalWrite(trigger, LOW);
            delayMicroseconds(2);
            digitalWrite(trigger, HIGH);
            delayMicroseconds(10);
            digitalWrite(trigger, LOW);
            int duration = pulseIn(echo, HIGH);
            int distance = duration * 0.034 / 2;
            return distance;
        }`
        }
    }
    return [code, Blockly.JavaScript.ORDER_NONE];
};

Blockly.JavaScript['n_servo_rotate'] = function (block) {
    if (peripheral_PreDeclarations.includes("#include <Servo.h>\n Servo ServoA\n") == 0) {
        if (block.getRootBlock().type == "m_mainloop") {
            peripheral_PreDeclarations += "#include <Servo.h>\n Servo ServoA\n";
        }
    }
    if (peripheral_SetupCode.includes(`\tServoA.attach(${Servo_Pin});\n`) == 0) {
        if (block.getRootBlock().type == "m_mainloop") {
            peripheral_SetupCode += `\tServoA.attach(${Servo_Pin});\n`;
        }
    }
    var value_degrees = Blockly.JavaScript.valueToCode(block, 'degrees', Blockly.JavaScript.ORDER_ATOMIC);
    var code = '\n\tServoA.write(' + value_degrees + ');\n';
    return code;
};

Blockly.JavaScript['n_led_state'] = function (block) {
    var value_led_value = block.getFieldValue("led_state");
    // TODO: Assemble JavaScript into code variable.
    if (peripheral_SetupCode.includes(`\tpinMode(LED_BUILTIN, OUTPUT)\n`) == 0) {
        if (block.getRootBlock().type == "m_mainloop") {
            peripheral_SetupCode += `\tpinMode(LED_BUILTIN, OUTPUT);\n`;
        }
    }
    var code = `\n\tdigitalWrite(LED_BUILTIN,${value_led_value});\n`;
    return code;
};

Blockly.JavaScript['n_buzzer_play'] = function (block) {
    var value_frequency = Blockly.JavaScript.valueToCode(block, 'frequency', Blockly.JavaScript.ORDER_ATOMIC);
    // TODO: Assemble JavaScript into code variable.
    var code = '\ntone(Buzzer_Pin,' + value_frequency + ');';
    return code;
};

Blockly.JavaScript['n_buzzer_stop'] = function (block) {
    // TODO: Assemble JavaScript into code variable.
    var code = '\nnoTone(Buzzer_Pin);';
    return code;
};

Blockly.JavaScript['n_buzzer_play_def'] = function (block) {
    var value_frequency = Blockly.JavaScript.valueToCode(block, 'frequency', Blockly.JavaScript.ORDER_ATOMIC);
    var value_seconds = Blockly.JavaScript.valueToCode(block, 'seconds', Blockly.JavaScript.ORDER_ATOMIC);
    // TODO: Assemble JavaScript into code variable.
    var code = '\ntone(Buzzer_Pin,' + value_frequency + ');\ndelay(' + value_seconds + ');\nnoTone(Buzzer_Pin);';
    return code;
};

Blockly.JavaScript['n_note'] = function (block) {
    var dropdown_note = block.getFieldValue('note');
    // TODO: Assemble JavaScript into code variable.
    var code = dropdown_note;
    // TODO: Change ORDER_NONE to the correct strength.
    return [code, Blockly.JavaScript.ORDER_NONE];
};

Blockly.JavaScript['n_delay'] = function (block) {
    var value_seconds = Blockly.JavaScript.valueToCode(block, 'seconds', Blockly.JavaScript.ORDER_ATOMIC);
    // TODO: Assemble JavaScript into code variable.
    var code = '\ndelay(' + value_seconds + ');';
    return code;
};

Blockly.JavaScript['n_buzzer_play_note'] = function (block) {
    var value_frequency = Blockly.JavaScript.valueToCode(block, 'frequency', Blockly.JavaScript.ORDER_ATOMIC);
    // TODO: Assemble JavaScript into code variable.
    var code = '\ntone(Buzzer_Pin,' + value_frequency + ');';
    return code;
};

Blockly.JavaScript['n_buzzer_play_note_def'] = function (block) {
    var value_frequency = Blockly.JavaScript.valueToCode(block, 'frequency', Blockly.JavaScript.ORDER_ATOMIC);
    var value_seconds = Blockly.JavaScript.valueToCode(block, 'seconds', Blockly.JavaScript.ORDER_ATOMIC);
    // TODO: Assemble JavaScript into code variable.
    var code = '\ntone(Buzzer_Pin,' + value_frequency + ');\ndelay(' + value_seconds + ');\nnoTone(Buzzer_Pin);';
    return code;
};


export { peripheral_PreDeclarations, peripheral_BulkFunctions, peripheral_SetupCode, US_Trigger, US_Echo, IR_Loop, clearvars }