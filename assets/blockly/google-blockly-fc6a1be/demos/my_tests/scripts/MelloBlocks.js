import Blockly from 'blockly';
import Actuators from "./../SVGs/Actuators.png"
import Sensors from "./../SVGs/Sensors.png"
import COM from "./../SVGs/COM.png"
import LED from "./../SVGs/LED.png"
import Default from "./../SVGs/Default.png"
import Sound from "./../SVGs/Sound.png"



Blockly.Blocks['sensor_ultrasonic'] = {
  init: function () {
    this.appendDummyInput()
      .appendField(new Blockly.FieldImage(Sensors, 25, 25, { alt: "*", flipRtl: "FALSE" }))
      .appendField(" read Ultrasonic Sensor value");
    this.setOutput(true, null);
    this.setColour(230);
    this.setInputsInline(true);
    this.setTooltip("");
    this.setStyle("sensor_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['sensor_light_follower_right'] = {
  init: function () {
    this.appendDummyInput()
      .appendField(new Blockly.FieldImage(Sensors, 25, 25, { alt: "*", flipRtl: "FALSE" }))
      .appendField(" read Right Light Follower value");
    this.setOutput(true, null);
    this.setColour(230);
    this.setInputsInline(true);
    this.setTooltip("");
    this.setStyle("sensor_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['sensor_light_follower_left'] = {
  init: function () {
    this.appendDummyInput()
      .appendField(new Blockly.FieldImage(Sensors, 25, 25, { alt: "*", flipRtl: "FALSE" }))
      .appendField(" read Left Light Follower value");
    this.setOutput(true, null);
    this.setColour(230);
    this.setInputsInline(true);
    this.setTooltip("");
    this.setStyle("sensor_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['sensor_line_follower_right'] = {
  init: function () {
    this.appendDummyInput()
      .appendField(new Blockly.FieldImage(Sensors, 25, 25, { alt: "*", flipRtl: "FALSE" }))
      .appendField("Right Line Follower is")
      .appendField(new Blockly.FieldDropdown([["On", "On"], ["Off", "Off"]]), "Right Line Follower Value");
    this.setOutput(true, null);
    this.setColour(230);
    this.setInputsInline(true);
    this.setTooltip("");
    this.setStyle("sensor_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['sensor_line_follower_left'] = {
  init: function () {
    this.appendDummyInput()
      .appendField(new Blockly.FieldImage(Sensors, 25, 25, { alt: "*", flipRtl: "FALSE" }))
      .appendField("Left Line Follower is")
      .appendField(new Blockly.FieldDropdown([["On", "On"], ["Off", "Off"]]), "Left Line Follower Value");
    this.setOutput(true, null);
    this.setInputsInline(true);
    this.setTooltip("");
    this.setStyle("sensor_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['communication_infrared_start'] = {
  init: function () {
    this.appendDummyInput()
      .appendField(new Blockly.FieldImage(COM, 25, 25, { alt: "*", flipRtl: "FALSE" }))
      .appendField(" start Infrared Communication");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(230);
    this.setTooltip("");
    this.setStyle("communication_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['communication_infrared_value'] = {
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

Blockly.Blocks['communication_bluetooth_start'] = {
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

Blockly.Blocks['communication_bluetooth_receive'] = {
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

Blockly.Blocks['communincation_bluetooth_send'] = {
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

Blockly.Blocks['sound_buzzer_buzz'] = {
  init: function () {
    this.appendDummyInput()
    .appendField(new Blockly.FieldImage(Sound, 25, 25, { alt: "*", flipRtl: "FALSE" }))
    .appendField("play note ")
      .appendField(new Blockly.FieldDropdown([["C6", "1047"], ["C#6", "1109"], ["D6", "1175"], ["Eb6", "1245"], ["E6", "1319"], ["F6", "1397"], ["F#6", "1480"], ["G6", "1568"], ["G#6", "1661"], ["A6", "1760"], ["Bb6", "1865"], ["B6", "1976"], ["C7", "2093"], ["C#7", "2217"], ["D7", "2349"], ["Eb7", "2489"], ["E7", "2637"], ["F7", "2794"], ["F#7", "2960"], ["G7", "3136"], ["G#7", "3322"], ["A7", "3520"], ["Bb7", "3729"], ["B7", "3951"], ["C8", "4186"]]), "Note");
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(230);
    this.setInputsInline(true);
    this.setTooltip("");
    this.setStyle("sound_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['sound_buzzer_timer'] = {
  init: function () {
    this.appendValueInput("Buzzer Time")
      .setCheck("Number")
      .appendField(new Blockly.FieldImage(Sound, 25, 25, { alt: "*", flipRtl: "FALSE" }))
      .appendField(" play note")
      .appendField(new Blockly.FieldDropdown([["C6", "1047"], ["C#6", "1109"], ["D6", "1175"], ["Eb6", "1245"], ["E6", "1319"], ["F6", "1397"], ["F#6", "1480"], ["G6", "1568"], ["G#6", "1661"], ["A6", "1760"], ["Bb6", "1865"], ["B6", "1976"], ["C7", "2093"], ["C#7", "2217"], ["D7", "2349"], ["Eb7", "2489"], ["E7", "2637"], ["F7", "2794"], ["F#7", "2960"], ["G7", "3136"], ["G#7", "3322"], ["A7", "3520"], ["Bb7", "3729"], ["B7", "3951"], ["C8", "4186"]]), "note")
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

Blockly.Blocks['sound_buzzer_stop'] = {
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

Blockly.Blocks['led_rgb_led'] = {
  init: function () {
    this.appendDummyInput()
    .appendField(new Blockly.FieldImage(LED, 25, 25, { alt: "*", flipRtl: "FALSE" }))
    .appendField(" set")
      .appendField(new Blockly.FieldDropdown([["Red", "Red"], ["Blue", "Blue"], ["Green", "Green"]]), "colour")
      .appendField("Light")
      .appendField(new Blockly.FieldDropdown([["On", "On"], ["Off", "Off"]]), "colour value");
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(230);
    this.setInputsInline(true);
    this.setTooltip("");
    this.setStyle("led_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['led_rgb_led_all'] = {
  init: function () {
    this.appendDummyInput()
    .appendField(new Blockly.FieldImage(LED, 25, 25, { alt: "*", flipRtl: "FALSE" }))
    .appendField(" set color to")
      .appendField(new Blockly.FieldDropdown([["Red", "Red"], ["Blue", "Blue"], ["Green", "Green"], ["Yellow", "Yellow"], ["Magenta", "Magenta"], ["Cyan", "Cyan"], ["Off", "Off"]]), "colour")
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(230);
    this.setInputsInline(true);
    this.setTooltip("");
    this.setStyle("led_blocks");
    this.setHelpUrl("");
  }
};

// Blockly.Blocks['led_neo_led'] = {
//   init: function() {
//     this.appendDummyInput()
//         .appendField(new Blockly.FieldImage("https://www.gstatic.com/codesite/ph/images/star_on.gif", 15, 15, { alt: "*", flipRtl: "FALSE" }))
//         .appendField("Set ")
//         .appendField(new Blockly.FieldDropdown([["Left","Left"], ["Right","Right"]]), "NeoPixel LED")
//         .appendField("NeoPixel LED to:");
//     this.appendValueInput("Red Value")
//         .setCheck(null)
//         .appendField("Red:");
//     this.appendValueInput("Green Value")
//         .setCheck(null)
//         .appendField("Green:");
//     this.appendValueInput("Blue Value")
//         .setCheck(null)
//         .appendField("Blue:");
//     this.setInputsInline(true);
//     this.setPreviousStatement(true, null);
//     this.setNextStatement(true, null);
//     this.setColour(230);
//  this.setTooltip("");
//  this.setHelpUrl("");
//   }
// };



Blockly.Blocks['motor_move_indef'] = {
  init: function () {
    this.appendDummyInput()
      .appendField(new Blockly.FieldImage(Actuators, 25, 25, { alt: "*", flipRtl: "FALSE" }))
      .appendField("")
      .appendField(new Blockly.FieldDropdown([["move forward", "forward"], ["move backward", "backward"], ["stop", "stop"], ["turn left", "left"], ["turn right", "right"], ["rotate left", "rleft"], ["rotate right", "rright"]]), "direction");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(120);
    this.setTooltip("");
    this.setStyle("actuator_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['motor_single_move_indef'] = {
  init: function () {
    this.appendDummyInput()
      .appendField(new Blockly.FieldImage(Actuators, 25, 25, { alt: "*", flipRtl: "FALSE" }))
      .appendField(" turn")
      .appendField(new Blockly.FieldDropdown([["Left Motor", "lm"], ["Right Motor", "rm"]]), "motorselect")
      .appendField(new Blockly.FieldDropdown([["forward", "forward"], ["backward", "backward"], ["to a stop", "stop"]]), "direction");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(120);
    this.setTooltip("");
    this.setStyle("actuator_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['motor_move_seconds'] = {
  init: function () {
    this.appendDummyInput()
      .appendField(new Blockly.FieldImage(Actuators, 25, 25, { alt: "*", flipRtl: "FALSE" }))
      .appendField("")
      .appendField(new Blockly.FieldDropdown([["move forward", "forward"], ["move backward", "backward"], ["stop", "stop"], ["rotate left", "rleft"], ["rotate right", "rright"]]), "direction");
    this.appendValueInput("seconds")
      .setCheck("Number")
      .appendField("for");
    this.appendDummyInput()
      .appendField("seconds");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(120);
    this.setTooltip("");
    this.setStyle("actuator_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['forklift_move_seconds'] = {
  init: function () {
    this.appendDummyInput()
      .appendField(new Blockly.FieldImage(Actuators, 25, 25, { alt: "*", flipRtl: "FALSE" }))
      .appendField(" rotate forklift")
      .appendField(new Blockly.FieldDropdown([["slowly", "slow"], ["moderately", "medium"], ["quickly", "fast"]]), "speed");
    this.appendValueInput("seconds")
      .setCheck("Number")
      .appendField("to");
    this.appendDummyInput()
      .appendField("degrees");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setColour(120);
    this.setTooltip("");
    this.setStyle("actuator_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['forklift_move_indef'] = {
  init: function () {
    this.appendDummyInput()
      .appendField(new Blockly.FieldImage(Actuators, 25, 25, { alt: "*", flipRtl: "FALSE" }))
      .appendField(" ")
      .appendField(new Blockly.FieldDropdown([["raise", "up"], ["lower", "down"], ["stop", "stop"]]), "direction")
      .appendField("the forklift ")
      .appendField(new Blockly.FieldDropdown([["slowly", "slow"], ["moderately", "medium"], ["quickly", "fast"]]), "speed");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setTooltip("");
    this.setStyle("actuator_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['servo_rotate_to_degrees'] = {
  init: function () {
    this.appendDummyInput()
      .appendField(new Blockly.FieldImage("https://www.gstatic.com/codesite/ph/images/star_on.gif", 15, 15, { alt: "*", flipRtl: "FALSE" }))
      .appendField("stop the Servo Motor");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setTooltip("");
    this.setStyle("actuator_blocks");
    this.setHelpUrl("");
  }
};

Blockly.Blocks['servo_360_rotate_direction'] = {
  init: function () {
    this.appendDummyInput()
      .appendField(new Blockly.FieldImage("https://www.gstatic.com/codesite/ph/images/star_on.gif", 15, 15, { alt: "*", flipRtl: "FALSE" }))
      .appendField(" rotate Servo Motor")
      .appendField(new Blockly.FieldDropdown([["clockwise", "cw"], ["anti-clockwise", "acw"]]), "direction")
      .appendField(new Blockly.FieldDropdown([["slowly", "slow"], ["moderately", "medium"], ["quickly", "fast"]]), "speed");
    this.setInputsInline(true);
    this.setPreviousStatement(true, null);
    this.setNextStatement(true, null);
    this.setTooltip("");
    this.setStyle("actuator_blocks");
    this.setHelpUrl("");
  }
};

// Blockly.Blocks['variable_set'] = {
//   init: function() {
//     this.appendDummyInput()
//         .appendField("Set Variable")
//         .appendField(new Blockly.FieldTextInput("var_name"), "varname");
//     this.appendValueInput("value")
//         .setCheck(["Number", "String"])
//         .appendField("to");
//     this.setInputsInline(true);
//     this.setPreviousStatement(true, null);
//     this.setNextStatement(true, null);
//     this.setColour(230);
//  this.setTooltip("");
//  this.setHelpUrl("");
//   }
// };

// Blockly.Blocks['variable_get'] = {
//   init: function() {
//     this.appendDummyInput()
//         .appendField("Get Variable")
//         .appendField(new Blockly.FieldTextInput("var_name"), "varname")
//         .appendField("'s value");
//     this.setInputsInline(true);
//     this.setOutput(true, null);
//     this.setColour(230);
//  this.setTooltip("");
//  this.setHelpUrl("");
//   }
// };

// Blockly.Blocks['variable_create_int'] = {
//   init: function() {
//     this.appendDummyInput()
//         .appendField("Create Integer Variable")
//         .appendField(new Blockly.FieldTextInput("var_name"), "varname");
//     this.setInputsInline(true);
//     this.setPreviousStatement(true, null);
//     this.setNextStatement(true, null);
//     this.setColour(230);
//  this.setTooltip("");
//  this.setHelpUrl("");
//   }
// };

// Blockly.Blocks['variable_create_float'] = {
//   init: function() {
//     this.appendDummyInput()
//         .appendField("Create Float Variable")
//         .appendField(new Blockly.FieldTextInput("var_name"), "varname");
//     this.setInputsInline(true);
//     this.setPreviousStatement(true, null);
//     this.setNextStatement(true, null);
//     this.setColour(230);
//  this.setTooltip("");
//  this.setHelpUrl("");
//   }
// };

