## My Emacs Config
This is my emacs configuration tree. It is here
mainly so that I can quickly get my environment up and
running on a new machine, but feel free to also use it!

## Installation
To install, clone this repo to `~/.emacs.d`, i.e. ensure that the
`init.el` contained in this repo ends up at `~/.emacs.d/init.el`.

init-packages.el automatically installs packages that need to be installed, showing
them in a buffer which when finished can be killed with
the usual <kbd>C-x</kbd> <kbd>k</kbd>.

## Dependencies

Most of the dependencies are python realted (where I spend most of my time).

Install the required python packages as follows:

# Either of these
pip install rope
pip install jedi
# flake8 for code checks
pip install flake8
# importmagic for automatic imports
pip install importmagic
# and autopep8 for automatic PEP8 formatting
pip install autopep8
# and yapf for code formatting
pip install yapf

One-line install: **pip install jedi flake8 importmagic autopep8**

For dependenciess not included here (can't remember them all), emacs  will simply complain that it can't find them or it is not installed etc. 

Simply install whatever package it says it cannot find and you are good to go!

## Custom Keybindings
The various custom keybindings can be found in init-keybindings.el.

## Custom Functions
These can be found in init-functions.el.

## Color Theme
The color theme used is the cyberpunk theme. I have changed it a good bit
though. These changes along with various other general customisations can be seen in custom.el.
