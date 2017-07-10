## Shapeoko CNC machine @ Kaunas Makerspace


### Info
This is a port from Marius Alksnys linuxCNC configuration for shapeoko CNC machine.

This port is intended to work in Machinekit on BeagleBone and BeagleBone Black boards utilizing single PRU for step generation (invalidating basetime restrictions)

All gpio stuff is done using Linux Kernel Device Tree Blob overlays, which can be loaded at runtime

Currently these scripts will not clean up at end of execution, so make sure to unload the DTS overlay before loading a different setup

### Installation (!IMPORTANT)
The DeviceTree is intentionally added as source and not blob, so to be able to use it, this must be compiled and loaded to __/lib/frmware__:
```
$ ./install.sh

Compiling Device Tree ...
Moving Device Tree Blob to firmwares ...
```
### Pinout
```
	/* Steppers */
	"P9.12",  /* gpio 1.28 A-Dir     */
	"P9.14",  /* gpio 1.18 A-Step    */
	"P9.16",  /* gpio 1.19 A-Enable  */
	"P9.26",  /* gpio 0.14 Z-Dir     */
    "P9.28",  /* gpio 3.17 Z-Step    */
    "P9.30",  /* gpio 3.16 Z-Enable  */
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
	"P8.14",  /* gpio 0.26 Z-Home    */

	/* Spindle + sense */
	"P8.18",  /* gpio 2.1  PWM       */
	"P8.16",  /* gpio 1.14 Sense PRU */
```

