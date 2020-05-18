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

class Information {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.imu_ax = null;
      this.imu_ay = null;
      this.imu_az = null;
      this.imu_gx = null;
      this.imu_gy = null;
      this.imu_gz = null;
      this.imu_mx = null;
      this.imu_my = null;
      this.imu_mz = null;
      this.range_1 = null;
      this.range_2 = null;
      this.input_1 = null;
      this.input_2 = null;
      this.input_3 = null;
      this.input_4 = null;
      this.output_1 = null;
      this.output_2 = null;
      this.output_3 = null;
      this.output_4 = null;
    }
    else {
      if (initObj.hasOwnProperty('imu_ax')) {
        this.imu_ax = initObj.imu_ax
      }
      else {
        this.imu_ax = 0.0;
      }
      if (initObj.hasOwnProperty('imu_ay')) {
        this.imu_ay = initObj.imu_ay
      }
      else {
        this.imu_ay = 0.0;
      }
      if (initObj.hasOwnProperty('imu_az')) {
        this.imu_az = initObj.imu_az
      }
      else {
        this.imu_az = 0.0;
      }
      if (initObj.hasOwnProperty('imu_gx')) {
        this.imu_gx = initObj.imu_gx
      }
      else {
        this.imu_gx = 0.0;
      }
      if (initObj.hasOwnProperty('imu_gy')) {
        this.imu_gy = initObj.imu_gy
      }
      else {
        this.imu_gy = 0.0;
      }
      if (initObj.hasOwnProperty('imu_gz')) {
        this.imu_gz = initObj.imu_gz
      }
      else {
        this.imu_gz = 0.0;
      }
      if (initObj.hasOwnProperty('imu_mx')) {
        this.imu_mx = initObj.imu_mx
      }
      else {
        this.imu_mx = 0.0;
      }
      if (initObj.hasOwnProperty('imu_my')) {
        this.imu_my = initObj.imu_my
      }
      else {
        this.imu_my = 0.0;
      }
      if (initObj.hasOwnProperty('imu_mz')) {
        this.imu_mz = initObj.imu_mz
      }
      else {
        this.imu_mz = 0.0;
      }
      if (initObj.hasOwnProperty('range_1')) {
        this.range_1 = initObj.range_1
      }
      else {
        this.range_1 = 0.0;
      }
      if (initObj.hasOwnProperty('range_2')) {
        this.range_2 = initObj.range_2
      }
      else {
        this.range_2 = 0.0;
      }
      if (initObj.hasOwnProperty('input_1')) {
        this.input_1 = initObj.input_1
      }
      else {
        this.input_1 = false;
      }
      if (initObj.hasOwnProperty('input_2')) {
        this.input_2 = initObj.input_2
      }
      else {
        this.input_2 = false;
      }
      if (initObj.hasOwnProperty('input_3')) {
        this.input_3 = initObj.input_3
      }
      else {
        this.input_3 = false;
      }
      if (initObj.hasOwnProperty('input_4')) {
        this.input_4 = initObj.input_4
      }
      else {
        this.input_4 = false;
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
    // Serializes a message object of type Information
    // Serialize message field [imu_ax]
    bufferOffset = _serializer.float32(obj.imu_ax, buffer, bufferOffset);
    // Serialize message field [imu_ay]
    bufferOffset = _serializer.float32(obj.imu_ay, buffer, bufferOffset);
    // Serialize message field [imu_az]
    bufferOffset = _serializer.float32(obj.imu_az, buffer, bufferOffset);
    // Serialize message field [imu_gx]
    bufferOffset = _serializer.float32(obj.imu_gx, buffer, bufferOffset);
    // Serialize message field [imu_gy]
    bufferOffset = _serializer.float32(obj.imu_gy, buffer, bufferOffset);
    // Serialize message field [imu_gz]
    bufferOffset = _serializer.float32(obj.imu_gz, buffer, bufferOffset);
    // Serialize message field [imu_mx]
    bufferOffset = _serializer.float32(obj.imu_mx, buffer, bufferOffset);
    // Serialize message field [imu_my]
    bufferOffset = _serializer.float32(obj.imu_my, buffer, bufferOffset);
    // Serialize message field [imu_mz]
    bufferOffset = _serializer.float32(obj.imu_mz, buffer, bufferOffset);
    // Serialize message field [range_1]
    bufferOffset = _serializer.float32(obj.range_1, buffer, bufferOffset);
    // Serialize message field [range_2]
    bufferOffset = _serializer.float32(obj.range_2, buffer, bufferOffset);
    // Serialize message field [input_1]
    bufferOffset = _serializer.bool(obj.input_1, buffer, bufferOffset);
    // Serialize message field [input_2]
    bufferOffset = _serializer.bool(obj.input_2, buffer, bufferOffset);
    // Serialize message field [input_3]
    bufferOffset = _serializer.bool(obj.input_3, buffer, bufferOffset);
    // Serialize message field [input_4]
    bufferOffset = _serializer.bool(obj.input_4, buffer, bufferOffset);
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
    //deserializes a message object of type Information
    let len;
    let data = new Information(null);
    // Deserialize message field [imu_ax]
    data.imu_ax = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [imu_ay]
    data.imu_ay = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [imu_az]
    data.imu_az = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [imu_gx]
    data.imu_gx = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [imu_gy]
    data.imu_gy = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [imu_gz]
    data.imu_gz = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [imu_mx]
    data.imu_mx = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [imu_my]
    data.imu_my = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [imu_mz]
    data.imu_mz = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [range_1]
    data.range_1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [range_2]
    data.range_2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [input_1]
    data.input_1 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [input_2]
    data.input_2 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [input_3]
    data.input_3 = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [input_4]
    data.input_4 = _deserializer.bool(buffer, bufferOffset);
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
    return 52;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rtcrobot/Information';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '51b071e47da4f36ad37e1ffa8c219c91';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 imu_ax
    float32 imu_ay
    float32 imu_az
    float32 imu_gx
    float32 imu_gy
    float32 imu_gz
    float32 imu_mx
    float32 imu_my
    float32 imu_mz
    
    float32 range_1
    float32 range_2
    
    bool    input_1
    bool    input_2
    bool    input_3
    bool    input_4
    
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
    const resolved = new Information(null);
    if (msg.imu_ax !== undefined) {
      resolved.imu_ax = msg.imu_ax;
    }
    else {
      resolved.imu_ax = 0.0
    }

    if (msg.imu_ay !== undefined) {
      resolved.imu_ay = msg.imu_ay;
    }
    else {
      resolved.imu_ay = 0.0
    }

    if (msg.imu_az !== undefined) {
      resolved.imu_az = msg.imu_az;
    }
    else {
      resolved.imu_az = 0.0
    }

    if (msg.imu_gx !== undefined) {
      resolved.imu_gx = msg.imu_gx;
    }
    else {
      resolved.imu_gx = 0.0
    }

    if (msg.imu_gy !== undefined) {
      resolved.imu_gy = msg.imu_gy;
    }
    else {
      resolved.imu_gy = 0.0
    }

    if (msg.imu_gz !== undefined) {
      resolved.imu_gz = msg.imu_gz;
    }
    else {
      resolved.imu_gz = 0.0
    }

    if (msg.imu_mx !== undefined) {
      resolved.imu_mx = msg.imu_mx;
    }
    else {
      resolved.imu_mx = 0.0
    }

    if (msg.imu_my !== undefined) {
      resolved.imu_my = msg.imu_my;
    }
    else {
      resolved.imu_my = 0.0
    }

    if (msg.imu_mz !== undefined) {
      resolved.imu_mz = msg.imu_mz;
    }
    else {
      resolved.imu_mz = 0.0
    }

    if (msg.range_1 !== undefined) {
      resolved.range_1 = msg.range_1;
    }
    else {
      resolved.range_1 = 0.0
    }

    if (msg.range_2 !== undefined) {
      resolved.range_2 = msg.range_2;
    }
    else {
      resolved.range_2 = 0.0
    }

    if (msg.input_1 !== undefined) {
      resolved.input_1 = msg.input_1;
    }
    else {
      resolved.input_1 = false
    }

    if (msg.input_2 !== undefined) {
      resolved.input_2 = msg.input_2;
    }
    else {
      resolved.input_2 = false
    }

    if (msg.input_3 !== undefined) {
      resolved.input_3 = msg.input_3;
    }
    else {
      resolved.input_3 = false
    }

    if (msg.input_4 !== undefined) {
      resolved.input_4 = msg.input_4;
    }
    else {
      resolved.input_4 = false
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

module.exports = Information;
