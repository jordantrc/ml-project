If you use VAIS (Visible and Infrared Ships) in your research, please cite:

Zhang, M.M, Choi, J., Daniilidis, K., Wolf, M.T. & Kanan, C. (2015) VAIS: A
Dataset for Recognizing Maritime Imagery in the Visible and Infrared
Spectrums. In: Proc of the 11th IEEE Workshop on Perception Beyond the Visible
Spectrum (PBVS-2015).

ABOUT VAIS

annotations.txt contains the annotations for VAIS.

Each line contains seven space delimited pieces of information, in this
format:

Visible_Image IR_Image Fine_Grained_Label Basic_Label Unique_ID Is_Training Is_Night

Visible_Image is the relative path to the visible (EO) image and IR_Image is
the relative path to the corresponded IR_Image. If either of these images does
not exist the string 'null' will be there instead of the path.

Fine_Grained_Label is a string that contains the fine grained label for the
visible and IR images on the line and Basic_Label is similarly defined for
the basic level categories. Unique_ID is assigned to each ship based on its
name. Is_Training denotes whether the image is to be used for training or
evaluation, with a 1 indicating training and a 0 evaluation. Is_Night
indicates if the image was taken at night or not. 

VAIS STATISTICS

Total IR Images: 1242
Total Visible Images: 1623
Total Images: 2865
Total Pairs: 1088
Number of unique ships: 264
Number of Night IR Images: 154
Number of Fine-Grained Categories: 15
Number of Basic Categories: 6

CONTACT
Christopher Kanan (kanan@jpl.nasa.gov)

ACKNOWLEDGMENTS

VAIS was created by the Jet Propulsion Laboratory, California Institute of
Technology, under a contract with the National Aeronautics and Space
Administration. Funding for this work was provided by the Defense Advanced
Research Projects Agency (DARPA), under contract #NNN13R513T. The views,
opinions, and/or findings contained in this material are those of the
authors and should not be interpreted as representing the official
views or policies of the Department of Defense or the U.S. Government.
Distribution Statement A: Approved for public release; distribution is
unlimited.
