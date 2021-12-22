// import "./customblocks/customblocks";
// import "./customblocks/compiler/arduino_core";
// import "./customblocks/peripherals/arduino_peripheral"
// import "./customblocks/MelloBlocks"
// import "./customblocks/MelloBlocksGen"

function importblocks(){
    import("./customblocks.js")
    import("./compiler/arduino_core.js")
    import("./peripherals/arduino_peripheral.js")
    import("./MelloBlocks.js")
    import("./MelloBlocksGen")
}

export default{importblocks}