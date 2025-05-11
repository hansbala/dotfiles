#!/bin/bash

hyprctl dispatch workspace 1
sleep 0.3
brave --password-store=basic --ozone-platform=wayland &

sleep 0.5
hyprctl dispatch workspace 2
sleep 0.3
ghostty &

