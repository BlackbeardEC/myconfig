#!/bin/bash

# disable laptop touchpad 

# xinput --list | grep -i 'mouse'



# not sure if this id number changes but xinput --list will show

xinput --set-prop 14 "Device Enabled" 0
