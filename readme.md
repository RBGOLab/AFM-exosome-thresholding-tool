<h1>Exosome AFM Analysis tool</h1>

A tool to extract average properties from all channels from AFM images of exosomes. Images are thresholded based on the height channel. The height channel is used as a mask to extract properties from the other channels.
Averaged properties within the masked areas can be output to Excel, .MAT or sqLite formats.



<h2> Installation (using installer) </h2>

1. Download or clone repo
2. Navigate to directory corresponding to your operating system
3. For Windows operating systems, run the ExoThres_Installer.exe
4. For macOS ...


<h2>Run in MATLAB </h2>
If a compatible version of MATLAB is installed on your system, navigate to the source directory and open the AFM_Exosome_App.mlapp in app designer 
(Note this app was developed using MATLAB 2019a). 

<h2>Usage Example </h2>


1. **Open AFM file**

Using open file button. Height data will be dislayed in the 'Height Raw Data' window. 
Other channels can be viewed in the channel window (Note currently files should be converted to .gwy format using [Gwyydion format](http://gwyddion.net/) software).

![Opening Screen](/images/OpenFile.PNG)

2. **Zero Channels (optional)**

Subtract the minimum pixel value from the 


3. **Polynomial Levelling (optional)**


4. **Median Filter (optional)**


5. **Threshold**


6. **Remove small or large Objects (optional)**


7. **Declump Objects (optional)**


8. **Locate Object Centres** 


9. **Write Results to File**





  1. Read data (currently only in [Gwyydion format](http://gwyddion.net/))
  
  
<h2>To be updated in next version </h2>
  
  1. Loading of other AFM formats
  2. Compile macOS and Linux versions of the installer
