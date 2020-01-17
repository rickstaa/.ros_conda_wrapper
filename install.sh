#!/bin/bash

# Install script variables
start_str="# >>> ros_conda_wrapper initialize >>>"
end_str="# <<< ros_conda_wrapper initialize <<<"
WRAPPER_NAME="ros_conda_wrapper_rc"
WRAPPER_LINK=${HOME}"/."${WRAPPER_NAME}

# Check if wrapper does already exists
exists=$(sed -n "/$start_str/,/$end_str/p" ~/.bashrc) # Check if patern is already present

# Install welcome message
echo "-- Installing the ROS Conda wrapper --"

# Create symbolic link to the ros_conda_wrapper_rc file
if [ -L "${WRAPPER_LINK}" ]; then # If symbolic link exists
    if [ -e "${WRAPPER_LINK}" ]; then # If link not broken
        echo "ROS Conda wrapper file already present in your home directory."
    else

        # Add Ros Conda wrapper file to the user home directory
        echo "ROS Conda wrapper file added to your home directory."
        ln -fs "$(pwd)/${WRAPPER_NAME}" "$(echo "$HOME")/.${WRAPPER_NAME}"
    fi
elif [ -e ${WRAPPER_LINK} ]; then # If exists but is not a symbolic link

    # Add Ros Conda wrapper file to the user home directory
    echo "ROS Conda wrapper file added to your home directory."
    ln -fs "$(pwd)/${WRAPPER_NAME}" "$(echo "$HOME")/.${WRAPPER_NAME}"
else

    # Add Ros Conda wrapper file to the user home directory
    echo "ROS Conda wrapper file added to your home directory."
    ln -fs "$(pwd)/${WRAPPER_NAME}" "$(echo "$HOME")/.${WRAPPER_NAME}"
fi

# Append .ros_conda_wrapper if it does not exist yet
if [ -z "$exists" ]; then

    # Create backup of .bashrc file
    echo "A backup will be made to: ${HOME}/.bashrc-ros_conda_wrapper.bak"
    cp ~/.bashrc ~/.bashrc-ros_conda_wrapper.bak # Create backup

    # Add source command to .bashrc
    sed --follow-symlinks -e '${/^$/!G;}' -i ~/.bashrc
    cat >>~/.bashrc <<-EOL
$start_str
if [ -f "$HOME/.ros_conda_wrapper_rc" ]; then
    . "$HOME/.ros_conda_wrapper_rc"
fi
$end_str
EOL
    echo "ros_conda_wrapper_rc file source command installed to your .bashrc file."
else
    echo "ros_conda_wrapper_rc file source command already installed to your .bashrc file."
fi

# Installer close messages
echo "Ros Conda wrapper successfully installed."
printf "\n"
echo "For this change to become active, you have to open a new terminal."
