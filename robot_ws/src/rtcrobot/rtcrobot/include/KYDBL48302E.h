//=============================================================================================
// MadgwickAHRS.h
//=============================================================================================
//
// Implementation of Madgwick's IMU and AHRS algorithms.
// See: http://www.x-io.co.uk/open-source-imu-and-ahrs-algorithms/
//
// From the x-io website "Open-source resources available on this website are
// provided under the GNU General Public Licence unless an alternative licence
// is provided in source."
//
// Date			Author          Notes
// 29/09/2011	SOH Madgwick    Initial release
// 02/10/2011	SOH Madgwick	Optimised for reduced CPU load
//
//=============================================================================================
#ifndef Differential_h
#define Differential_h
#include <math.h>
#include <stdio.h>
#include <fcntl.h>  /* File Control Definitions          */
#include <termios.h>/* POSIX Terminal Control Definitions*/
#include <unistd.h> /* UNIX Standard Definitions         */
#include <errno.h>  /* ERROR Number Definitions          */
#include <geometry_msgs/Twist.h>
#include "serial/serial.h"



using namespace serial;



#define DEFAULT_PORT "/dev/ttyUSB0"
#define DEFAULT_BAUDRATE 115200

struct KYDBL48302E_Fault
{
    uint8_t data;
    union flag
    {
        bool overheat  ;
        bool overvoltage ;
        bool undervoltage;
        bool shortcicuit;
        bool emergencystop;
        bool sepexfault;
        bool MOSFETFault;
        bool startupfalse;
    };
};

struct KYDBL48302E_Status
{
    uint8_t data;
    union flag
    {
        bool serialmode    ;
        bool pulsemode ;
        bool analogmode;
        bool powerstageoff;
        bool stalldetected;
        bool atlimit;
        bool unused;
        bool microbasescript;
    };
};
//--------------------------------------------------------------------------------------------
// Variable declaration
class KYDBL48302E{
    private:
        Serial ser;
        int fd;
        float dx, dr, dy;
        

    //-------------------------------------------------------------------------------------------
    // Function declarations
    public:
        int32_t encoder1, encoder2;
        std::string port = DEFAULT_PORT;       //
        int32_t baudrate = DEFAULT_BAUDRATE;   //

        float ratio_controller = 1000; //Tỉ lệ giũa tốc độ và đầu vào bộ điều khiển
        float width = 0.2;

        KYDBL48302E(void);
        bool begin(void);
        void pushSpeed(int16_t channel_1, int16_t channel_2);
        void setSpeed(geometry_msgs::Twist twist);
        void getEncoder(int32_t *channel_1, int32_t *channel_2);
        void getFault(void);
        uint8_t getVoltage(uint8_t channel);
};
#endif

