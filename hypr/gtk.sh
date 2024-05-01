#!/bin/sh

gnome_schema="org.gnome.desktop.interface"
gsettings set "$gnome_schema" font-name "San Francisco Pro Display 10"
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
