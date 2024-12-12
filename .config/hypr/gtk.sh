#!/bin/sh

gnome_schema="org.gnome.desktop.interface"
gsettings set "$gnome_schema" font-name "Noto Sans"
gsettings set "$gnome_schema" color-scheme "prefer-dark"
gsettings set "$gnome_schema" icon-theme "WhiteSur-dark"
gsettings set "$gnome_schema" cursor-theme "McMojave-cursors"
