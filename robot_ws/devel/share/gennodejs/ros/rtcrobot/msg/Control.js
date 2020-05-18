// Auto-generated. Do not edit!

// (in-package rtcrobot.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Control {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rvel_target = null;
      this.lvel_target = null;
      this.led_status = null;
      this.output_1 = null;
      this.output_2 = null;
      this.output_3 = null;
      this.output_4 = null;
    }
    else {
      if (initObj.hasOwnProperty('rvel_target')) {
        this.rvel_target = initObj.rvel_target
      }
      else {
        this.rvel_target = 0;
      }
      if (initObj.hasOwnProperty('lvel_target')) {
        this.lvel_target = initObj.lvel_target
      }
      else {
        this.lvel_target = 0;
      }
      if (initObj.hasOwnProperty('led_status')) {
        this.led_status = initObj.led_status
      }
      else {
        this.led_status = 0;
      }
      if (initObj.hasOwnProperty('output_1')) {
        this.output_1 = initObj.output_1
      }
      else {
        this.output_1 = false;
      }
      if (initObj.hasOwnProperty('output_2')) {
        this.output_2 = initObj.output_2
      }
      else {
        this.output_2 = false;
      }
      if (initObj.hasOwnProperty('output_3')) {
        this.output_3 = initObj.output_3
      }
      else {
        this.output_3 = false;
      }
      if (initObj.hasOwnProperty('output_4')) {
        this.output_4 = initObj.output_4
      }
      else {
        this.output_4 = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Control
    // Serialize message field [rvel_target]
    bufferOffset = _serializer.int16(obj.rvel_target, buffer, bufferOffset);
    // Serialize message field [lvel_target]
    bufferOffset = _serializer.int16(obj.lvel_target, buffer, bufferOffset);
    // Serialize message field [led_status]
    bufferOffset = _serializer.int16(obj.led_status, buffer, bufferOffset);
    // Serialize message field [output_1]
    bufferOffset = _serializer.bool(obj.output_1, buffer, bufferOffset);
    // Serialize message field [output_2]
    bufferOffset = _serializer.bool(obj.output_2, buffer, bufferOffset);
    // Serialize message field [output_3]
    bufferOffset = _serializer.bool(obj.output_3, buffer, bufferOffset);
    // Serialize message field [output_4]
    bufferOffset = _serializer.bool(obj.output_4, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Control
    let len;
    let data = new Control(null);
    // Deserialize message field [rvel_target]
    data.rvel_target = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [lvel_target]
    data.lvel_target = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [led_status]
    data.led_status = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [output_1]
    data.output_1 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [output_2]
    data.output_2 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [output_3]
    data.output_3 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [output_4]
    data.output_4 = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rtcrobot/Control';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '37b8adb76b20d5e3dea76b096f6e65a0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 rvel_target
    int16 lvel_target
    int16 led_status
    
    bool    output_1
    bool    output_2
    bool    output_3
    bool    output_4
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Control(null);
    if (msg.rvel_target !== undefined) {
      resolved.rvel_target = msg.rvel_target;
    }
    else {
      resolved.rvel_target = 0
    }

    if (msg.lvel_target !== undefined) {
      resolved.lvel_target = msg.lvel_target;
    }
    else {
      resolved.lvel_target = 0
    }

    if (msg.led_status !== undefined) {
      resolved.led_status = msg.led_status;
    }
    else {
      resolved.led_status = 0
    }

    if (msg.output_1 !== undefined) {
      resolved.output_1 = msg.output_1;
    }
    else {
      resolved.output_1 = false
    }

    if (msg.output_2 !== undefined) {
      resolved.output_2 = msg.output_2;
    }
    else {
      resolved.output_2 = false
    }

    if (msg.output_3 !== undefined) {
      resolved.output_3 = msg.output_3;
    }
    else {
      resolved.output_3 = false
    }

    if (msg.output_4 !== undefined) {
      resolved.output_4 = msg.output_4;
    }
    else {
      resolved.output_4 = false
    }

    return resolved;
    }
};

module.exports = Control;
