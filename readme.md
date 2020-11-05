<h1>Exosome AFM Analysis tool</h1>

A tool to extract average properties from all channels from AFM images of exosomes. Images are thresholded based on the height channel. The height channel is used as a mask to extract properties from the other channels.
Averaged properties within the masked areas can be output to Excel, .MAT or sqLite formats.

The intention is not to replace more comprehensive AFM analysis tools, but as a pipeline to efficiently create masks based on a single image channel 

If you use this app please cite ...

If you would like to use this software but are haivng problems with processing your datasets, or would like the app to include features not yet implemented please create an issue.

<h2> Installation (using installer) </h2>

1. Download or clone repo
2. Navigate to directory corresponding to your operating system
3. For Windows operating systems, run the ExoThres_Installer.exe
4. For macOS ...


<h2>Run in MATLAB </h2>
If a compatible version of MATLAB is installed on your system, navigate to the source directory and open the AFM_Exosome_App.mlapp in app designer 
(Note this app was developed using MATLAB 2019a). 

<h2>Usage Example </h2>
Example input data is located at the top level of the repo, in example1.gwy and example2.gwy. The example below is performed on example2.gwy.

1. **Open AFM file**

Using open file button. Height data will be dislayed in the 'Height Raw Data' window. 
Other channels can be viewed in the Channels window (Note currently files should be converted to .gwy format using [Gwyydion format](http://gwyddion.net/) software).

![Opening Screen](/images/OpenFile.PNG)

2. **Zero Channels (optional)**

Subtract the minimum pixel value from the height and/or the adhesion channels (so all values are greater than zero) using the 'Zero Height' and 'Zero Adhesion' buttons respectively. 
Confirmation of these operations are dislayed in the history window.

![Zero screen](/images/HeightZeroed.PNG) 


3. **Polynomial Levelling (optional)**
 A (1st or 2nd)polynomial surface can be fitted to and then subtracted from the height channel to correct for any curvature. The fit level button fits a surface to the data points, 
 which is displayed in the 'Height Processed' plot window. Apply level subtracts the fitted surface from the data points. 

![Levelling Screen](/images/level.PNG) 


4. **Median Filter (optional) and Threshold**
Pressing the filter button will apply an Otsu threshold to the height channel. The filtered image will appear in the 'Height Processed' plot window. If the thresholded image is noisy, pressing the filter button will apply a median filter to the 
image which will help remove noise. The median filter can be applied multiple times. The 'Height Processed' window will update.

![Threshold screen](/images/threshold.PNG)


5. **Remove small or large Objects (optional)**
Objects with diameter below or above a user selected value can be removed. The smallest and largest diameter can either be entered manually or selected interactively on the 'Height Raw Data'
window. When the ranges have been entered press Remove Objects button to remove objects outside the selected range. 

![Object Remove Screen](/images/objectRemove.PNG)

6. **Erosion and Dilation (optional)**
The edges of objects can be smoothed using erosion and dilation. Erosion removes and dilation adds pixels to object boundaries respectively. 
(see [here](https://uk.mathworks.com/help/images/morphological-dilation-and-erosion.html#mw_870854ff-1cfa-4a13-94a5-58fd427d9d55)). Larger strel size will remove or add more pixels to 
the boundaries. 

![Erosion Screen](/images/erosion.PNG)

7. **Declump Objects (optional)**
Sometimes multiple objects are close together and appear as one object. Pressing the 'Declump' object allows users to interactively select objects in the 'Height Processed' 
to apply a watershed algorithm to.
The declumped object will be dislayed and the user will be prompted to keep the result. 

![Declump Scrren](/images/declump.PNG) 


8. **Locate Object Centres** 
The final processing step is to locate the object centres by pressing the 'Object Centres' button. The final masks (which will be used to calculate the parameters) are displayed in the
'Final Results' plot window.

![Object Centres screen](/images/results.PNG) 


9. **Write Results to File**
To write results to file select the output directory using the 'Select Output Directory' button. Give the filename a prefix. Select the type of output file (Excel, Mat or SQLite) that you would like to 
save to. In addition to the data file, a png image and a MATLAB fig file, showing the locations and the number of the objects. The object numbers correspond to the rows in the data files.

![Write Results Screen](/images/write.PNG)

  
  
<h2>To be updated in next version </h2>
  
  1. Loading of other AFM formats
  2. Compile macOS and Linux versions of the installer
