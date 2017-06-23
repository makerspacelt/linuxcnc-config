#!/bin/bash
# Copyright 2013
# Charles Steinkuehler <charles@steinkuehler.net>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

dtbo_err () {
	echo "Error loading device tree overlay file: $DTBO" >&2
	exit 1
}

SLOTS=/sys/devices/bone_capemgr.*/slots

# Identify if a particular cape or overlay is actually loaded
# $1 = cape to look for
cape_loaded() {
	grep ,$1\$ $SLOTS | {
		# Default to cape not loaded
		RET=1

		# Check for cape
		while read SLOT STATUS CAPE JUNK ; do
			case $STATUS in
			*L )	RET=0 ; break ;;	# Cape is loaded
			*- )	RET=2 ;;		# Cape is present, but not loaded
			* )	RET=3 ;;		# Unknown status
			esac
		done

		return $RET
	}
}

# Load a cape
# $1 = cape to load
# $2 = revision (optional)
load_cape () {
	echo Loading $1 overlay
	sudo -A bash -c "echo $1${2:+:$2} > $SLOTS" || dtbo_err
	sleep 1
}

# Make sure required device tree overlay(s) are loaded
REV=1
DTBO=SHAPEOKO-BBB

if cape_loaded $DTBO ; then
	echo $DTBO overlay found
else
	load_cape $DTBO $REV
fi

if [ ! -r /sys/class/uio/uio0 ] ; then
	echo PRU control files not found in /sys/class/uio/uio0 >&2
	exit 1;
fi
