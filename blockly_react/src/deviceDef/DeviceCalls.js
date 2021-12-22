import {Peripheral,peripheralCategories,deviceCompilers,Device} from "./DMClasses"

//Defining Device List
var DeviceList = Array();

//Defining Peripherals
var AU_UltrasonicHC_01 = new Peripheral("AU_UltrasonicHC-01",peripheralCategories.SENSOR)
AU_UltrasonicHC_01.createPin("US_Trigger")
AU_UltrasonicHC_01.createPin("US_Echo")

//Defining Devices and Attaching Peripherals
var ArduinoUNO = new Device("Arduino UNO", deviceCompilers.ARDUINO);
ArduinoUNO.addPeripheral(AU_UltrasonicHC_01);
ArduinoUNO.connectPeripheral(AU_UltrasonicHC_01, [12,11]);

//Adding Device to DeviceList
DeviceList.push(ArduinoUNO)

//Export DeviceList back to Device Manager
exports.DeviceList = DeviceList;