import Blockly from 'blockly';
import 'blockly/javascript';

var peripheral_PreDeclarations = "";
var peripheral_BulkFunctions = "";
var peripheral_SetupCode = "";
var IR_Loop = ``;
var IR_Statements = "";

///Global Variables
var servo_declarations = "";  //Used to dynamically define new servos added to the workspace
var servo_statements = "";  //Uses servo_declarations to create declaration statements for each servo.
var servo_attach = "";  //Uses servo_declarations to create attach statements for each servo.

var servo_number = 1;

function clearvars() {
  peripheral_PreDeclarations = "";
  peripheral_BulkFunctions = "";
  peripheral_SetupCode = "";
}

Blockly.Blocks['arduino_ultrasonic_read'] = {
  init: function() {
    this.appendValueInput("trigger")
        .setCheck(null)
        .appendField("Read Ultrasonic Sensor from Trigger Pin");
    this.appendValueInput("echo")
        .setCheck(null)
        .appendField("and Echo Pin");
    this.setInputsInline(true);
    this.setOutput(true, null);
    this.setStyle("sensor_blocks");
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.Blocks['arduino_servo_write'] = {
  init: function() {
    this.appendValueInput("Servo Pin")
        .setCheck(null)
        .appendField("Move Servo Pin");
    this.appendValueInput("Servo Position")
        .setCheck(null)
        .appendField("to position");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setStyle("actuator_blocks");
 this.setTooltip("");
 this.setHelpUrl("");
  }
};



Blockly.JavaScript['arduino_ultrasonic_read'] = function(block) {
  var value_trigger = Blockly.JavaScript.valueToCode(block, 'trigger', Blockly.JavaScript.ORDER_ATOMIC);
  var value_echo = Blockly.JavaScript.valueToCode(block, 'echo', Blockly.JavaScript.ORDER_ATOMIC);
  // TODO: Assemble JavaScript into code variable.
  var code = "read_ultrasonic(" + value_trigger + "," + value_echo + ")";
  if (peripheral_PreDeclarations.includes(`int value_trigger = ${value_trigger};\nint value_echo = ${value_echo};\n\n`) == 0) {
    if (block.getRootBlock().type == "m_mainloop") {
      peripheral_PreDeclarations += `int value_trigger = ${value_trigger};\nint value_echo = ${value_echo};\n\n`;
      peripheral_SetupCode += `\tpinMode(value_trigger, OUTPUT);\n\tpinMode(value_echo, INPUT);\n`;
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

Blockly.JavaScript['arduino_servo_write'] = function(block) {
  var value_servo_pin = Blockly.JavaScript.valueToCode(block, 'Servo Pin', Blockly.JavaScript.ORDER_ATOMIC);
  var value_servo_position = Blockly.JavaScript.valueToCode(block, 'Servo Position', Blockly.JavaScript.ORDER_ATOMIC);

  var list_servo_var = Blockly.JavaScript.nameDB_.getDistinctName("myservo", Blockly.Variables.NAME_TYPE);
  servo_declarations = list_servo_var;
  peripheral_PreDeclarations += `Servo ${servo_declarations};\n`;
  peripheral_SetupCode += `\n${servo_declarations}.attach(${value_servo_pin});\n`;
  var code = `${servo_declarations}.write(${value_servo_position});\t//Move Servo to position ${value_servo_position}\n`;
  return code;
  var code = '...;\n';
  return code;
};
export { peripheral_PreDeclarations, peripheral_BulkFunctions, peripheral_SetupCode, IR_Loop, IR_Statements, clearvars }