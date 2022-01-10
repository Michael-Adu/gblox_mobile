import Blockly from "blockly";
// Beginner Toolbox
const newToolBox = {
  kind: "categoryToolbox",
  contents: [
    {
      kind: "category",
      name: "Logic",
      colour: "#5C81A6",
      contents: [
        {
          kind: "block",
          type: "controls_if"
        },
        {
          kind: "block",
          type: "logic_compare"
        }
      ]
    },
    {
      kind: "category",
      name: "Loops",
      colour: "#5C81A6",
      contents: [
        {
          kind: "block",
          type: "controls_whileUntil"
        },
        {
          kind: "block",
          type: "m_mainloop"
        }
      ]
    },
    {
      kind: "category",
      name: "Math",
      colour: "#5C81A6",
      contents: [
        {
          kind: "block",
          type: "math_number"
        },
        {
          kind: "block",
          type: "math_round"
        }
      ]
    },
    {
      kind: "category",
      name: "Sensors",
      colour: "#5C81A6",
      contents: [
        {
          kind: "block",
          type: "n_ultra_read"
        }
      ]
    },
    {
      kind: "category",
      name: "Actuators",
      colour: "#5C81A6",
      contents: [
        {
          kind: "category",
          name: "Servo Motor",
          contents: [
            {
              kind: "block",
              type: "n_servo_rotate"
            }
          ]
        },
        {
          kind: "category",
          name: "LED",
          contents: [
            {
              kind: "block",
              type: "n_led_state"
            }
          ]
        },
        {
          kind: "category",
          name: "Buzzer",
          contents: [
            {
              kind: "block",
              type: "n_buzzer_play"
            },
            {
              kind: "block",
              type: "n_buzzer_stop"
            },
            {
              kind: "block",
              type: "n_buzzer_play_def"
            },
            {
              kind: "block",
              type: "n_note"
            },
            {
              kind: "block",
              type: "n_buzzer_play_note"
            },
            {
              kind: "block",
              type: "n_buzzer_play_note_def"
            }
          ]
        }
      ]
    },
    {
      kind: "category",
      name: "Core Functions",
      colour: "#5C81A6",
      contents: [
        {
          kind: "block",
          type: "delay_core"
        }
      ]
    }
  ]
}

//Mello Toolbox
const MelloToolbox = `<xml xmlns="https://developers.google.com/blockly/xml" id="toolbox" style="display: none">
  <category css-icon="customIcon fa fa-cog" name="Logic" colour="#5b80a5">
      <block type="controls_if"></block>
      <block type="logic_compare">
          <field name="OP">EQ</field>
      </block>
      <block type="logic_operation">
          <field name="OP">AND</field>
      </block>
      <block type="logic_negate"></block>
      <block type="logic_boolean">
          <field name="BOOL">TRUE</field>
      </block>
      <block type="logic_null"></block>
      <block type="logic_ternary"></block>
  </category>
  <category id="Loops" name="Loops" colour="#5ba55b">
      <block type="for_loop">
      </block>
      <block type="controls_whileUntil">
          <field name="MODE">WHILE</field>
      </block>
      <block type="delay_core">
      <field name= "seconds" type="number"></field>
      </block>
  </category>
  <category css-icon="customIcon fa fa-cog" name="Math" colour="#5b67a5">
      <block type="math_number">
          <field name="NUM">0</field>
      </block>
      <block type="math_arithmetic">
          <field name="OP">ADD</field>
          <value name="A">
              <shadow type="math_number">
                  <field name="NUM">1</field>
              </shadow>
          </value>
          <value name="B">
              <shadow type="math_number">
                  <field name="NUM">1</field>
              </shadow>
          </value>
      </block>
      <block type="math_number_property">
          <mutation divisor_input="false"></mutation>
          <field name="PROPERTY">EVEN</field>
          <value name="NUMBER_TO_CHECK">
              <shadow type="math_number">
                  <field name="NUM">0</field>
              </shadow>
          </value>
      </block>
  </category>
  <category css-icon="customIcon fa fa-cog" name="Text" colour="#5ba58c">
      <block type="text">
        <field name="TEXT"></field>
      </block>
      <block type="text_join">
        <mutation items="2"></mutation>
      </block>
      <block type="text_length">
        <value name="VALUE">
          <shadow type="text">
            <field name="TEXT">abc</field>
          </shadow>
        </value>
      </block>
      <block type="text_isEmpty">
        <value name="VALUE">
          <shadow type="text">
            <field name="TEXT"></field>
          </shadow>
        </value>
      </block>
      <block type="text_changeCase">
        <field name="CASE">UPPERCASE</field>
        <value name="TEXT">
          <shadow type="text">
            <field name="TEXT">abc</field>
          </shadow>
        </value>
      </block>
      <block type="text_trim">
        <field name="MODE">BOTH</field>
        <value name="TEXT">
          <shadow type="text">
            <field name="TEXT">abc</field>
          </shadow>
        </value>
      </block>
      <block type="text_print">
        <value name="TEXT">
          <shadow type="text">
            <field name="TEXT">abc</field>
          </shadow>
        </value>
      </block>
      <block type="text_prompt_ext">
        <mutation type="TEXT"></mutation>
        <field name="TYPE">TEXT</field>
        <value name="TEXT">
          <shadow type="text">
            <field name="TEXT">abc</field>
          </shadow>
        </value>
      </block>
    </category>
  <category css-icon="customIcon fa fa-cog" name="Actuators" colour="#05386B">
    <category name="Motor">
      <block type="motor_move_indef">
        <field name="direction">forward</field>
      </block>
      <block type="motor_single_move_indef">
        <field name="motorselect">lm</field>
        <field name="direction">forward</field>
      </block>
      <block type="motor_move_seconds">
        <field name="direction">forward</field>
        <value name="seconds">
          <block type="math_number">
            <field name="NUM">0</field>
          </block>
        </value>
      </block>
    </category>
    <category name="Forklift">
      <block type="forklift_move_seconds">
        <field name="direction">up</field>
        <field name="speed">slow</field>
        <value name="seconds">
          <block type="math_number">
            <field name="NUM">0</field>
          </block>
        </value>
      </block>
      <block type="forklift_move_indef">
        <field name="direction">up</field>
        <field name="speed">slow</field>
      </block>
    </category>
  </category>
  <category css-icon="customIcon fa fa-cog" name="Sensors">
    <category name="Ultrasonic">
        <block type="sensor_ultrasonic"></block>
    </category>
    <category name="Light Follower">
        <block type="sensor_light_follower_right"></block>
        <block type="sensor_light_follower_left"></block>
    </category>
    <category name="Line Follower">
        <block type="sensor_line_follower_right">
            <field name="Right Line Follower Value">On</field>
        </block>
        <block type="sensor_line_follower_left">
            <field name="Left Line Follower Value">On</field>
        </block>
    </category>
  </category>
  <category css-icon="customIcon fa fa-cog" name="COM">
    <category name="IR">
        <block type="communication_infrared_start"></block>
        <block type="communication_infrared_value">
            <field name="Received_Character">FF629D</field>
        </block>
    </category>
    <category name="Bluetooth">
        <block type="communication_bluetooth_start"></block>
        <block type="communication_bluetooth_receive">
            <value name="NAME">
                <block type="text">
                    <field name="TEXT"></field>
                </block>
            </value>
        </block>
        <block type="communincation_bluetooth_send">
            <value name="NAME">
                <block type="text">
                    <field name="TEXT"></field>
                </block>
            </value>
        </block>
    </category>
      <category name="Serial">
        <block type="communication_serial_print"></block>
        <block type="communication_serial_read"></block>
      </category>
  </category>
  <category css-icon="customIcon fa fa-cog" name="LEDs">
    <category css-icon="customIcon fa fa-cog" name="RGB LED">
        <block type="led_rgb_led">
            <field name="LED">Left</field>
            <field name="colour">Red</field>
            <field name="colour value">On</field>
        </block>
        <block type="led_rgb_led_all">
            <field name="LED">Left</field>
            <field name="colour">Red</field>
        </block>
    </category>
  </category>
  <category css-icon="customIcon fa fa-cog" name="Sound">
  <category name="Buzzer">
      <block type="sound_buzzer_timer">
          <field name="note">1047</field>
          <value name="Buzzer Time">
              <block type="math_number">
                  <field name="NUM">0</field>
              </block>
          </value>
      </block>
      <block type="sound_buzzer_buzz">
        <field name="Note">1047</field>
      </block>
      <block type="sound_buzzer_stop"></block>
  </category>
  </category>

  <category name="Variables">
  <button text="Create New Variable" callbackKey="createvar"></button>
  <block type="variable_get"></block>
<block type="variable_set"></block>
  </category>
  
  </xml>`;
  
const MingoToolbox = `<xml xmlns="https://developers.google.com/blockly/xml" id="toolbox" style="display: none">
<category css-icon="customIcon fa fa-cog" name="Logic" colour="#5b80a5">
    <block type="controls_if"></block>
    <block type="logic_compare">
        <field name="OP">EQ</field>
    </block>
    <block type="logic_operation">
        <field name="OP">AND</field>
    </block>
    <block type="logic_negate"></block>
    <block type="logic_boolean">
        <field name="BOOL">TRUE</field>
    </block>
    <block type="logic_null"></block>
    <block type="logic_ternary"></block>
</category>
<category id="Loops" name="Loops" colour="#5ba55b">
    <block type="for_loop">
    </block>
    <block type="controls_whileUntil">
        <field name="MODE">WHILE</field>
    </block>
    <block type="delay_core">
        <field name= "seconds" type="number"></field>
    </block>
</category>
<category css-icon="customIcon fa fa-cog" name="Math" colour="#5b67a5">
    <block type="math_number">
        <field name="NUM">0</field>
    </block>
    <block type="math_arithmetic">
        <field name="OP">ADD</field>
        <value name="A">
            <shadow type="math_number">
                <field name="NUM">1</field>
            </shadow>
        </value>
        <value name="B">
            <shadow type="math_number">
                <field name="NUM">1</field>
            </shadow>
        </value>
    </block>
    <block type="math_number_property">
        <mutation divisor_input="false"></mutation>
        <field name="PROPERTY">EVEN</field>
        <value name="NUMBER_TO_CHECK">
            <shadow type="math_number">
                <field name="NUM">0</field>
            </shadow>
        </value>
    </block>
</category>
<category css-icon="customIcon fa fa-cog" name="Text" colour="#5ba58c">
    <block type="text">
        <field name="TEXT"></field>
    </block>
    <block type="text_join">
        <mutation items="2"></mutation>
    </block>
    <block type="text_length">
        <value name="VALUE">
            <shadow type="text">
                <field name="TEXT">abc</field>
            </shadow>
        </value>
    </block>
    <block type="text_isEmpty">
        <value name="VALUE">
            <shadow type="text">
                <field name="TEXT"></field>
            </shadow>
        </value>
    </block>
    <block type="text_changeCase">
        <field name="CASE">UPPERCASE</field>
        <value name="TEXT">
            <shadow type="text">
                <field name="TEXT">abc</field>
            </shadow>
        </value>
    </block>
    <block type="text_trim">
        <field name="MODE">BOTH</field>
        <value name="TEXT">
            <shadow type="text">
                <field name="TEXT">abc</field>
            </shadow>
        </value>
    </block>
    <block type="text_print">
        <value name="TEXT">
            <shadow type="text">
                <field name="TEXT">abc</field>
            </shadow>
        </value>
    </block>
    <block type="text_prompt_ext">
        <mutation type="TEXT"></mutation>
        <field name="TYPE">TEXT</field>
        <value name="TEXT">
            <shadow type="text">
                <field name="TEXT">abc</field>
            </shadow>
        </value>
    </block>
</category>
<category css-icon="customIcon fa fa-cog" name="Actuators" colour="#05386B">
    <category name="Motor">
        <block type="mingo_motor_move_indef">
            <field name="direction">forward</field>
            <field name="speed">50</field>
        </block>
        <block type="mingo_motor_single_move_indef">
            <field name="motorselect">lm</field>
            <field name="direction">forward</field>
            <field name="speed">50</field>
        </block>
        <block type="mingo_motor_stop_indef">
            <field name="motor">all</field>
        </block>
    </category>
    <category name="Grabber">
        <block type="mingo_grabber_move">
            <field name="action">open</field>
            <field name="port">1</field>
        </block>
    </category>
</category>
<category css-icon="customIcon fa fa-cog" name="Sensors">
        <block type="mingo_ultrasonic_sensor">
            <field name="port">1</field>
        </block>
        <block type="mingo_light_read">
            <field name="sensor">left</field>
            <field name="port">3</field>
        </block>
        <block type="mingo_line_read">
            <field name="sensor">left</field>
            <field name="port">1</field>
        </block>
</category>
<category css-icon="customIcon fa fa-cog" name="COM">
    <category name="IR">
        <block type="mingo_ir_begin"></block>
        <block type="mingo_ir_read">
            <field name="Received_Character">15</field>
        </block>
    </category>
    <category name="Bluetooth">
        <block type="mingo_bluetooth_begin"></block>
        <block type="mingo_bluetooth_read">
            <value name="NAME">
                <block type="text">
                    <field name="TEXT"></field>
                </block>
            </value>
        </block>
        <block type="mingo_bluetooth_send">
            <value name="NAME">
                <block type="text">
                    <field name="TEXT"></field>
                </block>
            </value>
        </block>
    </category>
    <category name="Serial">
        <block type="communication_serial_print"></block>
        <block type="communication_serial_read"></block>
    </category>
</category>
<category css-icon="customIcon fa fa-cog" name="LEDs">
    <category css-icon="customIcon fa fa-cog" name="NeoPixel LED">
        <block type="mingo_led_range">
            <field name="ledSelect">all</field>
            <field name="port">1</field>
            <value name="red">
                <block type="math_number">
                    <field name="NUM"></field>
                </block>
            </value>
            <value name="green">
                <block type="math_number">
                    <field name="NUM"></field>
                </block>
            </value>
            <value name="blue">
                <block type="math_number">
                    <field name="NUM"></field>
                </block>
            </value>
        </block>
        <block type="mingo_led_definite">
            <field name="ledSelect">all</field>
            <field name="port">1</field>
            <field name="colorSelect">Red</field>
        </block>
    </category>
</category>
<category css-icon="customIcon fa fa-cog" name="Sound">
    <block type="mingo_sound_play">
        <field name="note">1047</field>
    </block>
    <block type="mingo_sound_play_timed">
        <field name="note">1047</field>
        <value name="Buzzer Time">
            <block type="math_number">
                <field name="NUM">0</field>
            </block>
        </value>
    </block>
    <block type="mingo_sound_stop"></block>
    <block type="mingo_sound_play">
        <field name="song">merry</field>
    </block>
</category>
<category css-icon="customIcon fa fa-cog" name="Display">
    <block type="mingo_display_text">
        <field name="text">text</field>
        <field name="port">1</field>
    </block>
    <block type="mingo_display_face">
        <field name="face">1</field>
        <field name="port">1</field>
    </block>
    <block type="mingo_display_animation">
        <field name="anim">1</field>
        <field name="port">1</field>
    </block>
    <block type="mingo_display_clear">
        <field name="port">1</field>
    </block>
</category>

<category name="Variables">
    <button text="Create New Variable" callbackKey="createvar"></button>
    <block type="variable_get"></block>
    <block type="variable_set"></block>
</category>

</xml>`;

const MelloDOM = Blockly.Xml.textToDom(MelloToolbox);
const MingoDOM = Blockly.Xml.textToDom(MingoToolbox);

export {MelloDOM, MingoDOM, newToolBox};