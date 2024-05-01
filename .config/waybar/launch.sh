#!/bin/sh
killall waybar

waybar -c ~/dot/waybar/config & -s ~/dot/waybar/style.css  
