#!/bin/bash

# Useful resources
# https://docs.pipewire.org/page_man_pipewire-pulse_conf_5.html
# https://www.reddit.com/r/pipewire/comments/nnug8k/how_to_stop_a_sink_from_going_into_the_suspended/
# https://gist.github.com/adamnejm/c3274742f3f5537306d60316b1f82552
# https://pipewire.pages.freedesktop.org/wireplumber/daemon/configuration/migration.html

# Ensure the config folder exists
mkdir -p $XDG_CONFIG_HOME/wireplumber/wireplumber.conf.d/
# Copy the config to the location
cp configs/60-disable-speaker-suspend.conf $XDG_CONFIG_HOME/wireplumber/wireplumber.conf.d/60-disable-speaker-suspend.conf