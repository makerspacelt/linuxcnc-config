## Laser cutter 40W machine @ Kaunas Makerspace


### Info
This is a linux cnc configuration and device tree overlay for BeagleBone Black.
All gpio stuff is done using Linux Kernel Device Tree Blob overlays, which can be loaded at runtime
Currently these scripts will not clean up at end of execution, so make sure to unload the DTS overlay before loading a different setup

### Installation (!IMPORTANT)
#### DTS
The DeviceTree is intentionally added as source and not blob, so to be able to use it, this must be compiled and loaded to __/lib/frmware__:
```
$ ./install.sh

Compiling Device Tree ...
Moving Device Tree Blob to firmwares ...
```
#### Custom Components
You will also need to compile and install custom components
You may need __machinekit-dev__ and __build-essentials__ packages
```
$ sudo comp --install laserfreq.comp

Compiling realtime laserfreq.c
Linking laserfreq.so
cp laserfreq.so /usr/lib/linuxcnc/posix/
```

### Pinout
```
        /* Steppers */
        "P8.11",  /* gpio 1.13 X-Dir     */
        "P8.9",   /* gpio 2.5  X-Step    */
        "P8.7",   /* gpio 2.2  X-Enable  */
        "P8.13",  /* gpio 0.23 Y-Dir     */
        "P8.15",  /* gpio 1.15 Y-Step    */
        "P8.17",  /* gpio 0.27 Y-Enable  */

        /* Home sw., E-Stop */
        "P8.8",   /* gpio 2.3  E-Stop    */
        "P8.10",  /* gpio 2.4  X-Home    */
        "P8.12",  /* gpio 1.12 Y-Home    */

        /* Laser power pwm */
        "P8.18",  /* gpio 2.1  PWM       */

        /* Laser enable */
        "P8.14",  /* gpio 0.26 Laser     */
```

### Acknowledgment
This work is heavily based on:
[__bjj__ work on 2.x laser integration](https://github.com/bjj/2x_laser)
[__jv4779__ rastring and gui implementations](https://github.com/jv4779/2x_laser)

