#!/bin/bash

# Install script variables
start_str="# >>> ros_conda_wrapper initialize >>>"
end_str="# <<< ros_conda_wrapper initialize <<<"
WRAPPER_NAME="ros_conda_wrapper_rc"
WRAPPER_LINK=${HOME}"/."${WRAPPER_NAME}
ROS_CONDA_CONFIG_FILE_NAME="${HOME}/.ros_conda_wrapper_rc_cfg"

# Check if wrapper does already exists
exists=$(sed -n "/$start_str/,/$end_str/p" ~/.bashrc)

# Remove welcome message
echo "-- Removing the ROS Conda wrapper --"

# Remove symbolic link to the ros_conda_wrapper_rc file
if [ -L "${WRAPPER_LINK}" ]; then # If symbolic link exists
    if [ -e "${WRAPPER_LINK}" ]; then # If link not broken

        # Remove Ros Conda wrapper file from  the user home directory
        echo "ROS Conda wrapper file removed from you home directory."
        rm "$WRAPPER_LINK"
    else
        echo "ROS Conda wrapper not present in you home directory."
    fi
elif [ -e "${WRAPPER_LINK}" ]; then # If exists but is not a symbolic link

    # Remove Ros Conda wrapper file from  the user home directory
    echo "ROS Conda wrapper file removed from you home directory."
    rm "$WRAPPER_LINK"
else
    echo "ROS Conda wrapper not present in you home directory."
fi

# Remove configuration file if exists
if [ -e "${ROS_CONDA_CONFIG_FILE_NAME}" ]; then

    # Remove Ros Conda wrapper file from  the user home directory
    echo "ROS Conda wrapper configuration file removed from you home directory."
    rm "$ROS_CONDA_CONFIG_FILE_NAME"
else
    echo "ROS Conda wrapper configuration file not present in you home directory."
fi

# Remove .ros_conda_wrapper from the .bashrc file if it exists
if [ -z "$exists" ]; then
    echo "ROS Conda wrapper not yet installed on your .bashrc file."
else

    # Remove source command from .bashrc
    sed --follow-symlinks -e "/$start_str/,/$end_str/d" -i.bak ~/.bashrc
    sed --follow-symlinks -e '${/^$/d;}' -i ~/.bashrc # Remove empty line if present
    echo "ROS Conda wrapper successfully removed from your .bashrc file."
fi

# Installer close messages
echo "Ros Conda wrapper successfully removed."
printf "\n"
echo "For this change to become active, you have to open a new terminal."
