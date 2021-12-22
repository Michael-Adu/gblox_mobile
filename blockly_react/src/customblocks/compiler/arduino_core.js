import Blockly from 'blockly';
import { globalToolboxName, createdVariables, workspaceXML } from '../../components/contexts/Ctxt_SingletonManager.js';
var peripherals = null;
var variables_set = [["sample_variable", "0"]];
var varcheck = []
async function getPeripherals() {
    switch (globalToolboxName) {
        case "Basic":
            peripherals = await import('./../peripherals/arduino_peripheral.js');
            break;
        case "Mello":
            peripherals = await import('./../MelloBlocksGen.js')
            break;
        case "Arduino Uno":
            peripherals = await import('./../customblocks.js')
            break;
        case "Mingo":
            peripherals = await import('./../MingoBlocksGen.js')
            break;
        default:
            break;
    }
}

var Total_PreDeclarations = "";
var Total_SetupCode = "void setup(){\n";
var Total_BulkFunctions = "";
var mainLoopCode = "";




Blockly.Blocks['m_mainloop'] = {
    init: function () {
        this.appendDummyInput()
            .appendField(new Blockly.FieldImage("https://www.clipartmax.com/png/full/219-2194283_open-green-flag-sprite.png", 40, 40, { alt: "*", flipRtl: "FALSE" }))
            .appendField("When "+ globalToolboxName + " starts,", "MainField");
        this.appendDummyInput()
            .appendField("Run Forever")
            .appendField(new Blockly.FieldCheckbox("TRUE"), "LOOP");
        this.appendStatementInput("mainLoop")
            .setCheck(null);
        this.setColour("#4C97FF");
        this.setTooltip("The Main Loop of the program.");
        this.setHelpUrl("");
    },

};

Blockly.Blocks['delay_core'] = {
    init: function () {
        this.appendValueInput("seconds")
            .setCheck("Number")
            .appendField("delay for");
        this.appendDummyInput()
            .appendField("seconds");
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setStyle("loop_blocks");
        this.setTooltip("Delays the program for a number of seconds.");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['communication_serial_print'] = {
    init: function () {
        this.appendValueInput("Serial_Print")
            .setCheck(null)
            .appendField("Print");
        this.appendDummyInput()
            .appendField(" to Serial Monitor");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setStyle("communication_blocks");
        this.setTooltip("");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['communication_serial_read'] = {
    init: function () {
        this.appendDummyInput()
            .appendField("Read From Serial Monitor");
        this.setInputsInline(true);
        this.setOutput(true, null);
        this.setStyle("communication_blocks");
        this.setTooltip("");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['arduino_digital_write'] = {
    init: function () {
        this.appendValueInput("Digital Pin Number")
            .setCheck("Number")
            .appendField("Set Digital Pin");
        this.appendDummyInput()
            .appendField("to")
            .appendField(new Blockly.FieldDropdown([["On", "HIGH"], ["Off", "LOW"]]), "On/Off");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setStyle("digital_blocks");
        this.setTooltip("");
        this.setHelpUrl("");
    }
};
Blockly.Blocks['arduino_digital_read'] = {
    init: function () {
        this.appendValueInput("Digital Pin")
            .setCheck(null)
            .appendField("Read Digital Pin");
        this.setInputsInline(true);
        this.setOutput(true, null);
        this.setStyle("digital_blocks");
        this.setTooltip("");
        this.setHelpUrl("");
    }
};
Blockly.Blocks['arduino_analog_write'] = {
    init: function () {
        this.appendValueInput("analog pin")
            .setCheck("String")
            .appendField("Set Analog Pin");
        this.appendValueInput("output")
            .setCheck("Number")
            .appendField("to");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setStyle("analog_blocks");
        this.setTooltip("");
        this.setHelpUrl("");
    }
};
Blockly.Blocks['arduino_analog_read'] = {
    init: function () {
        this.appendValueInput("analog pin")
            .setCheck(null)
            .appendField("Read Analog Pin");
        this.setInputsInline(true);
        this.setOutput(true, null);
        this.setStyle("analog_blocks");
        this.setTooltip("");
        this.setHelpUrl("");
    }
};

Blockly.Blocks['variable_set'] = {
    init: function () {
        var input = this.appendDummyInput()
            .appendField("Set Variable")
            .appendField(new Blockly.FieldDropdown(this.generateOptions), `variables_set`);
        this.appendValueInput("value")
            .setCheck(["Number", "String"])
            .appendField("to");
        this.setInputsInline(true);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setStyle("variable_blocks");
        this.setTooltip("");
        this.setHelpUrl("");

    },
    generateOptions: function () {
        var options = []
        options = variables_set;
        return options;
    }
};

Blockly.Blocks['variable_get'] = {
    init: function () {
        var input = this.appendDummyInput()
            .appendField("Get Variable")
            .appendField(new Blockly.FieldDropdown(this.generateOptions), `variables_set`)
            .appendField("'s value");
        this.setInputsInline(true);
        this.setOutput(true, null);
        this.setStyle("variable_blocks");
        this.setTooltip("");
        this.setHelpUrl("");
    },
    generateOptions: function () {
        var options = []
        options = variables_set;
        return options;
    }
};

Blockly.Blocks['for_loop'] = {
    init: function () {
        this.appendDummyInput()
            .appendField("Repeat for")
            .appendField(new Blockly.FieldNumber(0, 0), "loop amount")
            .appendField("Times");
        this.appendStatementInput("for loop")
            .setCheck(null);
        this.setPreviousStatement(true, null);
        this.setNextStatement(true, null);
        this.setStyle("loop_blocks");
        this.setTooltip("");
        this.setHelpUrl("");
    }
};

Blockly.JavaScript['m_mainloop'] = function (block) {
    getPeripherals();
    block.setDeletable(false);
    block.setMovable(false);
    block.setFieldValue("When "+ globalToolboxName + " starts,", "MainField")

    var statements_mainloop = Blockly.JavaScript.statementToCode(block, 'mainLoop');
    if (createdVariables.length != 0) {
        variables_set = createdVariables;
        varcheck = createdVariables
        for (var i = 0; i < variables_set.length; i++) {
            Total_PreDeclarations += `${variables_set[i][0]};\n`;
        }
    }

    var checkbox_loop = block.getFieldValue("LOOP");
    try {
        Total_PreDeclarations += peripherals.peripheral_PreDeclarations;
        Total_SetupCode += peripherals.peripheral_SetupCode;
        Total_BulkFunctions += peripherals.peripheral_BulkFunctions;
        if (peripherals.IR_Loop !== ``) {
            statements_mainloop += `\tif(IrReceiver.decode()){\n\t\t${peripherals.IR_Loop}\nIrReceiver.resume();\n}`;
        }
    }
    catch (e) {
    }
    var code = ""
    if (checkbox_loop == "TRUE") {
        code = `${Total_PreDeclarations} ${Total_SetupCode} \n}\n\nvoid loop(){\n ${statements_mainloop}\n} \n ${Total_BulkFunctions}`;
    }
    else {
        code = `${Total_PreDeclarations} \nint runOnce;\n ${Total_SetupCode} \nrunOnce = 0;\n}\n\nvoid loop(){\n\tif(runOnce == 0){\n${statements_mainloop}\nrunOnce = 1;}\n}\n${Total_BulkFunctions}`;
    }
    Total_PreDeclarations = "";
    Total_SetupCode = "\nvoid setup(){\n";
    Total_BulkFunctions = "";

    try {
        peripherals.clearvars();
    }
    catch (e) { }
    mainLoopCode = code;
    return code;
};

Blockly.JavaScript['delay_core'] = function (block) {
    var value_seconds = Blockly.JavaScript.valueToCode(block, 'seconds', Blockly.JavaScript.ORDER_ATOMIC);
    var code = `\ndelay(${value_seconds * 1000});\n`;
    return code;
};

Blockly.JavaScript['communication_serial_print'] = function (block) {
    var value_serial_print = Blockly.JavaScript.valueToCode(block, 'Serial_Print', Blockly.JavaScript.ORDER_ATOMIC);
    if (value_serial_print[0] == `'`) {
        value_serial_print = value_serial_print.replaceAll(`'`, `"`);
    }
    if (Total_SetupCode.includes(`Serial.begin(9600);`) == 0) {
        if (block.getRootBlock().type == "m_mainloop") {
            Total_SetupCode += `\tSerial.begin(9600);\n`;
        }
    }
    var code = `\tSerial.println(${value_serial_print});\n`;
    return code;
};

Blockly.JavaScript['communication_serial_read'] = function (block) {
    if (Total_SetupCode.includes(`Serial.begin(9600);`) == 0) {
        Total_SetupCode += `\tSerial.begin(9600);\n`;
    }
    var code = ""
    if (block.getRootBlock().type == "m_mainloop") {

        code = `Serial.read()`;
        console.log(code)
    }
    return [code, Blockly.JavaScript.ORDER_NONE];
};

Blockly.JavaScript['variable_set'] = function (block) {
    var text_varname = block.getFieldValue('variables_set');
    var value_value = Blockly.JavaScript.valueToCode(block, 'value', Blockly.JavaScript.ORDER_ATOMIC);

var code = '';
code = `${text_varname} = ${value_value};\n`
return code;
};

Blockly.JavaScript['variable_get'] = function (block) {
    var text_varname = block.getFieldValue('variables_set');
    var code = '...';
    code = `${text_varname}`
    return [code, Blockly.JavaScript.ORDER_NONE];
};

Blockly.JavaScript['for_loop'] = function (block) {
    var number_loop_amount = block.getFieldValue('loop amount');
    var statements_for_loop = Blockly.JavaScript.statementToCode(block, 'for loop');
    // TODO: Assemble JavaScript into code variable.
    var code = 'for (int i = 0;i<' + number_loop_amount + ';i++) {\n' + statements_for_loop + '};\n';
    return code;
};

Blockly.JavaScript['arduino_digital_write'] = function (block) {
    var value_digital_pin_number = Blockly.JavaScript.valueToCode(block, 'Digital Pin Number', Blockly.JavaScript.ORDER_ATOMIC);
    var dropdown_on_off = block.getFieldValue('On/Off');
    if (Total_SetupCode.includes(`pinMode(${value_digital_pin_number}, OUTPUT)`) == 0) {
        if (block.getRootBlock().type == "m_mainloop") {
            Total_SetupCode += `pinMode(${value_digital_pin_number}, OUTPUT);\n`
        }
    }
    var code = `digitalWrite(${value_digital_pin_number},${dropdown_on_off});\n`;
    return code;
};
Blockly.JavaScript['arduino_digital_read'] = function (block) {
    var value_digital_pin_number = Blockly.JavaScript.valueToCode(block, 'Digital Pin', Blockly.JavaScript.ORDER_ATOMIC);
    if (Total_SetupCode.includes(`pinMode(${value_digital_pin_number}, INPUT)`) == 0) {
        if (block.getRootBlock().type == "m_mainloop") {
            Total_SetupCode += `pinMode(${value_digital_pin_number}, INPUT);\n`
        }
    }
    var code = `digitalRead(${value_digital_pin_number})`;
    // TODO: Change ORDER_NONE to the correct strength.
    return [code, Blockly.JavaScript.ORDER_NONE];
};
Blockly.JavaScript['arduino_analog_write'] = function (block) {
    var value_analog_pin_number = Blockly.JavaScript.valueToCode(block, 'analog pin', Blockly.JavaScript.ORDER_ATOMIC);
    var value_output = Blockly.JavaScript.valueToCode(block, 'output', Blockly.JavaScript.ORDER_ATOMIC);
    if (Total_SetupCode.includes(`pinMode(${value_analog_pin_number}, OUTPUT)`) == 0) {
        if (block.getRootBlock().type == "m_mainloop") {
            Total_SetupCode += `pinMode(${value_analog_pin_number}, OUTPUT);\n`
        }
    }
    var code = `analogWrite(${value_analog_pin_number},${value_output});\n`;
    return code;
};
Blockly.JavaScript['arduino_analog_read'] = function (block) {
    var value_analog_pin_number = Blockly.JavaScript.valueToCode(block, 'analog pin', Blockly.JavaScript.ORDER_ATOMIC);
    // TODO: Assemble JavaScript into code variable.
    if (Total_SetupCode.includes(`pinMode(${value_analog_pin_number}, INPUT)`) == 0) {
        if (block.getRootBlock().type == "m_mainloop") {
            Total_SetupCode += `pinMode(${value_analog_pin_number}, INPUT);\n`
        }
    }

    var code = `analogRead(${value_analog_pin_number})`;
    // TODO: Change ORDER_NONE to the correct strength.
    return [code, Blockly.JavaScript.ORDER_NONE];
};


export { mainLoopCode }