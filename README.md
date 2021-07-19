# IKUB 

*R-package for visualization of anatomical volumetry results*

Anatomical segmentation is a central process within computational anatomy. Output is generally represented as 3D arrays, with each cell ("voxel") 
corresponding to a location in space. The voxel value is a categorical variable that indicates the anatomical region of which the voxel is a part. 

IKUB provides functions for loading, analysing, and visualizing such output. Visualization options include plotting of distributions of region sizes
as well as showing labels in the context of the source image.

The required input format is currently NIfTI. The package has been tested with data from the [Hammers Atlas Database](https://www.brain-development.org) 
(MR brain images and expert-drawn anatomical labels) and [MAPER](https://github.com/soundray/maper)-generated segmentations of the MR images in the database.
