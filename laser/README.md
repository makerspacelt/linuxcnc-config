## Laser cutter 40W machine @ Kaunas Makerspace


### Info
This is a linux cnc configuration and device tree overlay for BeagleBone Black.
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

