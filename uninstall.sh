#!/bin/bash

# Remove .ros_conda_wrapper initiation from .bashrc
start_str="# >>> ros_conda_wrapper initialize >>>"
end_str="# <<< ros_conda_wrapper initialize <<<"
exists=$(sed -n "/$start_str/,/$end_str/p" ~/.bashrc) # Check if patern is already present

# Append .ros_conda_wrapper if it does not exist yet
if [ -z "$exists" ]; then
    echo "ROS Conda wrapper not yet installed on your .bashrc file."
else
    echo "ROS Conda wrapper succesfully removed from your .bashrc file."
    sed --follow-symlinks -e "/$start_str/,/$end_str/d" -i.bak ~/.bashrc
    sed --follow-symlinks -e '${/^$/d;}' -i ~/.bashrc # Remove empty line if present
fi
