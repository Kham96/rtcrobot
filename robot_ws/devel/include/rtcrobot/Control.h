// Generated by gencpp from file rtcrobot/Control.msg
// DO NOT EDIT!


#ifndef RTCROBOT_MESSAGE_CONTROL_H
#define RTCROBOT_MESSAGE_CONTROL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace rtcrobot
{
template <class ContainerAllocator>
struct Control_
{
  typedef Control_<ContainerAllocator> Type;

  Control_()
    : rvel_target(0)
    , lvel_target(0)
    , led_status(0)
    , output_1(false)
    , output_2(false)
    , output_3(false)
    , output_4(false)  {
    }
  Control_(const ContainerAllocator& _alloc)
    : rvel_target(0)
    , lvel_target(0)
    , led_status(0)
    , output_1(false)
    , output_2(false)
    , output_3(false)
    , output_4(false)  {
  (void)_alloc;
    }



   typedef int16_t _rvel_target_type;
  _rvel_target_type rvel_target;

   typedef int16_t _lvel_target_type;
  _lvel_target_type lvel_target;

   typedef int16_t _led_status_type;
  _led_status_type led_status;

   typedef uint8_t _output_1_type;
  _output_1_type output_1;

   typedef uint8_t _output_2_type;
  _output_2_type output_2;

   typedef uint8_t _output_3_type;
  _output_3_type output_3;

   typedef uint8_t _output_4_type;
  _output_4_type output_4;





  typedef boost::shared_ptr< ::rtcrobot::Control_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rtcrobot::Control_<ContainerAllocator> const> ConstPtr;

}; // struct Control_

typedef ::rtcrobot::Control_<std::allocator<void> > Control;

typedef boost::shared_ptr< ::rtcrobot::Control > ControlPtr;
typedef boost::shared_ptr< ::rtcrobot::Control const> ControlConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rtcrobot::Control_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rtcrobot::Control_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::rtcrobot::Control_<ContainerAllocator1> & lhs, const ::rtcrobot::Control_<ContainerAllocator2> & rhs)
{
  return lhs.rvel_target == rhs.rvel_target &&
    lhs.lvel_target == rhs.lvel_target &&
    lhs.led_status == rhs.led_status &&
    lhs.output_1 == rhs.output_1 &&
    lhs.output_2 == rhs.output_2 &&
    lhs.output_3 == rhs.output_3 &&
    lhs.output_4 == rhs.output_4;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::rtcrobot::Control_<ContainerAllocator1> & lhs, const ::rtcrobot::Control_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace rtcrobot

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::rtcrobot::Control_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rtcrobot::Control_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rtcrobot::Control_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rtcrobot::Control_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rtcrobot::Control_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rtcrobot::Control_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rtcrobot::Control_<ContainerAllocator> >
{
  static const char* value()
  {
    return "37b8adb76b20d5e3dea76b096f6e65a0";
  }

  static const char* value(const ::rtcrobot::Control_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x37b8adb76b20d5e3ULL;
  static const uint64_t static_value2 = 0xdea76b096f6e65a0ULL;
};

template<class ContainerAllocator>
struct DataType< ::rtcrobot::Control_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rtcrobot/Control";
  }

  static const char* value(const ::rtcrobot::Control_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rtcrobot::Control_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int16 rvel_target\n"
"int16 lvel_target\n"
"int16 led_status\n"
"\n"
"bool    output_1\n"
"bool    output_2\n"
"bool    output_3\n"
"bool    output_4\n"
;
  }

  static const char* value(const ::rtcrobot::Control_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rtcrobot::Control_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.rvel_target);
      stream.next(m.lvel_target);
      stream.next(m.led_status);
      stream.next(m.output_1);
      stream.next(m.output_2);
      stream.next(m.output_3);
      stream.next(m.output_4);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Control_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rtcrobot::Control_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::rtcrobot::Control_<ContainerAllocator>& v)
  {
    s << indent << "rvel_target: ";
    Printer<int16_t>::stream(s, indent + "  ", v.rvel_target);
    s << indent << "lvel_target: ";
    Printer<int16_t>::stream(s, indent + "  ", v.lvel_target);
    s << indent << "led_status: ";
    Printer<int16_t>::stream(s, indent + "  ", v.led_status);
    s << indent << "output_1: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.output_1);
    s << indent << "output_2: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.output_2);
    s << indent << "output_3: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.output_3);
    s << indent << "output_4: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.output_4);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RTCROBOT_MESSAGE_CONTROL_H