// Generated by gencpp from file rtcrobot_actions/SaveMapGoal.msg
// DO NOT EDIT!


#ifndef RTCROBOT_ACTIONS_MESSAGE_SAVEMAPGOAL_H
#define RTCROBOT_ACTIONS_MESSAGE_SAVEMAPGOAL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace rtcrobot_actions
{
template <class ContainerAllocator>
struct SaveMapGoal_
{
  typedef SaveMapGoal_<ContainerAllocator> Type;

  SaveMapGoal_()
    : map_name()  {
    }
  SaveMapGoal_(const ContainerAllocator& _alloc)
    : map_name(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _map_name_type;
  _map_name_type map_name;





  typedef boost::shared_ptr< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> const> ConstPtr;

}; // struct SaveMapGoal_

typedef ::rtcrobot_actions::SaveMapGoal_<std::allocator<void> > SaveMapGoal;

typedef boost::shared_ptr< ::rtcrobot_actions::SaveMapGoal > SaveMapGoalPtr;
typedef boost::shared_ptr< ::rtcrobot_actions::SaveMapGoal const> SaveMapGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator1> & lhs, const ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator2> & rhs)
{
  return lhs.map_name == rhs.map_name;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator1> & lhs, const ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace rtcrobot_actions

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "25e928a2d4ff388c294895b7af935978";
  }

  static const char* value(const ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x25e928a2d4ff388cULL;
  static const uint64_t static_value2 = 0x294895b7af935978ULL;
};

template<class ContainerAllocator>
struct DataType< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rtcrobot_actions/SaveMapGoal";
  }

  static const char* value(const ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n"
"# Save Map to file\n"
"# Specify an (optional) name for the map\n"
"string map_name\n"
"\n"
"\n"
;
  }

  static const char* value(const ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.map_name);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SaveMapGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::rtcrobot_actions::SaveMapGoal_<ContainerAllocator>& v)
  {
    s << indent << "map_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.map_name);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RTCROBOT_ACTIONS_MESSAGE_SAVEMAPGOAL_H