///Variable Counter
var digital_pin_number = 0;
var analog_pin_number = 0;
var servo_number = 0;

///Setup and Loop Block

Blockly.Blocks['main_block'] = {
  init: function() {
    this.appendStatementInput("Setup")
        .setCheck(null)
        .appendField("Setup");
    this.appendStatementInput("Loop")
        .setCheck(null)
        .appendField("Loop");
    this.setColour(100);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.JavaScript['main_block'] = function(block) {
  var statements_setup = Blockly.JavaScript.statementToCode(block, 'Setup');
  var statements_loop = Blockly.JavaScript.statementToCode(block, 'Loop');
  // TODO: Assemble JavaScript into code variable.
  var code = 'void setup(){\n' + statements_setup+'}\nvoid loop(){\n' +statements_loop+'}';
  return code;
};

///Setup Blocks
//Pin Setup
Blockly.Blocks['pin_setup'] = {
  init: function() {
    this.appendDummyInput()
        .appendField("Digital Pin Setup")
        .appendField(new Blockly.FieldTextInput("0"), "Digital Pin")
        .appendField(new Blockly.FieldDropdown([["INPUT","INPUT"], ["OUTPUT","OUTPUT"]]), "Pin Mode");
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(20);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.JavaScript['pin_setup'] = function(block) {
  var text_digital_pin = block.getFieldValue('Digital Pin');
  var dropdown_pin_mode = block.getFieldValue('Pin Mode');
  // TODO: Assemble JavaScript into code variable.
  var code = 'pinMode('+text_digital_pin+','+dropdown_pin_mode+'); //Digital Pin '+text_digital_pin+' Setup\n';
  return code;
};

//Ultrasonic Setup
Blockly.Blocks['ultrasonic_sensor_setup'] = {
  init: function() {
    this.appendDummyInput()
        .appendField("Ultrasonic Setup");
    this.appendDummyInput()
        .appendField("Trigger Pin")
        .appendField(new Blockly.FieldNumber(0, 0, 19), "Trigger Digital Pin");
    this.appendDummyInput()
        .appendField("Echo Pin")
        .appendField(new Blockly.FieldNumber(0, 0, 19), "Echo Digital Pin");
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(65);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.JavaScript['ultrasonic_sensor_setup'] = function(block) {
  var number_trigger_digital_pin = block.getFieldValue('Trigger Digital Pin');
  var number_echo_digital_pin = block.getFieldValue('Echo Digital Pin');
  // TODO: Assemble JavaScript into code variable.
  var code = 'pinMode(' + number_trigger_digital_pin +', OUTPUT); //Trigger digital pin\npinMode('+number_echo_digital_pin+',INPUT); //Echo Digital pin\n';
  return code;
};
///Digital Blocks
//Digital Write Block
Blockly.Blocks['digital_pin_write'] = {
  init: function() {
    this.appendValueInput("Pin number")
        .setCheck("Number")
        .setAlign(Blockly.ALIGN_CENTRE)
        .appendField("Digital Pin Write")
        .appendField(new Blockly.FieldNumber(0, 0, 19), "Digital Pin Number");
    this.appendValueInput("Pin State")
        .setCheck("Boolean")
        .setAlign(Blockly.ALIGN_CENTRE)
        .appendField("On/Off")
        .appendField(new Blockly.FieldDropdown([["Off","LOW"], ["On","HIGH"]]), "On/Off");
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(20);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.JavaScript['digital_pin_write'] = function(block) {
  var number_digital_pin_number = block.getFieldValue('Digital Pin Number');
  var value_pin_number = Blockly.JavaScript.valueToCode(block, 'Pin number', Blockly.JavaScript.ORDER_ATOMIC);
  var dropdown_on_off = block.getFieldValue('On/Off');
  var value_name = Blockly.JavaScript.valueToCode(block, 'NAME', Blockly.JavaScript.ORDER_ATOMIC);
  // TODO: Assemble JavaScript into code variable.
  console.log(value_pin_number);
  console.log(dropdown_on_off);
  var code = 'digitalWrite('+number_digital_pin_number+','+dropdown_on_off+'); //Digital Pin '+number_digital_pin_number+' is '+dropdown_on_off+'\n';
  return code;
};

//Digital Read Block
Blockly.Blocks['digital_read'] = {
  init: function() {
    this.appendDummyInput()
        .appendField("Digital Pin Read")
        .appendField(new Blockly.FieldNumber(0, 0, 19), "Digital Pin Number");
    this.setOutput(true, null);
    this.setColour(230);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.JavaScript['digital_read'] = function(block) {
  var number_digital_pin_number = block.getFieldValue('Digital Pin Number');
  // TODO: Assemble JavaScript into code variable.
  var code = '(digitalRead('+number_digital_pin_number+'))';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.JavaScript.ORDER_NONE];
};

///Analog Blocks
//Analog Write Block
Blockly.Blocks['analog_write'] = {
  init: function() {
    this.appendValueInput("Arduino Pin")
        .setCheck("Number")
        .appendField("Analog Pin")
        .appendField(new Blockly.FieldTextInput("0"), "Pin Number");
    this.appendValueInput("Analog Write")
        .setCheck("Number")
        .appendField("Output Value")
        .appendField(new Blockly.FieldNumber(0, 0, 255), "Output Value");
    this.setInputsInline(false);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(210);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.JavaScript['analog_write'] = function(block) {
  var text_pin_number = block.getFieldValue('Pin Number');
  var value_arduino_pin = Blockly.JavaScript.valueToCode(block, 'Arduino Pin', Blockly.JavaScript.ORDER_ATOMIC);
  var number_output_value = block.getFieldValue('Output Vaxlue');
  var value_analog_write = Blockly.JavaScript.valueToCode(block, 'Analog Write', Blockly.JavaScript.ORDER_ATOMIC);
  // TODO: Assemble JavaScript into code variable.
  var code = 'analogWrite('+text_pin_number+','+number_output_value+'); //Analog Pin '+text_pin_number + 'set to '+number_output_value+'\n';
  return code;
};

//Analog Read Block
Blockly.Blocks['analog_read'] = {
  init: function() {
    this.appendDummyInput()
        .appendField("Analog Pin Read")
        .appendField(new Blockly.FieldTextInput("default"), "Analog Pin");
    this.setOutput(true, null);
    this.setColour(230);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.JavaScript['analog_read'] = function(block) {
  var text_analog_pin = block.getFieldValue('Analog Pin');
  // TODO: Assemble JavaScript into code variable.
  var code = '(analogRead(' + text_analog_pin + '))';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.JavaScript.ORDER_NONE];
};


///Sensor Blocks
//Ultrasoinc Read Block
Blockly.Blocks['ultrasonic_sensor'] = {
  init: function() {
    this.appendDummyInput()
        .appendField("Ultrasonic Sensor Read");
    this.appendDummyInput()
        .appendField("Trigger Pin")
        .appendField(new Blockly.FieldNumber(0, 0, 19), "Trigger Digital Pin");
    this.appendDummyInput()
        .appendField("Echo Pin")
        .appendField(new Blockly.FieldNumber(0, 0, 19), "Echo Digital Pin");
    this.setOutput(true, null);
    this.setColour(65);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.JavaScript['ultrasonic_sensor'] = function(block) {
  var number_trigger_digital_pin = block.getFieldValue('Trigger Digital Pin');
  var number_echo_digital_pin = block.getFieldValue('Echo Digital Pin');
  // TODO: Assemble JavaScript into code variable.
  var code = 'digitalWrite('+ number_trigger_digital_pin+', LOW);\ndelayMicroseconds(2);\ndigitalWrite('+number_trigger_digital_pin+', HIGH);\ndelayMicroseconds(10);\ndigitalWrite('+number_trigger_digital_pin+', LOW);\nduration = pulseIn(' +number_echo_digital_pin+', HIGH);\ndistance = duration * 0.034 / 2;';
  // TODO: Change ORDER_NONE to the correct strength.
  return [code, Blockly.JavaScript.ORDER_NONE];
};

///Actuator Blocks
//Servo Block
Blockly.Blocks['servo_write'] = {
  init: function() {
    this.appendValueInput("Servo Motor Pin")
        .setCheck("Number")
        .appendField("Servo Motor Pin")
        .appendField(new Blockly.FieldTextInput("0"), "Servo Motor Pin");
    this.appendValueInput("Servo Motor Position")
        .setCheck("Number")
        .appendField("Servo Motor Position")
        .appendField(new Blockly.FieldNumber(0, 0, 180), "Motor Position");
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(230);
 this.setTooltip("");
 this.setHelpUrl("");
  }
};

Blockly.JavaScript['servo_write'] = function(block) {
  var text_servo_motor_pin = block.getFieldValue('Servo Motor Pin');
  var value_servo_motor_pin = Blockly.JavaScript.valueToCode(block, 'Servo Motor Pin', Blockly.JavaScript.ORDER_ATOMIC);
  var number_motor_position = block.getFieldValue('Motor Position');
  var value_servo_motor_position = Blockly.JavaScript.valueToCode(block, 'Servo Motor Position', Blockly.JavaScript.ORDER_ATOMIC);
  // TODO: Assemble JavaScript into code variable.
  servo_number+=1;
  var code = 'Servo myservo_'+servo_number+'\nmyservo_'+servo_number+'.attach('+text_servo_motor_pin+'); //Servo Pin Setup\nmyservo_'+servo_number+'.write('+number_motor_position+');\n';
  return code;
};