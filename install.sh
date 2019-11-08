#!/bin/bash

# Check if wrapper does already exists
start_str="# >>> ros_conda_wrapper initialize >>>"
end_str="# <<< ros_conda_wrapper initialize <<<"
exists=$(sed -n "/$start_str/,/$end_str/p" ~/.bashrc) # Check if patern is already present

# Append .ros_conda_wrapper if it does not exist yet
if [ -z "$exists" ]; then
    cp ~/.bashrc ~/.bashrc_bak # Create backup
    sed --follow-symlinks -e '${/^$/!G;}' -i ~/.bashrc
    cat >> ~/.bashrc <<-EOL
# >>> ros_conda_wrapper initialize >>>
## Source conda wrapper script
if [ -f "~/.conda_wrapper" ]; then
    . "~/.conda_wrapper"
fi
# <<< ros_conda_wrapper initialize <<<
EOL
    echo "Installed ROS Conda wrapper to your .bashrc file."
else
    echo "ROS Conda wrapper already installed to your .bashrc file."
fi

