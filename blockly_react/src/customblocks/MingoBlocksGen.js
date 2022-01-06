import Blockly, { selected } from 'blockly';

//Peripheral Vars
var peripheral_PreDeclarations = "";
var peripheral_BulkFunctions = "";
var peripheral_SetupCode = "";

//Device Definitions
const IR_Remote = 3;
const LMotorEN = 4;
const RMotorEN = 7;
const LMotorPWM = 5;
const RMotorPWM = 6;
const Buzzer_Pin = 8;
const BluetoothTX = 12;
const BluetoothRX = 11;
const MainSLC = "A4";
const MainSDA = "A5";
const Port2 = ["A4", "A5", 2, 13];
const Port3 = ["A4", "A5", "A1", "A0"];
const Port4 = ["A4", "A5", "A3", "A2"];
const Port1 = ["A4", "A5", 9, 10];


//Setup Definitions
var DCMotorDefined = false;
var ServoDefined = false;
var NeoLEDDefined = false;
var MelodyDefined = false;
var UltrasonicDefined = false;
var InfraredDefined = false;
var BluetoothDefined = false;


function clearvars() {
    //Clear Variables
    peripheral_PreDeclarations = "";
    peripheral_BulkFunctions = "";
    peripheral_SetupCode = "";

    //Clear Definition Bools
    DCMotorDefined = false;
    ServoDefined = false;
    NeoLEDDefined = false;
    MelodyDefined = false;
    UltrasonicDefined = false;
    InfraredDefined = false;
    BluetoothDefined = false;

}

//Setups
const DCMotorSetup = {
    PreDec: `\n
    \n`,
    Setup: `\n
        pinMode(${LMotorEN}, OUTPUT);
        pinMode(${RMotorEN}, OUTPUT);
        pinMode(${LMotorPWM}, OUTPUT);
        pinMode(${LMotorPWM}, OUTPUT);
    \n`,
    Bulk: `\n`
}

const ServoSetup = {
    PreDec: `\n
    #include <Servo.h>
    Servo Grabber;
    \n`,
    Setup: `\n
    \n`,
    Bulk: `\n
    void open_grabber(float speed) {
        for (int i = 90; i > 0; i--) {
          if (i < 0) {
            i = 0;
          }
          Grabber.write(i);
          delay(90 / (speed * 1000));
        }
      }
      
      void close_grabber(float speed) {
        for (int i = 0; i < 90; i++) {
          if (i > 90) {
            i = 90;
          }
          Grabber.write(i);
          delay(90 / (speed * 1000));
        }
      }
    \n`
}

const NeoLEDSetup = {
    PreDec: `\n
    #include <Adafruit_NeoPixel.h>
    \n`,
    Setup: `\n
    pixels.begin();
    \n`,
    Bulk: `\n
    \n`
}

const MelodySetup = {
    PreDec: `\n
    #include <melody.h>
    MelodyPlayer mPlayer;
    int buzz = 8;
    \n`,
    Setup: `\n
    \n`,
    Bulk: `\n
    void SirenA(){
        for(int hz = 440; hz < 1000; hz+=25){
          tone(buzz, hz, 50);
          delay(5);
        }
        // Whoop down
        for(int hz = 1000; hz > 440; hz-=25){
          tone(buzz, hz, 50);
          delay(5);
        }
      }
      
      void SirenB(){
        for(int hz = 440; hz < 1000; hz++){
          tone(buzz, hz, 50);
          delay(5);
        }
        for(int hz = 1000; hz > 440; hz--){
          tone(buzz, hz, 50);
          delay(5);
          }
      }
    \n`
}

const UltrasonicSetup = {
    PreDec: `\n
    
    \n`,
    Setup: `\n
    
    \n`,
    Bulk: `\n
    int read_ultrasonic(int trigger, int echo){
        digitalWrite(trigger, LOW);
        delayMicroseconds(2);d 
        digitalWrite(trigger, HIGH);
        delayMicroseconds(10);
        digitalWrite(trigger, LOW);
        int duration = pulseIn(echo, HIGH);
        int distance = duration * 0.034 / 2;
        return distance;
    }
    \n`
}

const InfraredSetup = {
    PreDec: `\n
    #include <IRremote.h>\nint IR_Remote=${IR_Remote};
    \n`,
    Setup: `\n
    \tIrReceiver.begin(IR_Remote, ENABLE_LED_FEEDBACK);
    \n`,
    Bulk: `\n
    \n`,
    Loop: `\n
    \n`
}

const BluetoothSetup = {
    PreDec: `\n
    #include <SoftwareSerial.h>\nSoftwareSerial hc06(${BluetoothRX},${BluetoothTX});\nchar bdata = '.';
    \n`,
    Setup: `\n
    \thc06.begin(9600);
    \n`,
    Bulk: `\n
    \n`
}

Blockly.JavaScript["mingo_motor_move_indef"] = function (block) {
    var dropdown_direction = block.getFieldValue('direction');
    var dropdown_speed = block.getFieldValue('speed');

    if (DCMotorDefined === false) {
        if (block.getRootBlock().type == "m_mainloop") {
            peripheral_PreDeclarations += DCMotorSetup.PreDec;
            peripheral_SetupCode += DCMotorSetup.Setup;
            peripheral_BulkFunctions += DCMotorSetup.Bulk;
            DCMotorDefined = true;
        }
    }

    var code = '...;\n';
    switch (dropdown_direction) {
        case "forward":
            code = `
      digitalWrite(${LMotorEN}, HIGH);
      digitalWrite(${RMotorEN}, HIGH);
      analogWrite(${LMotorPWM},(int)((${dropdown_speed} * 255)/100));
      analogWrite(${RMotorPWM},(int)((${dropdown_speed} * 255)/100));
      \n`;
            break;
        case "backward":
            code = `
      digitalWrite(${LMotorEN}, LOW);
      digitalWrite(${RMotorEN}, LOW);
      analogWrite(${LMotorPWM},(int)((${dropdown_speed} * 255)/100));
      analogWrite(${RMotorPWM},(int)((${dropdown_speed} * 255)/100));
      \n`;
            break;
        case "left":
            code = `
      digitalWrite(${LMotorEN}, HIGH);
      digitalWrite(${RMotorEN}, HIGH);
      analogWrite(${LMotorPWM},0);
      analogWrite(${RMotorPWM},(int)((${dropdown_speed} * 255)/100));
      \n`;
            break;
        case "right":
            code = `
      digitalWrite(${LMotorEN}, HIGH);
      digitalWrite(${RMotorEN}, HIGH);
      analogWrite(${LMotorPWM},(int)((${dropdown_speed} * 255)/100));
      analogWrite(${RMotorPWM}, 0);
      \n`;
            break;
        case "rleft":
            code = `
      digitalWrite(${LMotorEN}, LOW);
      digitalWrite(${RMotorEN}, HIGH);
      analogWrite(${LMotorPWM},(int)((${dropdown_speed} * 255)/100));
      analogWrite(${RMotorPWM},(int)((${dropdown_speed} * 255)/100));
      \n`;
            break;
        case "rright":
            code = `
      digitalWrite(${LMotorEN}, HIGH);
      digitalWrite(${RMotorEN}, LOW);
      analogWrite(${LMotorPWM},(int)((${dropdown_speed} * 255)/100));
      analogWrite(${RMotorPWM},(int)((${dropdown_speed} * 255)/100));
      \n`;
            break;
    }
    return code;
}

Blockly.JavaScript["mingo_motor_single_move_indef"] = function (block) {
    var dropdown_motorselect = block.getFieldValue('motorselect');
    var dropdown_direction = block.getFieldValue('direction');
    var dropdown_speed = block.getFieldValue('speed');

    if (DCMotorDefined === false) {
        if (block.getRootBlock().type == "m_mainloop") {
            peripheral_PreDeclarations += DCMotorSetup.PreDec;
            peripheral_SetupCode += DCMotorSetup.Setup;
            peripheral_BulkFunctions += DCMotorSetup.Bulk;
            DCMotorDefined = true;
        }
    }

    var code = '...;\n';
    switch (dropdown_direction) {
        case "forward":
            if (dropdown_motorselect == "lm") {
                code = `
                    digitalWrite(${LMotorEN}, HIGH);
                    analogWrite(${LMotorPWM},(int)((${dropdown_speed} * 255)/100));
                    \n`;
            } else if (dropdown_motorselect == "rm") {
                code = `
                    digitalWrite(${RMotorEN}, HIGH);
                    analogWrite(${RMotorPWM},(int)((${dropdown_speed} * 255)/100));
                    \n`;
            }
            break;
        case "backward":
            if (dropdown_motorselect == "lm") {
                code = `
                    digitalWrite(${LMotorEN}, LOW);
                    analogWrite(${LMotorPWM},(int)((${dropdown_speed} * 255)/100));
                    \n`;
            } else if (dropdown_motorselect == "rm") {
                code = `
                    digitalWrite(${RMotorEN}, LOW);
                    analogWrite(${RMotorPWM},(int)((${dropdown_speed} * 255)/100));
                    \n`;
            }
            break;
        case "stop":
            if (dropdown_motorselect == "lm") {
                code = `
                    digitalWrite(${LMotorEN}, HIGH);
                    analogWrite(${LMotorPWM},0);
                    \n`;
            } else if (dropdown_motorselect == "rm") {
                code = `
                    digitalWrite(${RMotorEN}, HIGH);
                    analogWrite(${RMotorPWM},0);
                    \n`;
            }
            break;
    }
    return code;
}

Blockly.JavaScript["mingo_motor_stop_indef"] = function (block) {
    var dropdown_motorselect = block.getFieldValue('motor');

    if (DCMotorDefined === false) {
        if (block.getRootBlock().type == "m_mainloop") {
            peripheral_PreDeclarations += DCMotorSetup.PreDec;
            peripheral_SetupCode += DCMotorSetup.Setup;
            peripheral_BulkFunctions += DCMotorSetup.Bulk;
            DCMotorDefined = true;
        }
    }

    var code = '...;\n';
    switch (dropdown_motorselect) {
        case "all":
            code = `
                digitalWrite(${LMotorEN}, HIGH);
                analogWrite(${LMotorPWM},0);
                digitalWrite(${RMotorEN}, HIGH);
                analogWrite(${RMotorPWM},0);
                \n`;
            break;
        case "left":
            code = `
                digitalWrite(${LMotorEN}, HIGH);
                analogWrite(${LMotorPWM},0);
                \n`;
            break;
        case "right":
            code = `
                digitalWrite(${RMotorEN}, HIGH);
                analogWrite(${RMotorPWM},0);
                \n`;
            break;
    }
    return code;
}

Blockly.JavaScript["mingo_grabber_move"] = function (block) {
    var dropdown_action = block.getFieldValue('action');
    var dropdown_port = block.getFieldValue('port');

    if (ServoDefined === false) {
        if (block.getRootBlock().type == "m_mainloop") {

            switch (dropdown_port) {
                case "1":
                    ServoSetup.Setup = `\n
                    Grabber.attach(${Port1[2]})
                    \n`
                    break;
                case "2":
                    ServoSetup.Setup = `\n
                    Grabber.attach(${Port2[2]})
                    \n`
                    break;
            }


            peripheral_PreDeclarations += ServoSetup.PreDec;
            peripheral_SetupCode += ServoSetup.Setup;
            peripheral_BulkFunctions += ServoSetup.Bulk;

            ServoDefined = true;
        }
    }

    var code = '...;\n';
    switch (dropdown_action) {
        case "open":
            code = `open_grabber(50);\n`
            break;
        case "close":
            code = `close_grabber(50);\n`
            break;
    }

    return code;
}

Blockly.JavaScript["mingo_led_range"] = function (block) {
    var ledSelect = block.getFieldValue('ledSelect');
    var port = block.getFieldValue('port');
    var red = Blockly.JavaScript.valueToCode(block, 'red', Blockly.JavaScript.ORDER_ATOMIC);
    var green = Blockly.JavaScript.valueToCode(block, 'green', Blockly.JavaScript.ORDER_ATOMIC);
    var blue = Blockly.JavaScript.valueToCode(block, 'blue', Blockly.JavaScript.ORDER_ATOMIC);

    if (NeoLEDDefined === false) {
        if (block.getRootBlock().type == "m_mainloop") {

            switch (port) {
                case "1":
                    NeoLEDSetup.Setup = `\n
                    Adafruit_NeoPixel pixels(2, ${Port1[3]}, NEO_GRB + NEO_KHZ800);
                    \n`
                    break;
                case "2":
                    NeoLEDSetup.Setup = `\n
                    Adafruit_NeoPixel pixels(2, ${Port2[3]}, NEO_GRB + NEO_KHZ800);
                    \n`
                    break;
            }


            peripheral_PreDeclarations += NeoLEDSetup.PreDec;
            peripheral_SetupCode += NeoLEDSetup.Setup;
            peripheral_BulkFunctions += NeoLEDSetup.Bulk;

            NeoLEDDefined = true;
        }
    }

    var code = '...;\n';

    switch (ledSelect) {
        case "all":
            code = `
            pixels.setPixelColor(0,pixels.Color(${red},${green}, ${blue}));
            pixels.setPixelColor(1,pixels.Color(${red},${green}, ${blue}));
            pixels.show();
            \n`
            break;
        case "left":
            code = `
            pixels.setPixelColor(0,pixels.Color(${red},${green}, ${blue}));
            pixels.show();
            \n`
            break;
        case "right":
            code = `
            pixels.setPixelColor(1,pixels.Color(${red},${green}, ${blue}));
            pixels.show();
            \n`
            break;
    }

    return code;
}

Blockly.JavaScript["mingo_led_definite"] = function (block) {
    var ledSelect = block.getFieldValue('ledSelect');
    var port = block.getFieldValue('port');
    var colorSelect = block.getFieldValue('colorSelect');

    if (NeoLEDDefined === false) {
        if (block.getRootBlock().type == "m_mainloop") {

            switch (port) {
                case "1":
                    NeoLEDSetup.Setup = `\n
                    Adafruit_NeoPixel pixels(2, ${Port1[3]}, NEO_GRB + NEO_KHZ800);
                    \n`
                    break;
                case "2":
                    NeoLEDSetup.Setup = `\n
                    Adafruit_NeoPixel pixels(2, ${Port2[3]}, NEO_GRB + NEO_KHZ800);
                    \n`
                    break;
            }


            peripheral_PreDeclarations += NeoLEDSetup.PreDec;
            peripheral_SetupCode += NeoLEDSetup.Setup;
            peripheral_BulkFunctions += NeoLEDSetup.Bulk;

            NeoLEDDefined = true;
        }
    }

    var code = '...;\n';
    var colorCode = '';

    switch (colorSelect) {
        case "red":
            colorCode = '1, 0 , 0';
            break;
        case "green":
            colorCode = '0, 1 , 0';
            break;
        case "blue":
            colorCode = '0, 0 , 1';
            break;
        case "none":
            colorCode = '0, 0 , 0';
            break;
    }

    switch (ledSelect) {
        case "all":
            code = `
            pixels.setPixelColor(0,pixels.Color(${colorCode}));
            pixels.setPixelColor(1,pixels.Color(${colorCode}));
            pixels.show();
            \n`
            break;
        case "left":
            code = `
            pixels.setPixelColor(0,pixels.Color(${colorCode}));
            pixels.show();
            \n`
            break;
        case "right":
            code = `
            pixels.setPixelColor(1,pixels.Color(${colorCode}));
            pixels.show();
            \n`
            break;
    }

    return code;
}

Blockly.JavaScript["mingo_sound_play"] = function (block) {
    var note = block.getFieldValue('note');

    var code = `tone(${Buzzer_Pin}, ${note});\n`;

    return code;
}

Blockly.JavaScript["mingo_sound_play_timed"] = function (block) {
    var note = block.getFieldValue('note');
    var value_buzzer_time = Blockly.JavaScript.valueToCode(block, 'Buzzer Time', Blockly.JavaScript.ORDER_ATOMIC);

    var code = `tone(${Buzzer_Pin}, ${note});\ndelay(${value_buzzer_time * 1000});\nnoTone(${Buzzer_Pin});`;

    return code;
}

Blockly.JavaScript["mingo_sound_stop"] = function (block) {
    var code = `\tnoTone(${Buzzer_Pin});\n`;

    return code;
}

Blockly.JavaScript["mingo_sound_play_song"] = function (block) {
    var song = block.getFieldValue('song');

    if (MelodyDefined === false) {
        if (block.getRootBlock().type == "m_mainloop") {
            peripheral_PreDeclarations += MelodySetup.PreDec;
            peripheral_SetupCode += MelodySetup.Setup;
            peripheral_BulkFunctions += MelodySetup.Bulk;
            MelodyDefined = true;
        }
    }

    var code = `...\n`;
    switch (song) {
        case "merry":
            code = `
            int MerryChristmas[]= {
                NOTE_C5, 4,  //1
                NOTE_F5, 4, NOTE_F5, 8, NOTE_G5, 8, NOTE_F5, 8, NOTE_E5, 8,
                NOTE_D5, 4, NOTE_D5, 4, NOTE_D5, 4,
                NOTE_G5, 4, NOTE_G5, 8, NOTE_A5, 8, NOTE_G5, 8, NOTE_F5, 8,
                NOTE_E5, 4, NOTE_C5, 4, NOTE_C5, 4,
                NOTE_A5, 4, NOTE_A5, 8, NOTE_AS5, 8, NOTE_A5, 8, NOTE_G5, 8,
                NOTE_F5, 4, NOTE_D5, 4, NOTE_C5, 8, NOTE_C5, 8,
                NOTE_D5, 4, NOTE_G5, 4, NOTE_E5, 4,
              
                NOTE_F5, 2, NOTE_C5, 4,  //8
                NOTE_F5, 4, NOTE_F5, 8, NOTE_G5, 8, NOTE_F5, 8, NOTE_E5, 8,
                NOTE_D5, 4, NOTE_D5, 4, NOTE_D5, 4,
                NOTE_G5, 4, NOTE_G5, 8, NOTE_A5, 8, NOTE_G5, 8, NOTE_F5, 8,
                NOTE_E5, 4, NOTE_C5, 4, NOTE_C5, 4,
                NOTE_A5, 4, NOTE_A5, 8, NOTE_AS5, 8, NOTE_A5, 8, NOTE_G5, 8,
                NOTE_F5, 4, NOTE_D5, 4, NOTE_C5, 8, NOTE_C5, 8,
                NOTE_D5, 4, NOTE_G5, 4, NOTE_E5, 4,
                NOTE_F5, 2, NOTE_C5, 4,
              
                NOTE_F5, 4, NOTE_F5, 4, NOTE_F5, 4,  //17
                NOTE_E5, 2, NOTE_E5, 4,
                NOTE_F5, 4, NOTE_E5, 4, NOTE_D5, 4,
                NOTE_C5, 2, NOTE_A5, 4,
                NOTE_AS5, 4, NOTE_A5, 4, NOTE_G5, 4,
                NOTE_C6, 4, NOTE_C5, 4, NOTE_C5, 8, NOTE_C5, 8,
                NOTE_D5, 4, NOTE_G5, 4, NOTE_E5, 4,
                NOTE_F5, 2, NOTE_C5, 4,
                NOTE_F5, 4, NOTE_F5, 8, NOTE_G5, 8, NOTE_F5, 8, NOTE_E5, 8,
                NOTE_D5, 4, NOTE_D5, 4, NOTE_D5, 4,
              
                NOTE_G5, 4, NOTE_G5, 8, NOTE_A5, 8, NOTE_G5, 8, NOTE_F5, 8,  //27
                NOTE_E5, 4, NOTE_C5, 4, NOTE_C5, 4,
                NOTE_A5, 4, NOTE_A5, 8, NOTE_AS5, 8, NOTE_A5, 8, NOTE_G5, 8,
                NOTE_F5, 4, NOTE_D5, 4, NOTE_C5, 8, NOTE_C5, 8,
                NOTE_D5, 4, NOTE_G5, 4, NOTE_E5, 4,
                NOTE_F5, 2, NOTE_C5, 4,
                NOTE_F5, 4, NOTE_F5, 4, NOTE_F5, 4,
                NOTE_E5, 2, NOTE_E5, 4,
                NOTE_F5, 4, NOTE_E5, 4, NOTE_D5, 4,
              
                NOTE_C5, 2, NOTE_A5, 4,  //36
                NOTE_AS5, 4, NOTE_A5, 4, NOTE_G5, 4,
                NOTE_C6, 4, NOTE_C5, 4, NOTE_C5, 8, NOTE_C5, 8,
                NOTE_D5, 4, NOTE_G5, 4, NOTE_E5, 4,
                NOTE_F5, 2, NOTE_C5, 4,
                NOTE_F5, 4, NOTE_F5, 8, NOTE_G5, 8, NOTE_F5, 8, NOTE_E5, 8,
                NOTE_D5, 4, NOTE_D5, 4, NOTE_D5, 4,
                NOTE_G5, 4, NOTE_G5, 8, NOTE_A5, 8, NOTE_G5, 8, NOTE_F5, 8,
                NOTE_E5, 4, NOTE_C5, 4, NOTE_C5, 4,
              
                NOTE_A5, 4, NOTE_A5, 8, NOTE_AS5, 8, NOTE_A5, 8, NOTE_G5, 8,  //45
                NOTE_F5, 4, NOTE_D5, 4, NOTE_C5, 8, NOTE_C5, 8,
                NOTE_D5, 4, NOTE_G5, 4, NOTE_E5, 4,
                NOTE_F5, 2, NOTE_C5, 4,
                NOTE_F5, 4, NOTE_F5, 8, NOTE_G5, 8, NOTE_F5, 8, NOTE_E5, 8,
                NOTE_D5, 4, NOTE_D5, 4, NOTE_D5, 4,
                NOTE_G5, 4, NOTE_G5, 8, NOTE_A5, 8, NOTE_G5, 8, NOTE_F5, 8,
                NOTE_E5, 4, NOTE_C5, 4, NOTE_C5, 4,
              
                NOTE_A5, 4, NOTE_A5, 8, NOTE_AS5, 8, NOTE_A5, 8, NOTE_G5, 8,  //53
                NOTE_F5, 4, NOTE_D5, 4, NOTE_C5, 8, NOTE_C5, 8,
                NOTE_D5, 4, NOTE_G5, 4, NOTE_E5, 4,
                NOTE_F5, 2, REST, 4
              };
            mPlayer.play_melody(140, MerryChristmas,sizeof(MerryChristmas)/sizeof(MerryChristmas[0]));\n`;
            break;
        case "bday":
            code = `
            int HappyBirthday[] = {
                NOTE_C4,4, NOTE_C4,8, 
                NOTE_D4,-4, NOTE_C4,-4, NOTE_F4,-4,
                NOTE_E4,-2, NOTE_C4,4, NOTE_C4,8, 
                NOTE_D4,-4, NOTE_C4,-4, NOTE_G4,-4,
                NOTE_F4,-2, NOTE_C4,4, NOTE_C4,8,
            
                NOTE_C5,-4, NOTE_A4,-4, NOTE_F4,-4, 
                NOTE_E4,-4, NOTE_D4,-4, NOTE_AS4,4, NOTE_AS4,8,
                NOTE_A4,-4, NOTE_F4,-4, NOTE_G4,-4,
                NOTE_F4,-2,
              };
            mPlayer.play_melody(180, HappyBirthday,sizeof(HappyBirthday)/sizeof(HappyBirthday[0]));\n`;
            break;
        case "furelise":
            code = `
                const int FurElise[] = {
                // Fur Elise - Ludwig van Beethovem
                //starts from 1 ending on 9
                NOTE_E5, 16, NOTE_DS5, 16, //1
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_A4, -8, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16,
                NOTE_B4, -8, NOTE_E4, 16, NOTE_GS4, 16, NOTE_B4, 16,
                NOTE_C5, 8,  REST, 16, NOTE_E4, 16, NOTE_E5, 16,  NOTE_DS5, 16,
                
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,//6
                NOTE_A4, -8, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16, 
                NOTE_B4, -8, NOTE_E4, 16, NOTE_C5, 16, NOTE_B4, 16, 
                NOTE_A4 , 4, REST, 8, //9 - 1st ending
                //repaets from 1 ending on 10
                NOTE_E5, 16, NOTE_DS5, 16, //1
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_A4, -8, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16,
                NOTE_B4, -8, NOTE_E4, 16, NOTE_GS4, 16, NOTE_B4, 16,
                NOTE_C5, 8,  REST, 16, NOTE_E4, 16, NOTE_E5, 16,  NOTE_DS5, 16,
                
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,//6
                NOTE_A4, -8, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16, 
                NOTE_B4, -8, NOTE_E4, 16, NOTE_C5, 16, NOTE_B4, 16, 
                NOTE_A4, 8, REST, 16, NOTE_B4, 16, NOTE_C5, 16, NOTE_D5, 16, //10 - 2nd ending
                //continues from 11
                NOTE_E5, -8, NOTE_G4, 16, NOTE_F5, 16, NOTE_E5, 16, 
                NOTE_D5, -8, NOTE_F4, 16, NOTE_E5, 16, NOTE_D5, 16, //12
                
                NOTE_C5, -8, NOTE_E4, 16, NOTE_D5, 16, NOTE_C5, 16, //13
                NOTE_B4, 8, REST, 16, NOTE_E4, 16, NOTE_E5, 16, REST, 16,
                REST, 16, NOTE_E5, 16, NOTE_E6, 16, REST, 16, REST, 16, NOTE_DS5, 16,
                NOTE_E5, 16, REST, 16, REST, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_DS5, 16,
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_A4, 8, REST, 16, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16,
                
                NOTE_B4, 8, REST, 16, NOTE_E4, 16, NOTE_GS4, 16, NOTE_B4, 16, //19
                NOTE_C5, 8, REST, 16, NOTE_E4, 16, NOTE_E5, 16,  NOTE_DS5, 16,
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_A4, 8, REST, 16, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16,
                NOTE_B4, 8, REST, 16, NOTE_E4, 16, NOTE_C5, 16, NOTE_B4, 16,
                NOTE_A4, 8, REST, 16, NOTE_B4, 16, NOTE_C5, 16, NOTE_D5, 16, //24 (1st ending)
                
                //repeats from 11
                NOTE_E5, -8, NOTE_G4, 16, NOTE_F5, 16, NOTE_E5, 16, 
                NOTE_D5, -8, NOTE_F4, 16, NOTE_E5, 16, NOTE_D5, 16, //12
                
                NOTE_C5, -8, NOTE_E4, 16, NOTE_D5, 16, NOTE_C5, 16, //13
                NOTE_B4, 8, REST, 16, NOTE_E4, 16, NOTE_E5, 16, REST, 16,
                REST, 16, NOTE_E5, 16, NOTE_E6, 16, REST, 16, REST, 16, NOTE_DS5, 16,
                NOTE_E5, 16, REST, 16, REST, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_DS5, 16,
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_A4, 8, REST, 16, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16,
                
                NOTE_B4, 8, REST, 16, NOTE_E4, 16, NOTE_GS4, 16, NOTE_B4, 16, //19
                NOTE_C5, 8, REST, 16, NOTE_E4, 16, NOTE_E5, 16,  NOTE_DS5, 16,
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_A4, 8, REST, 16, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16,
                NOTE_B4, 8, REST, 16, NOTE_E4, 16, NOTE_C5, 16, NOTE_B4, 16,
                NOTE_A4, 8, REST, 16, NOTE_C5, 16, NOTE_C5, 16, NOTE_C5, 16, //25 - 2nd ending
                //continues from 26
                NOTE_C5 , 4, NOTE_F5, -16, NOTE_E5, 32, //26
                NOTE_E5, 8, NOTE_D5, 8, NOTE_AS5, -16, NOTE_A5, 32,
                NOTE_A5, 16, NOTE_G5, 16, NOTE_F5, 16, NOTE_E5, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_AS4, 8, NOTE_A4, 8, NOTE_A4, 32, NOTE_G4, 32, NOTE_A4, 32, NOTE_B4, 32,
                NOTE_C5 , 4, NOTE_D5, 16, NOTE_DS5, 16,
                NOTE_E5, -8, NOTE_E5, 16, NOTE_F5, 16, NOTE_A4, 16,
                NOTE_C5 , 4,  NOTE_D5, -16, NOTE_B4, 32,
                
                
                NOTE_C5, 32, NOTE_G5, 32, NOTE_G4, 32, NOTE_G5, 32, NOTE_A4, 32, NOTE_G5, 32, NOTE_B4, 32, NOTE_G5, 32, NOTE_C5, 32, NOTE_G5, 32, NOTE_D5, 32, NOTE_G5, 32, //33
                NOTE_E5, 32, NOTE_G5, 32, NOTE_C6, 32, NOTE_B5, 32, NOTE_A5, 32, NOTE_G5, 32, NOTE_F5, 32, NOTE_E5, 32, NOTE_D5, 32, NOTE_G5, 32, NOTE_F5, 32, NOTE_D5, 32,
                NOTE_C5, 32, NOTE_G5, 32, NOTE_G4, 32, NOTE_G5, 32, NOTE_A4, 32, NOTE_G5, 32, NOTE_B4, 32, NOTE_G5, 32, NOTE_C5, 32, NOTE_G5, 32, NOTE_D5, 32, NOTE_G5, 32,
                NOTE_E5, 32, NOTE_G5, 32, NOTE_C6, 32, NOTE_B5, 32, NOTE_A5, 32, NOTE_G5, 32, NOTE_F5, 32, NOTE_E5, 32, NOTE_D5, 32, NOTE_G5, 32, NOTE_F5, 32, NOTE_D5, 32, //36
                NOTE_E5, 32, NOTE_F5, 32, NOTE_E5, 32, NOTE_DS5, 32, NOTE_E5, 32, NOTE_B4, 32, NOTE_E5, 32, NOTE_DS5, 32, NOTE_E5, 32, NOTE_B4, 32, NOTE_E5, 32, NOTE_DS5, 32,
                NOTE_E5, -8, NOTE_B4, 16, NOTE_E5, 16, NOTE_DS5, 16,
                NOTE_E5, -8, NOTE_B4, 16, NOTE_E5, 16, REST, 16,
                REST, 16, NOTE_DS5, 16, NOTE_E5, 16, REST, 16, REST, 16, NOTE_DS5, 16, //40
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_A4, 8, REST, 16, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16,
                NOTE_B4, 8, REST, 16, NOTE_E4, 16, NOTE_GS4, 16, NOTE_B4, 16,
                NOTE_C5, 8, REST, 16, NOTE_E4, 16, NOTE_E5, 16, NOTE_DS5, 16,
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_A4, 8, REST, 16, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16, //46
                NOTE_B4, 8, REST, 16, NOTE_E4, 16, NOTE_C5, 16, NOTE_B4, 16,
                NOTE_A4, 8, REST, 16, NOTE_B4, 16, NOTE_C5, 16, NOTE_D5, 16,
                NOTE_E5, -8, NOTE_G4, 16, NOTE_F5, 16, NOTE_E5, 16,
                NOTE_D5, -8, NOTE_F4, 16, NOTE_E5, 16, NOTE_D5, 16,
                NOTE_C5, -8, NOTE_E4, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_B4, 8, REST, 16, NOTE_E4, 16, NOTE_E5, 16, REST, 16,
                REST, 16, NOTE_E5, 16, NOTE_E6, 16, REST, 16, REST, 16, NOTE_DS5, 16,
                NOTE_E5, 16, REST, 16, REST, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_D5, 16, //54
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_A4, 8, REST, 16, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16,
                NOTE_B4, 8, REST, 16, NOTE_E4, 16, NOTE_GS4, 16, NOTE_B4, 16,
                NOTE_C5, 8, REST, 16, NOTE_E4, 16, NOTE_E5, 16, NOTE_DS5, 16,
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,
                
                NOTE_A4, 8, REST, 16, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16, //60
                NOTE_B4, 8, REST, 16, NOTE_E4, 16, NOTE_C5, 16, NOTE_B4, 16,
                NOTE_A4, 8, REST, 16, REST, 16, REST, 8, 
                NOTE_CS5 , -4, 
                NOTE_D5 , 4, NOTE_E5, 16, NOTE_F5, 16,
                NOTE_F5 , 4, NOTE_F5, 8, 
                NOTE_E5 , -4,
                NOTE_D5 , 4, NOTE_C5, 16, NOTE_B4, 16,
                NOTE_A4 , 4, NOTE_A4, 8,
                NOTE_A4, 8, NOTE_C5, 8, NOTE_B4, 8,
                NOTE_A4 , -4,
                NOTE_CS5 , -4,
                NOTE_D5 , 4, NOTE_E5, 16, NOTE_F5, 16, //72
                NOTE_F5 , 4, NOTE_F5, 8,
                NOTE_F5 , -4,
                NOTE_DS5 , 4, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_AS4 , 4, NOTE_A4, 8,
                NOTE_GS4 , 4, NOTE_G4, 8,
                NOTE_A4 , -4,
                NOTE_B4 , 4, REST, 8,
                NOTE_A3, -32, NOTE_C4, -32, NOTE_E4, -32, NOTE_A4, -32, NOTE_C5, -32, NOTE_E5, -32, NOTE_D5, -32, NOTE_C5, -32, NOTE_B4, -32,
                NOTE_A4, -32, NOTE_C5, -32, NOTE_E5, -32, NOTE_A5, -32, NOTE_C6, -32, NOTE_E6, -32, NOTE_D6, -32, NOTE_C6, -32, NOTE_B5, -32, //80
                NOTE_A4, -32, NOTE_C5, -32, NOTE_E5, -32, NOTE_A5, -32, NOTE_C6, -32, NOTE_E6, -32, NOTE_D6, -32, NOTE_C6, -32, NOTE_B5, -32,
                NOTE_AS5, -32, NOTE_A5, -32, NOTE_GS5, -32, NOTE_G5, -32, NOTE_FS5, -32, NOTE_F5, -32, NOTE_E5, -32, NOTE_DS5, -32, NOTE_D5, -32,
                NOTE_CS5, -32, NOTE_C5, -32, NOTE_B4, -32, NOTE_AS4, -32, NOTE_A4, -32, NOTE_GS4, -32, NOTE_G4, -32, NOTE_FS4, -32, NOTE_F4, -32, //84
                NOTE_E4, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_A4, -8, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16,
                NOTE_B4, -8, NOTE_E4, 16, NOTE_GS4, 16, NOTE_B4, 16,
                NOTE_C5, 8, REST, 16, NOTE_E4, 16, NOTE_E5, 16, NOTE_DS5, 16, //88
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16, 
                NOTE_A4, -8, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16, 
                NOTE_B4, -8, NOTE_E4, 16, NOTE_C5, 16, NOTE_B4, 16, 
                NOTE_A4, -8, REST, -8,
                REST, -8, NOTE_G4, 16, NOTE_F5, 16, NOTE_E5, 16,
                NOTE_D5 , 4, REST, 8,
                REST, -8, NOTE_E4, 16, NOTE_D5, 16, NOTE_C5, 16,
                
                NOTE_B4, -8, NOTE_E4, 16, NOTE_E5, 8, //96
                NOTE_E5, 8, NOTE_E6, -8, NOTE_DS5, 16,
                NOTE_E5, 16, REST, 16, REST, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_DS5, 16,
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_A4, -8, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16,
                NOTE_B4, -8, NOTE_E4, 16, NOTE_GS4, 16, NOTE_B4, 16,
                NOTE_C5, 8, REST, 16, NOTE_E4, 16, NOTE_E5, 16, NOTE_DS5, 16, //102
                NOTE_E5, 16, NOTE_DS5, 16, NOTE_E5, 16, NOTE_B4, 16, NOTE_D5, 16, NOTE_C5, 16,
                NOTE_A4, -8, NOTE_C4, 16, NOTE_E4, 16, NOTE_A4, 16,
                NOTE_B4, -8, NOTE_E4, 16, NOTE_C5, 16, NOTE_B4, 16,
                NOTE_A4 , -4,
              };
              mPlayer.play_melody(80, FurElise,sizeof(FurElise)/sizeof(FurElise[0]));`
            break;
        case "silent":
            code = `
            int silentNight[] = {

                // Silent Night, Original Version
                // Score available at https://musescore.com/marcsabatella/scores/3123436
              
                NOTE_G4,-4, NOTE_A4,8, NOTE_G4,4,
                NOTE_E4,-2, 
                NOTE_G4,-4, NOTE_A4,8, NOTE_G4,4,
                NOTE_E4,-2, 
                NOTE_D5,2, NOTE_D5,4,
                NOTE_B4,-2,
                NOTE_C5,2, NOTE_C5,4,
                NOTE_G4,-2,
              
                NOTE_A4,2, NOTE_A4,4,
                NOTE_C5,-4, NOTE_B4,8, NOTE_A4,4,
                NOTE_G4,-4, NOTE_A4,8, NOTE_G4,4,
                NOTE_E4,-2, 
                NOTE_A4,2, NOTE_A4,4,
                NOTE_C5,-4, NOTE_B4,8, NOTE_A4,4,
                NOTE_G4,-4, NOTE_A4,8, NOTE_G4,4,
                NOTE_E4,-2, 
                
                NOTE_D5,2, NOTE_D5,4,
                NOTE_F5,-4, NOTE_D5,8, NOTE_B4,4,
                NOTE_C5,-2,
                NOTE_E5,-2,
                NOTE_C5,4, NOTE_G4,4, NOTE_E4,4,
                NOTE_G4,-4, NOTE_F4,8, NOTE_D4,4,
                NOTE_C4,-2,
                NOTE_C4,-1,
              };
            mPlayer.play_melody(144, silentNight,sizeof(silentNight)/sizeof(silentNight[0]));`
            break;
        case "lion":
            code = `
            int lionSleepsTonight[] = {
                // The Lion Sleeps Tonight
               
                NOTE_F4, 4, NOTE_G4, 4, NOTE_A4, 8, NOTE_G4, 4, NOTE_A4, 8, //1
                NOTE_AS4, 4, NOTE_A4, 4, NOTE_G4, 8, NOTE_F4, 4, NOTE_G4, 8,
                NOTE_A4, 4, NOTE_C4, 8, NOTE_C4, 4, NOTE_C4, 8, NOTE_C4, 4,
                NOTE_C4, 1, //1st ending
                NOTE_F4, 4, NOTE_G4, 4, NOTE_A4, 8, NOTE_G4, 4, NOTE_A4, 8, //repeats from 1
                NOTE_AS4, 4, NOTE_A4, 4, NOTE_G4, 8, NOTE_F4, 4, NOTE_G4, 8,
                NOTE_A4, 4, NOTE_C4, 8, NOTE_C4, 4, NOTE_C4, 8, NOTE_C4, 4,
                NOTE_C4, -2,  REST, -8, NOTE_A4, 16, //2nd ending
                NOTE_A4, -8, NOTE_A4, 16, NOTE_A4, -8, NOTE_A4, 16, NOTE_A4, -8, NOTE_A4, 16, NOTE_A4, -8, NOTE_A4, 16, //6
                NOTE_AS4, -8, NOTE_AS4, 16, NOTE_AS4, -8, NOTE_AS4, 16, NOTE_AS4, -8, NOTE_AS4, 16, NOTE_AS4, -8, NOTE_AS4, 16,
                NOTE_A4, -8, NOTE_A4, 16, NOTE_A4, -8, NOTE_A4, 16, NOTE_A4, -8, NOTE_A4, 16, NOTE_A4, -8, NOTE_A4, 16,
                NOTE_G4, -8, NOTE_G4, 16, NOTE_G4, -8, NOTE_G4, 16, NOTE_G4, -8, NOTE_G4, 16, NOTE_G4, -8, NOTE_G4, 16,
                NOTE_A4, -8, NOTE_A4, 16, NOTE_A4, -8, NOTE_A4, 16, NOTE_A4, -8, NOTE_A4, 16, NOTE_A4, -8, NOTE_A4, 16, //10
                NOTE_AS4, -8, NOTE_AS4, 16, NOTE_AS4, -8, NOTE_AS4, 16, NOTE_AS4, -8, NOTE_AS4, 16, NOTE_AS4, -8, NOTE_AS4, 16,
                NOTE_A4, -8, NOTE_A4, 16, NOTE_A4, -8, NOTE_A4, 16, NOTE_A4, -8, NOTE_A4, 16, NOTE_A4, -8, NOTE_A4, 16,
                NOTE_G4, -8, NOTE_G4, 16, NOTE_G4, -8, NOTE_G4, 16, NOTE_G4, -8, NOTE_G4, 16, NOTE_G4, -8, NOTE_G4, 16,
                NOTE_F4, 4, NOTE_G4, 4, NOTE_A4, 8, NOTE_G4, 4, NOTE_A4, 8, //14
                NOTE_AS4, 4, NOTE_A4, 4, NOTE_G4, 8, NOTE_F4, 4, NOTE_G4, 8,
                NOTE_A4, 4, NOTE_G4, 4, NOTE_F4, 4, NOTE_A4, 4,
                NOTE_G4, 1,
                NOTE_C5, 4, NOTE_A4, 4, NOTE_G4, 8, NOTE_A4, 4, NOTE_C5, 8,
                NOTE_AS4, 4, NOTE_A4, 4, NOTE_G4, 8, NOTE_F4, 4, NOTE_G4, 8,
                NOTE_A4, 4, NOTE_G4, 4, NOTE_F4, 4, NOTE_A4, 4,
                NOTE_G4, 1,
                NOTE_C5, 1, //22
                NOTE_C5, 4, NOTE_AS4, 8, NOTE_C5, 8, NOTE_AS4, 2,
                NOTE_A4, 4, NOTE_C4, 8, NOTE_C4, 4, NOTE_C4, 8, NOTE_C4, 4,
                NOTE_C4, 1,
                REST, 4, NOTE_A4, 8, NOTE_G4, 8, NOTE_F4, 8, NOTE_E4, 8, NOTE_D4, 8, NOTE_C4, 8, 
                NOTE_D4, 1,
                REST, 4, NOTE_A4, 8, NOTE_G4, 8, NOTE_F4, 8, NOTE_E4, 8, NOTE_D4, 8, NOTE_C4, 8, 
                NOTE_D4, 1,
                NOTE_F4, 4, NOTE_G4, 4, NOTE_A4, 8, NOTE_G4, 4, NOTE_A4, 8, //repeats from 14
                NOTE_AS4, 4, NOTE_A4, 4, NOTE_G4, 8, NOTE_F4, 4, NOTE_G4, 8,
                NOTE_A4, 4, NOTE_G4, 4, NOTE_F4, 4, NOTE_A4, 4,
                NOTE_G4, 1,
                NOTE_C5, 4, NOTE_A4, 4, NOTE_G4, 8, NOTE_A4, 4, NOTE_C5, 8,
                NOTE_AS4, 4, NOTE_A4, 4, NOTE_G4, 8, NOTE_F4, 4, NOTE_G4, 8,
                NOTE_A4, 4, NOTE_G4, 4, NOTE_F4, 4, NOTE_A4, 4,
                NOTE_G4, 1,
                NOTE_C5, 1, //22
                NOTE_C5, 4, NOTE_AS4, 8, NOTE_C5, 8, NOTE_AS4, 2,
                NOTE_A4, 4, NOTE_C4, 8, NOTE_C4, 4, NOTE_C4, 8, NOTE_C4, 4,
                NOTE_C4, 1,
                REST, 4, NOTE_A4, 8, NOTE_G4, 8, NOTE_F4, 8, NOTE_E4, 8, NOTE_D4, 8, NOTE_C4, 8, 
                NOTE_D4, 1,
                REST, 4, NOTE_A4, 8, NOTE_G4, 8, NOTE_F4, 8, NOTE_E4, 8, NOTE_D4, 8, NOTE_C4, 8, 
                NOTE_D4, 1,
                NOTE_F4, 4, NOTE_G4, 4, NOTE_A4, 8, NOTE_G4, 4, NOTE_A4, 8, //30
                NOTE_AS4, 4, NOTE_A4, 4, NOTE_G4, 8, NOTE_F4, 4, NOTE_G4, 8,
                NOTE_A4, 4, NOTE_C4, 8, NOTE_C4, 4, NOTE_C4, 8, NOTE_C4, 4,
                NOTE_C4, 1, 
                NOTE_F4, 4, NOTE_G4, 4, NOTE_A4, 8, NOTE_G4, 4, NOTE_A4, 8, //repeats from 14 (again)
                NOTE_AS4, 4, NOTE_A4, 4, NOTE_G4, 8, NOTE_F4, 4, NOTE_G4, 8,
                NOTE_A4, 4, NOTE_G4, 4, NOTE_F4, 4, NOTE_A4, 4,
                NOTE_G4, 1,
                NOTE_C5, 4, NOTE_A4, 4, NOTE_G4, 8, NOTE_A4, 4, NOTE_C5, 8,
                NOTE_AS4, 4, NOTE_A4, 4, NOTE_G4, 8, NOTE_F4, 4, NOTE_G4, 8,
                NOTE_A4, 4, NOTE_G4, 4, NOTE_F4, 4, NOTE_A4, 4,
                NOTE_G4, 1,
                NOTE_C5, 1, //22
                NOTE_C5, 4, NOTE_AS4, 8, NOTE_C5, 8, NOTE_AS4, 2,
                NOTE_A4, 4, NOTE_C4, 8, NOTE_C4, 4, NOTE_C4, 8, NOTE_C4, 4,
                NOTE_C4, 1,
                REST, 4, NOTE_A4, 8, NOTE_G4, 8, NOTE_F4, 8, NOTE_E4, 8, NOTE_D4, 8, NOTE_C4, 8, 
                NOTE_D4, 1,
                REST, 4, NOTE_A4, 8, NOTE_G4, 8, NOTE_F4, 8, NOTE_E4, 8, NOTE_D4, 8, NOTE_C4, 8, 
                NOTE_D4, 1,
                NOTE_F4, 4, NOTE_G4, 4, NOTE_A4, 8, NOTE_G4, 4, NOTE_A4, 8, //30
                NOTE_AS4, 4, NOTE_A4, 4, NOTE_G4, 8, NOTE_F4, 4, NOTE_G4, 8,
                NOTE_A4, 4, NOTE_C4, 8, NOTE_C4, 4, NOTE_C4, 8, NOTE_C4, 4,
                NOTE_C4, 1, 
                
              };
              
            mPlayer.play_melody(122, lionSleepsTonight,sizeof(lionSleepsTonight)/sizeof(lionSleepsTonight[0]));`
            break;
        case "got":
            code = `
            int gotTheme[] = {

                // Game of Thrones
                // Score available at https://musescore.com/user/8407786/scores/2156716
              
                NOTE_G4,8, NOTE_C4,8, NOTE_DS4,16, NOTE_F4,16, NOTE_G4,8, NOTE_C4,8, NOTE_DS4,16, NOTE_F4,16, //1
                NOTE_G4,8, NOTE_C4,8, NOTE_DS4,16, NOTE_F4,16, NOTE_G4,8, NOTE_C4,8, NOTE_DS4,16, NOTE_F4,16,
                NOTE_G4,8, NOTE_C4,8, NOTE_E4,16, NOTE_F4,16, NOTE_G4,8, NOTE_C4,8, NOTE_E4,16, NOTE_F4,16,
                NOTE_G4,8, NOTE_C4,8, NOTE_E4,16, NOTE_F4,16, NOTE_G4,8, NOTE_C4,8, NOTE_E4,16, NOTE_F4,16,
                NOTE_G4,-4, NOTE_C4,-4,//5
              
                NOTE_DS4,16, NOTE_F4,16, NOTE_G4,4, NOTE_C4,4, NOTE_DS4,16, NOTE_F4,16, //6
                NOTE_D4,-1, //7 and 8
                NOTE_F4,-4, NOTE_AS3,-4,
                NOTE_DS4,16, NOTE_D4,16, NOTE_F4,4, NOTE_AS3,-4,
                NOTE_DS4,16, NOTE_D4,16, NOTE_C4,-1, //11 and 12
              
                //repeats from 5
                NOTE_G4,-4, NOTE_C4,-4,//5
              
                NOTE_DS4,16, NOTE_F4,16, NOTE_G4,4, NOTE_C4,4, NOTE_DS4,16, NOTE_F4,16, //6
                NOTE_D4,-1, //7 and 8
                NOTE_F4,-4, NOTE_AS3,-4,
                NOTE_DS4,16, NOTE_D4,16, NOTE_F4,4, NOTE_AS3,-4,
                NOTE_DS4,16, NOTE_D4,16, NOTE_C4,-1, //11 and 12
                NOTE_G4,-4, NOTE_C4,-4,
                NOTE_DS4,16, NOTE_F4,16, NOTE_G4,4,  NOTE_C4,4, NOTE_DS4,16, NOTE_F4,16,
              
                NOTE_D4,-2,//15
                NOTE_F4,-4, NOTE_AS3,-4,
                NOTE_D4,-8, NOTE_DS4,-8, NOTE_D4,-8, NOTE_AS3,-8,
                NOTE_C4,-1,
                NOTE_C5,-2,
                NOTE_AS4,-2,
                NOTE_C4,-2,
                NOTE_G4,-2,
                NOTE_DS4,-2,
                NOTE_DS4,-4, NOTE_F4,-4, 
                NOTE_G4,-1,
                
                NOTE_C5,-2,//28
                NOTE_AS4,-2,
                NOTE_C4,-2,
                NOTE_G4,-2, 
                NOTE_DS4,-2,
                NOTE_DS4,-4, NOTE_D4,-4,
                NOTE_C5,8, NOTE_G4,8, NOTE_GS4,16, NOTE_AS4,16, NOTE_C5,8, NOTE_G4,8, NOTE_GS4,16, NOTE_AS4,16,
                NOTE_C5,8, NOTE_G4,8, NOTE_GS4,16, NOTE_AS4,16, NOTE_C5,8, NOTE_G4,8, NOTE_GS4,16, NOTE_AS4,16,
                
                REST,4, NOTE_GS5,16, NOTE_AS5,16, NOTE_C6,8, NOTE_G5,8, NOTE_GS5,16, NOTE_AS5,16,
                NOTE_C6,8, NOTE_G5,16, NOTE_GS5,16, NOTE_AS5,16, NOTE_C6,8, NOTE_G5,8, NOTE_GS5,16, NOTE_AS5,16,  
              };
            mPlayer.play_melody(85, gotTheme,sizeof(gotTheme)/sizeof(gotTheme[0]));`
            break;
        case "sirenA":
            code = `SirenA();\n`
            break;
        case "sirenB":
            code = `SirenB();\n`
            break;
    }

    return code;
}

Blockly.JavaScript["mingo_light_read"] = function (block) {
    var sensor = block.getFieldValue('sensor');
    var port = block.getFieldValue('port');

    var code = '...;\n';
    var selectedPort = 0;

    switch (port) {
        case "3":
            selectedPort = Port3;
            break;
        case "4":
            selectedPort = Port4;
            break;
    }

    switch (sensor) {
        case "left":
            code = `analogRead(${selectedPort[0]})`
            break;
        case "right":
            code = `analogRead(${selectedPort[1]})`
            break;
    }

    return [code, Blockly.JavaScript.ORDER_NONE];
}

Blockly.JavaScript["mingo_line_read"] = function (block) {
    var sensor = block.getFieldValue('sensor');
    var port = block.getFieldValue('port');

    var code = '...;\n';
    var selectedPort = 0;

    switch (port) {
        case "3":
            selectedPort = Port3;
            break;
        case "4":
            selectedPort = Port4;
            break;
    }

    switch (sensor) {
        case "left":
            code = `analogRead(${selectedPort[0]})`
            break;
        case "right":
            code = `analogRead(${selectedPort[1]})`
            break;
    }

    return [code, Blockly.JavaScript.ORDER_NONE];
}

Blockly.JavaScript["mingo_ultrasonic_sensor"] = function (block) {
    var port = block.getFieldValue('port');
    if (UltrasonicDefined === false) {
        if (block.getRootBlock().type == "m_mainloop") {
            peripheral_PreDeclarations += UltrasonicSetup.PreDec;
            peripheral_SetupCode += UltrasonicSetup.Setup;
            peripheral_BulkFunctions += UltrasonicSetup.Bulk;
            UltrasonicDefined = true;
        }
    }

    var code = '...;\n';
    var selectedPort = [];

    switch (port) {
        case "1":
            selectedPort = Port3;
            break;
        case "2":
            selectedPort = Port4;
            break;
    }
    console.log(selectedPort);
    code = `read_ultrasonic( ${selectedPort[2]} , ${selectedPort[3]})`
    console.log(code);

    return [code, Blockly.JavaScript.ORDER_NONE];
}

Blockly.JavaScript["mingo_ir_begin"] = function (block) {

    if (InfraredDefined === false) {
        if (block.getRootBlock().type == "m_mainloop") {
            peripheral_PreDeclarations += InfraredSetup.PreDec;
            peripheral_SetupCode += InfraredSetup.Setup;
            peripheral_BulkFunctions += InfraredSetup.Bulk;
            InfraredDefined = true;
        }
    }

    var code = ``;

    return code;
}

Blockly.JavaScript["mingo_ir_read"] = function (block) {
    var dropdown_character = block.getFieldValue('Received_Character');
    var statements_ir_decode_loop = Blockly.JavaScript.statementToCode(block, 'IR_Decode_Loop');
    var code = ``
    if (block.getRootBlock().type == "m_mainloop") {
        //InfraredSetup.Loop += `if(IrReceiver.decodedIRData.command==0x${dropdown_character}){\n${statements_ir_decode_loop}\t\t}\n\t`;
        code = `if(IrReceiver.decodedIRData.command==0x${dropdown_character}){\n${statements_ir_decode_loop}\t\t}\n\t`;
    }
    return code;
}

Blockly.JavaScript["mingo_bluetooth_begin"] = function (block) {
    if (BluetoothDefined === false) {
        if (block.getRootBlock().type == "m_mainloop") {
            peripheral_PreDeclarations += BluetoothSetup.PreDec;
            peripheral_SetupCode += BluetoothSetup.Setup;
            peripheral_BulkFunctions += BluetoothSetup.Bulk;
            BluetoothDefined = true;
        }
    }

    var code = `while (hc06.available()>0){\n\tbdata = hc06.read();\n}\n`;

    return code;
}

Blockly.JavaScript["mingo_bluetooth_read"] = function (block) {
    var value_name = Blockly.JavaScript.valueToCode(block, "NAME", Blockly.JavaScript.ORDER_ATOMIC);
    value_name = value_name.replaceAll(`'`, ``);

    var code = `(bdata=='${value_name}')`;

    return [code, Blockly.JavaScript.ORDER_NONE];
}

Blockly.JavaScript["mingo_bluetooth_send"] = function (block) {
    var value_name = Blockly.JavaScript.valueToCode(block, 'NAME', Blockly.JavaScript.ORDER_ATOMIC);
    value_name = value_name.replaceAll(`'`, ``);

    if (BluetoothDefined === false) {
        BluetoothSetup.PreDec += `int send_bluetooth(char x);\n`;
        BluetoothSetup.Bulk += `int send_bluetooth(char x){\n\thc06.write(x);\n}\n`

        if (block.getRootBlock().type == "m_mainloop") {
            peripheral_PreDeclarations += BluetoothSetup.PreDec;
            peripheral_SetupCode += BluetoothSetup.Setup;
            peripheral_BulkFunctions += BluetoothSetup.Bulk;
            BluetoothDefined = true;
        }
    }

    var code = `\tsend_bluetooth('${value_name}');\n`
    return code;
}

Blockly.JavaScript["mingo_display_text"] = function (block) {
    var port = block.getFieldValue('port');
    var text = block.getFieldValue('text');

    var code = ``;
    return code;
}

Blockly.JavaScript["mingo_display_clear"] = function (block) {
    var port = block.getFieldValue('port');

    var code = ``;
    return code;
}

Blockly.JavaScript["mingo_display_face"] = function (block) {
    var port = block.getFieldValue('port');
    var text = block.getFieldValue('face');

    var code = ``;
    return code;
}

Blockly.JavaScript["mingo_display_animation"] = function (block) {
    var port = block.getFieldValue('port');
    var text = block.getFieldValue('anim');

    var code = ``;
    return code;
}


export { peripheral_PreDeclarations, peripheral_BulkFunctions, peripheral_SetupCode, InfraredSetup, clearvars }