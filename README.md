# ros_conda_wrapper

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/3bac6de9531d40e699010223fa5a0ddf)](https://app.codacy.com/app/rickstaa/ros_conda_wrapper?utm_source=github.com&utm_medium=referral&utm_content=rickstaa/ros_conda_wrapper&utm_campaign=Badge_Grade_Dashboard)
[![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green)](https://github.com/rickstaa/ros_conda_wrapper/pulse)
[![Contributions](https://img.shields.io/badge/contributions-welcome-orange.svg)](contributing.md)
[![Conda version](https://img.shields.io/badge/conda-%3D%3E4.4-blue)](https://conda.io/en/latest/)
[![Python 3](https://img.shields.io/badge/python%203-3.7%20%7C%203.6%20%7C%203.5-yellow.svg)](https://www.python.org/)
[![Python 2](https://img.shields.io/badge/python%202-2.7%20%7C%202.6%20%7C%202.5-brightgreen.svg)](https://www.python.org/)
[![Ros versions](https://img.shields.io/badge/ROS%20versions-Melodic%20%7C%20Kinectic-brightgreen)](https://wiki.ros.org)

This wrapper solves some problems people have while trying to use ROS Kinetic/Melodic inside a conda environment.

:warning: As ROS Kinetic/Melodic does not yet fully support python3 it does not fully work inside a python 3 enviroment see issue [#4](https://github.com/rickstaa/ros_conda_wrapper/issues/4) and [#5](https://github.com/rickstaa/ros_conda_wrapper/issues/5). :warning:

:warning: As ROS Kinetic/Melodic does not yet fully support python3 it does not fully work inside a python 3 enviroment see issue [#4](https://github.com/rickstaa/ros_conda_wrapper/issues/4) and [#5](https://github.com/rickstaa/ros_conda_wrapper/issues/5). :warning:

## How to setup

1.  Add the `.conda_wrapper` file to your user home directory.
2.  Add the following code at the end of your `.bashrc`.

```bash
## Source conda wrapper script
if [ -f "~/.conda_wrapper" ]; then
    . "~/.conda_wrapper"
fi
```

## How to use

### Ros conda wrapper commands

All of the original `conda` commands work as expected. Additionally to extra commands have been added:

-   `conda rosinit`: Initiates a ros_conda python 3 environment.
-   `conda rosdeinit`: Removes the ros_conda python 3 enviroment initiation.

**NOTE:** The `conda rosinit` command does not create the enviroment itself it only performs some actions such that ros will work inside a python 3 conda environment.

## How it works

The `.conda_wrapper` script creates an alias which wraps the original `activate` and `deactivate` conda executable arguments. Following these wrappers fix a conflict in the [PYTHONPATH between ROS and CONDA](https://answers.ros.org/question/256886/conflict-anaconda-vs-ros-catking_pkg-not-found/). Additionally the `conda rosinit <NAME_OF_YOUR_ENVIRONMENT>` command can be used to setup a enviroment in such a way that ROS works inside the environment.

## Known issues
-  The wrapper currently only works with `catkin_make` and not `catkin build` (see [this issue](https://github.com/rickstaa/ros_conda_wrapper/issues/4)).

## Contributing

Contributions to this repository are welcome. See the [contribution guidelines](contributing.md) for more information.

### Roadmap

- [issue #4](https://github.com/rickstaa/ros_conda_wrapper/issues/4)
- [issue #5](https://github.com/rickstaa/ros_conda_wrapper/issues/5)
- [feature #1](https://github.com/rickstaa/ros_conda_wrapper/issues/1)
- [feature #3](https://github.com/rickstaa/ros_conda_wrapper/issues/3)

I will look at issues [#4](https://github.com/rickstaa/ros_conda_wrapper/issues/4) and [#5](https://github.com/rickstaa/ros_conda_wrapper/issues/5) myself later this year since I currently don't have the time to fix them however feel free to contribute a fix yourself.

## License

[MIT](LICENSE)
