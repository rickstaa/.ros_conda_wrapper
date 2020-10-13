# ROS Conda wrapper

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/6e8ab010990d4363bfe079944bfe16e4)](https://www.codacy.com/gh/rickstaa/.ros_conda_wrapper/dashboard?utm_source=github.com&utm_medium=referral&utm_content=rickstaa/.ros_conda_wrapper&utm_campaign=Badge_Grade)
[![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green)](https://github.com/rickstaa/ros_conda_wrapper/pulse)
[![Contributions](https://img.shields.io/badge/contributions-welcome-orange.svg)](contributing.md)
[![Python 3](https://img.shields.io/badge/python%203-3.7%20%7C%203.6%20%7C%203.5-yellow.svg)](https://www.python.org/)
[![Python 2](https://img.shields.io/badge/python%202-2.7%20%7C%202.6%20%7C%202.5-brightgreen.svg)](https://www.python.org/)
[![ROS versions](https://img.shields.io/badge/conda%20versions-all-brightgreen)](https://docs.conda.io)
[![ROS versions](https://img.shields.io/badge/ROS%20versions-Melodic%20%7C%20Kinectic-brightgreen)](https://wiki.ros.org)
![Supported shells](https://img.shields.io/badge/Supported%20shells-bash-blue)

This wrapper solves some known problems/conflicts you might experience while trying to use ROS Kinetic/Melodic inside a Conda environment
(see [this ROS topic](https://answers.ros.org/question/256886/conflict-anaconda-vs-ros-catking_pkg-not-found/)).

## How to setup

1.  Clone the repository to your user home directory and cd into the `.ros_conda_wrapper` folder.

    ```bash
    git clone https://github.com/rickstaa/.ros_conda_wrapper.git
    cd .ros_conda_wrapper
    ```

### Automatic installation

2.  Run the `install.sh` script to install the ROS Conda wrapper.

### Manual installation

For the manual installation isntructions see [this issue](https://github.com/rickstaa/.ros_conda_wrapper/issues/14).

## How to uninstall

To uninstall the ROS Conda wrapper run the `uninstall.sh` script before removing the `.ros_conda_wrapper` repository.

## How to use

### ROS Conda wrapper commands

All of the original `conda` commands work as expected. Additionally, a `--ros-wrapper`
command has been added. This command takes the following options:

-   `activate`: Activates the ROS Conda wrapper.
-   `deactivate`: Deactivates the ROS Conda wrapper.
-   `init <CONDA_ENVIRONMENT>`: Initializes a given &lt;CONDA_ENVIRONMENT> to work with ROS.
-   `deinit <CONDA_ENVIRONMENT>`: Deinitializes a given ROS &lt;CONDA_ENVIRONMENT> to work.
-   `-h, --help`: Displays usage information.
-   `-v, --version`: ROS Conda wrapper version.
-   `-s, --show-settings`: Shows the current settings.

:information_source: The `conda --ros-wrapper init` command does not create the environment itself it only performs some actions such that ROS will work inside a python 3 Conda environment.

### Examples

#### Make conda environment ROS compatible

The following commands can be used to make a conda environment ROS compatible:

```bash
conda create -n example_env python==3.6
conda --ros-wrapper activate
conda --ros-wrapper init example_env
conda activate example_env
```

#### Transform a ROS Conda Wrapper environment back to a normal Conda environment

The following commands can be used to transform a ROS Conda Wrapper environment back to a normal conda environment:

```bash
conda --ros-wrapper deinit example_env
conda --ros-wrapper deactivate
```

### ROS Conda wrapper environment variables

The ROS Conda wrapper adds the following environment variables:

-   `ROS_CONDA_WRAPPER`: Specifies whether the ROS Conda wrapper is installed.
-   `ROS_CONDA_WRAPPER_ACTIVE`: Specifies whether the ROS Conda wrapper is activated.
-   `ROS_CONDA_WRAPPER_ERROR`: Anaconda is not initiated or installed.

## How it works

The `.conda_wrapper` script creates an alias which wraps the original `activate` and `deactivate` Conda executable arguments. Following this wrapper modifies the `PATH` and `PYTHONPATH` such that the right python binaries are used. Additionally, the `conda rosinit <NAME_OF_YOUR_ENVIRONMENT>` command can be used to setup an environment in such a way that ROS works inside the environment. This is done by installing some additional python packages ROS needs (see [this blog post](https://medium.com/@wolfv/ros-on-conda-forge-dca6827ac4b6) by [@wolfv](https://github.com/wolfv)).

## Python 3 compatibility

### ROS melodic

As ROS Melodic does not yet fully support python3, it does not fully work inside a python 3 environment see issue [#4](https://github.com/rickstaa/ros_conda_wrapper/issues/4) and [#5](https://github.com/rickstaa/ros_conda_wrapper/issues/5). As ROS Melodic is currently being ported to python 3 ([see ROS REP 3](https://www.ros.org/reps/rep-0003.html)) theses issue will likely be solved in the coming months. As a result the `--ros-wrapper` `init` and `deinit` commands might not fully work. Please open [an issue](https://github.com/rickstaa/.ros_conda_wrapper/issues) if you run into problems.

### ROS Kinetic

ROS kinetic does not support python 3. Further, there are no plans to port the ROS kinetic python 2 packages too python 3 ([see ROS REP 3](https://www.ros.org/reps/rep-0003.html)).

## Issues

Please feel free to open [an issue](https://github.com/rickstaa/.ros_conda_wrapper/issues) if you run into problems or have suggestions.

## Acknowledgement

-   :rocket: Special thanks to [@StefanFabian](https://github.com/StefanFabian) for creating the [original gist](https://gist.github.com/StefanFabian/17fa715e783cd2be6a32cd5bbb98acd9) on which this wrapper is based.

## Contributing

Contributions to this repository are welcome. See the [contribution guidelines](contributing.md) for more information.

## License

[MIT](LICENSE)
