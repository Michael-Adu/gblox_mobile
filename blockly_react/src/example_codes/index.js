var example_codes = []

function example(header, level, blocks, description, devices,xml) {
  this.header = header;
  this.level = level;
  this.blocks = blocks;
  this.description = description;
  this.devices = devices;
  this.xml = xml;
}

const PoliceFlashLight = new example(
    "Police Flash Light",
    3,
    "Movement, LEDs, Loops, Math",
    "This example is like the 'Random Walk' example in Mode 4, but this time the movements aren't so random! That's because the 'random number generator seed' causes the same sequence of random numbers to appear, depending on the range of integers given. Run this program multiple times to see that you will get the same sequence of actions every time.",
    ["Mingo", "Arduino", "Mello"],
    undefined
)

const TrafficLight = new example(
    "Traffic Light",
    1,
    "Loops, LEDS, Math",
    "This example simulates a simple traffic light. It consists of 3 LEDs; red, amber and green.",
    ["Mingo"],
    `<xml xmlns="https://developers.google.com/blockly/xml"><block type="m_mainloop" id="GdX2^=Jfq;Vwb*}r--iT" deletable="false" movable="false" x="430" y="150"><field name="LOOP">TRUE</field><statement name="mainLoop"><block type="led_rgb_led_all" id="u*qw/%W%1/uw^~ilj??I"><field name="colour">Red</field><next><block type="delay_core" id=":@1xwfNMpc*u}0y4j*Hz"><value name="seconds"><block type="math_number" id="N+T6%yHo@tujQ#?RyV85"><field name="NUM">5</field></block></value><next><block type="led_rgb_led_all" id=":Uwl`+`*?*t|w}XpNpmMR2"><field name="colour">Green</field><next><block type="delay_core" id=",Z2c.5QiNM4RsfX#EaaG"><value name="seconds"><block type="math_number" id="h=Rz9zV_m2)(pK0X`+`j=w"><field name="NUM">5</field></block></value><next><block type="led_rgb_led_all" id="`+`Vp]vDD{Zfl2+za7s?FT"><field name="colour">Yellow</field><next><block type="delay_core" id="5L{Ma_]buv]*AS8V)mnt"><value name="seconds"><block type="math_number" id="POTN7^CTYKXKtcNbp=`+`l"><field name="NUM">2.5</field></block></value></block></next></block></next></block></next></block></next></block></next></block></statement></block></xml>`
)

example_codes.push(TrafficLight);
export default example_codes