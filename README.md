# ros_conda_wrapper

[![Maintained](https://img.shields.io/badge/Maintained%3F-yes-green)](https://github.com/rickstaa/ros_conda_wrapper/pulse)
[![Contributions](https://img.shields.io/badge/contributions-welcome-orange.svg)](https://github.com/rickstaa/ros_conda_wrapper/blob/master/contributing.md)
[![Tmux version](https://img.shields.io/badge/tmux-%3D%3E1.9-blue)](https://github.com/tmux/tmux/wiki)

This wrapper solves some problems people have while trying to use ROS inside a conda environment.

## How to use

1.  Add the `.conda_wrapper` file to your user home directory.
2.  Add the following code at the end of your `.bashrc`.

```bash
## Source conda wrapper script
if [ -f "~/.conda_wrapper" ]; then
    . "~/.conda_wrapper"
fi
```

## How it works

The `.conda_wrapper` script creates a alias which overloads the conda `activate` and conda `deactivate`. The overloaded versions of these functions do 2 things to enable ROS to work inside a conda environment.

### Solve PYTHONPATH

The wrapper saves the old `PYTHON_PATH` so it can be restored when you deactivate the anaconda environment. This allows you to easily switch between ROS and anaconda might you run into problems.

### Install a number of additional python packages

In order for ROS to work inside a conda environment you need a number of additional ROS python packages. These packages can be installed inside your conda environment using the `conda rosinit <NAME_OF_YOUR_ENVIRONMENT>` command. To remove these packages again you can use the `conda rosinit <NAME_OF_YOUR_ENVIRONMENT>`. You can check wheter an enviroment has been initialized to work with ros by checking the `$ROS_CONDA` enviromental variable from within your enviroment.

## Contributing

Contributions to this repository are welcome. See the [contribution guidelines](https://github.com/rickstaa/ros_conda_warpper/blob/master/contributing.md) for more information.

## License

[MIT](https://github.com/rickstaa/ros_conda_warpper/blob/master/LISENCE)
