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
	"P8.8",	        /* gpio 2.3     X-Home 	*/
	"P8.9",	        /* gpio 2.5     Y-Home 	*/
	"P8.10",        /* gpio 2.4    	Z-Home 	*/
	"P8.14",	    /* gpio 0.26	E-Stop	*/

	"P8.12",        /* gpio 1.12    X-Step	 */
	"P8.11",        /* gpio 1.13    X-Dir 	 */
	"P8.16",        /* gpio 1.14    Y-Step	 */
	"P8.15",        /* gpio 1.15    Y-Dir	 */
	"P9.15",        /* gpio 1.16    Z-Step	 */
	"P9.23",        /* gpio 1.17    Z-Dir 	 */
```
