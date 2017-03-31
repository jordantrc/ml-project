# CS 880 ML Project

# Prerequisites

The code directory contains a few scripts and IPython notebooks for data processing.

Requirements:
* Python 3
* Pillow library
* IPython
* IPython Notebook

# Image Requirements
Images must be stored in the images/combined folder. The naming convention is as follows:

classification_dataset_index.jpg|png

where classification is one of ship, sky, ocean, or land.

The index must be unique to the dataset.

Images will be resized to 200 pixels by 200 pixels using the LANCZOS filter.