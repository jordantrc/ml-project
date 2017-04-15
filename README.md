# CS 880 ML Project

# Prerequisites

The code directory contains a few scripts and IPython notebooks for data processing.

Requirements:
* Python 3.5
* Pillow
* IPython
* Jupyter Notebook
* SkLearn (0.18+)
* Numpy
* Pandas
* Tensorflow 1.0.1+

# Image Requirements
Images must be stored in the images/combined folder. The naming convention is as follows:

classification_dataset_index.jpg|png

where classification is one of ship, sky, ocean, or land.

The index must be unique to the dataset.

Images will be resized to 32 pixels by 32 pixels using the LANCZOS filter.

Features are the RGB values of each pixel.