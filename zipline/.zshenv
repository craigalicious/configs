# My Zipline Environment variables

export SERVO_TAIL_STBD_FWD_PORT=50053
export SERVO_TAIL_PORT_FWD_PORT=50055
export SERVO_ROLL_PORT=50057
export SERVO_TILT_PORT=50059

# Home office
export ETH0=enx4865ee1317de
export ETH1=enxa0cec8024af2
export STLINK0=0036004F3331510633323639
export STLINK1=001100174D46501420383832
export STLINK2=0054003D3431511837393330

# Aviary USB hubs w/ ethernet ports
export ETH2=enxc0eac3617b44
export ETH3=enxc0eac3617dd5
export STLINK3=003F00403232511739353236

# Set defaults based on host...
export ETH=$ETH1
if [[ "$(hostname)" == "craigr-p16s" ]]; then
  export ETH=$ETH2
  export STLINK=$STLINK3
elif [[ "$(hostname)" == "craigr-p620" ]]; then
  export ETH=$ETH1
  export STLINK=$STLINK1
else
  export ETH=$ETH0
  export STLINK=$STLINK0
fi
