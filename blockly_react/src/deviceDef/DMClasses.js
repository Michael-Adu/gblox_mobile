import {DeviceList} from "./DeviceCalls"

// Enum Declarations
const peripheralCategories = {
    ACTUATOR: "actuator",
    SENSOR: "sensor"
}

const deviceCompilers = {
    ARDUINO: "arduino"
}

//Peripheral Class = For Identifying Peripherals
class Peripheral {
    #pins;
    constructor(name, category) {
        this.name = name;
        this.category = category;
        this.#pins = new Array;
    }

    createPin(pinName){
        this.#pins.push(pinName)
    }

    get getPins() {
        return this.#pins
    }
}

//Device Class = For Identifying Devices
class Device {
    #peripherals;
    #connectedPins;
    constructor(name, compiler) {
        this.name =  name;
        this.compiler = compiler;
        this.#peripherals = new Array();
        this.#connectedPins = new Map();
    }

    addPeripheral(peripheral) {
        this.peripherals.push(peripheral)
    }

    connectPeripheral(peripheral, pins) {
        if ((this.#peripherals.filter(e => e === peripheral).length > 0) && (pins.length === peripherals.getPins.length))  {
            for(var i = 0; i < pins.length; i++) {
                this.#connectedPins.set(pins[i], peripheral.getPins()[i])
            }
        }
    }

    connectPin(peripheral, pinName, pin){
        if((peripheral.getPins().includes(pinName)) && (this.#peripherals.filter(e => e === peripheral).length > 0)) {
            this.#connectedPins.set(pin, pinName)
        } else {
            console.log("Invalid Pin Name.")
        }
    }

    get getPeripheralMap() {
        return this.#peripherals
    }

    get getConnectedPins() {
        return this.#connectedPins
    }
}

//Device Manager = Static Instance that deals with Device Management
class DeviceManager {

    static #ourDeviceList = DeviceList;

    constructor() {
    }

    static getDeviceList(){
        return this.#ourDeviceList
    }
}

module.exports = { 
    Peripheral: Peripheral,
    Device: Device,
    DeviceManager:DeviceManager,
    peripheralCategories: peripheralCategories,
    deviceCompilers: deviceCompilers
}