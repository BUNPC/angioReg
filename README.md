

# Description:
This GUI is used to register two 2D/3D angiograms by manually selecting matching points between the two angiograms. The Matlab function “procrustes” is used to create the affine transformation given these matching points.This GUI will then perform the transformation of the images.The image transformation is done with our own custom algorithm that is not optimized. We should adopt an optimized algorithm for 3D image transformation. After Linear registartion, images may not align well due to motion or other types of non-linear transformations. To correct this, GUI has two nonlinear regsitration options using "imregdemons" and "scatteredInterpolant". 

# Input: 
Angiogram image files
Two file names are provided that contain the volumetric image of the two angiograms to be registered. The files can be MAT or TIF files. Please note that MAT files assume the image is ordered as z, x, and y; while the TIF files assume the image is ordered as x, y, and z. See the example files.

# Output: 
The following information can be saved from the GUI.

pts2register.mat contains matching points used for the registration (‘pts2register’ is a user defined variable name, and can be arbitrarily names while saving the points.)
Pts2register.mat has 2 variables:
*Angio1pts [Nx3]* - contains 3D coordinates of the points on Angiogram1
Angio2pts [Nx3] - contains 3D coordinates of the points on Angiogram2

TransformedAngio1.mat contains the transformed angiogram1 into the angiogram2 space. The name ‘TransformedAngio1’ is user defined, and can be set while saving the transformed angiogram.
TransformedAngio1.mat has 1 variable:
angio [Z2xX2xY2] - contains the transformed angiogram1 which has size of angiogram2. Z2, X2 and Y2 are the number of elements in angiogram2 in the Z, X and Y directions respectively.

TransformedAngio2.mat contains the transformed angiogram2 into angiogram1 space. The name ‘TransformedAngio2’ is user defined, and can be set while saving the transformed angiogram.
TransformedAngio2.mat has 1 variable:
angio [Z1xX1xY1] - contains the transformed angiogram2 which has size of angiogram1. Z1, X1 and Y1 are the number of elements in angiogram1 in the Z, X and Y directions respectively.

# Instructions to run angioReg GUI:
* Make sure KuraSuite is in your matlab path using the matlab command setpaths(path, genpath(cd)) from the KuraSuite root directory (or from the angioReg sub-directory).
* Change directory to the folder containing your data files.
Type angioReg in the MATLAB command window (Do not open by double clicking angioReg.fig. It will open the GUI but it may not function properly).
* To Load the angiograms go to ** File > Load Data **
* A window prompt opens. Select the TIF or mat file that contains your first angiogram data.
* Another window prompt will open. Select the second TIF or mat file that contains your OCT or TPM data.
* Rotate 90 Anticlockwise,Rotate 90 clockwise and Transpose push buttons helps to orient the Angiogram2 such that it will be easy to identify identical points.
* If needed, load previously selected points (Menu > Load points) or else go to the next step.
* Select identical capillary segment bifurcation points on the first image (left axis) and the second image (right axis). To do this, select the Add radio button under image1. Pick a branching point you can easily identify on both images. Then use the Z slider on the right of both images to set your desired Z position for the point. Please set ZMIP to 1 for both volumes to unambiguously identify the z position of the points. Lastly, select the bifurcation point in both volumes with the mouse left click.
* Repeat step 9 for at least 10 points. For best results, scatter the points uniformly throughout the volume. 
* To delete points, select Remove in the button group under image 1 and then click on the number you’d like to remove. A window will appear that says “Would you like to delete point  x ?”. Select “Yes”
* After selecting your points, save the results (Menu > Save points). Note that you are advised to regularly save your work as you progress. You don’t need to wait until everything is selected before saving.
* After selecting all desired points, go to the Tools menu to perform the Registration. There, you can choose to Tools > RegisterAngio1to2 if you want to register angiogram1 to angiogram2 or Tools > RegisterAngio2to1 if you want to register angiogram2 to angiogram1.
* Once the registration is complete, you can overlay the transformed image onto another using the Overlay check box. 
* If Angiogram1 is registered to Angiogram2 then select Transformed Angiogram1 radio button and select the Overlay radiobutton. Axis1 will display Transformed Angiogram1 with gray color and Angiogram2 with green color overlay.
* If Angiogram2 registered to Angiogram1 then select Transformed Angiogram2 radio button and select Overlay radiobutton. Axis1 will display Angiogram1 with gray color and Transformed Angiogram2 with green color overlay.
* To save transformed angiograms go to Tools > Save Transformed angiogram1 or Save Transformed angiogram2
