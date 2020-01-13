#!/bin/bash

# Remove .ros_conda_wrapper initiation from .bashrc
start_str="# >>> ros_conda_wrapper initialize >>>"
end_str="# <<< ros_conda_wrapper initialize <<<"
exists=$(sed -n "/$start_str/,/$end_str/p" ~/.bashrc) # Check if patern is already present

# REmove symbolic link to the .ros_conda_wrapper_rc file
WRAPPER_NAME=".ros_conda_wrapper_rc"
WRAPPER_LINK="$(echo "$HOME")/$WRAPPER_NAME"
if [ -L "${WRAPPER_LINK}" ]; then
    if [ -e "${WRAPPER_LINK}" ]; then
        echo "ROS conda wrapper file removed from you home directory."
        rm "$WRAPPER_LINK"
    else
        echo "ROS conda wrapper not present in you home directory."
    fi
elif [ -e "${WRAPPER_LINK}" ]; then
    echo "ROS conda wrapper file removed from you home directory."
    rm "$WRAPPER_LINK"
else
    echo "ROS conda wrapper not present in you home directory."
fi

# Remove .ros_conda_wrapper from the .bashrc file if it exists
if [ -z "$exists" ]; then
    echo "ROS Conda wrapper not yet installed on your .bashrc file."
else
    sed --follow-symlinks -e "/$start_str/,/$end_str/d" -i.bak ~/.bashrc
    sed --follow-symlinks -e '${/^$/d;}' -i ~/.bashrc # Remove empty line if present
    echo "ROS Conda wrapper succesfully removed from your .bashrc file."
fi
