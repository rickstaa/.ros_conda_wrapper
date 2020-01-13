#!/bin/bash

# Check if wrapper does already exists
start_str="# >>> ros_conda_wrapper initialize >>>"
end_str="# <<< ros_conda_wrapper initialize <<<"
exists=$(sed -n "/$start_str/,/$end_str/p" ~/.bashrc) # Check if patern is already present

# Create symbolic link to the .ros_conda_wrapper_rc file
WRAPPER_NAME=".ros_conda_wrapper_rc"
WRAPPER_LINK="$(echo "$HOME")/$WRAPPER_NAME"
if [ -L "${WRAPPER_LINK}" ]; then
    if [ -e "${WRAPPER_LINK}" ]; then
        echo "ROS conda wrapper file already present in your home directory."
    else
        echo "ROS conda wrapper file added to your home directory."
        ln -fs "$(pwd)/$WRAPPER_NAME" "$(echo "$HOME")/$WRAPPER_NAME"
    fi
elif [ -e ${WRAPPER_LINK} ]; then
    echo "ROS conda wrapper file added to your home directory."
    ln -fs "$(pwd)/$WRAPPER_NAME" "$(echo "$HOME")/$WRAPPER_NAME"
else
    echo "ROS conda wrapper file added to your home directory."
    ln -fs "$(pwd)/$WRAPPER_NAME" "$(echo "$HOME")/$WRAPPER_NAME"
fi

# Append .ros_conda_wrapper if it does not exist yet
if [ -z "$exists" ]; then
    cp ~/.bashrc ~/.bashrc_bak # Create backup
    sed --follow-symlinks -e '${/^$/!G;}' -i ~/.bashrc
    cat >>~/.bashrc <<-EOL
# >>> ros_conda_wrapper initialize >>>
$start_str
if [ -f "$HOME/.ros_conda_wrapper_rc" ]; then
    . "$HOME/.ros_conda_wrapper_rc"
fi
$end_str
EOL
    echo "ROS Conda wrapper installed to your .bashrc file."
else
    echo "ROS Conda wrapper already installed to your .bashrc file."
fi
