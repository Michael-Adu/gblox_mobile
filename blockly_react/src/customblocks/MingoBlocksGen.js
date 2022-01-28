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
            code = `dr f;`;
            break;
        case "backward":
            code = `dr b;`;
            break;
        case "left":
            code = `dr l;`;
            break;
        case "right":
            code = `dr r;`;
            break;
    }
    return code;
}


Blockly.JavaScript["mingo_motor_stop_indef"] = function (block) {
    if (DCMotorDefined === false) {
        if (block.getRootBlock().type == "m_mainloop") {
            peripheral_PreDeclarations += DCMotorSetup.PreDec;
            peripheral_SetupCode += DCMotorSetup.Setup;
            peripheral_BulkFunctions += DCMotorSetup.Bulk;
            DCMotorDefined = true;
        }
    }

    var code = `dr s;`;
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
            code = `port g ${dropdown_port};gr 1;`
            break;
        case "close":
            code = `port g ${dropdown_port};gr 0;`
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
            code = `port u ${port};l 0 ${red} ${green} ${blue};`
            break;
        case "left":
            code = `port u ${port};l 1 ${red} ${green} ${blue};`
            break;
        case "right":
            code = `port u ${port};l 2 ${red} ${green} ${blue};`
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
            colorCode = '255 0 0';
            break;
        case "green":
            colorCode = '0 255 0';
            break;
        case "blue":
            colorCode = '0 0 255';
            break;
        case "none":
            colorCode = '0 0 0';
            break;
    }

    switch (ledSelect) {
        case "all":
            code = `port u ${port};l 0 ${colorCode};`
            break;
        case "left":
            code = `port u ${port};l 1 ${colorCode};`
            break;
        case "right":
            code = `port u ${port};l 2 ${colorCode};`
            break;
    }

    return code;
}

Blockly.JavaScript["mingo_sound_play"] = function (block) {
    var note = block.getFieldValue('Note');

    var code = `p ${note};`;

    return code;
}

Blockly.JavaScript["mingo_sound_play_timed"] = function (block) {
    var note = block.getFieldValue('note');
    var value_buzzer_time = Blockly.JavaScript.valueToCode(block, 'Buzzer Time', Blockly.JavaScript.ORDER_ATOMIC);

    var code = `p ${note};dy ${value_buzzer_time * 1000};pn;`;

    return code;
}

Blockly.JavaScript["mingo_sound_stop"] = function (block) {
    var code = `pn;`;

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
            code = `ps MC;`;
            break;
        case "bday":
            code = `ps BD;`;
            break;
        case "furelise":
            code = `ps FE;`
            break;
        case "silent":
            code = `ps S;`
            break;
        case "lion":
            code = `ps LI;`
            break;
        case "got":
            code = `ps GOT;`
            break;
        case "sirenA":
            code = `ps SA;`
            break;
        case "sirenB":
            code = `ps SB;`
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
            code = `port s ${port};rls 0;`
            break;
        case "right":
            code = `port s ${port};rls 1;`
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
            code = `port f ${port};rlf 0;`
            break;
        case "right":
            code = `port f ${port};rlf 1;`
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
    code = `port u ${port};ru;`

    return [code, Blockly.JavaScript.ORDER_NONE];
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