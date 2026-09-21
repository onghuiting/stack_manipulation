

// This macro saves the orthogonal views for all time points.
//
//(1) change the "dirname" to a directory where you want to save your files.
//(2) after image->stacks->orthogonal views, go to the channel & XYZ you want.
//(3) run this macro.
//
// Written by hui ting, 27 Nov 2013


dirname = "C:\\Users\\ong\\Desktop\\lei\\";

selectImage(2);
YZ_window_name=getTitle;

selectImage(3);
XZ_window_name=getTitle;

selectImage(1);
name=getTitle;
Stack.getDimensions(width, height, channels, slices, frames); 

for (i=1;i<=frames;i++){

selectWindow(name);
Stack.setFrame(i); 

selectWindow(XZ_window_name);
saveAs("Tiff", dirname + "xz" +i+ ".tif");
rename(XZ_window_name);

selectWindow(YZ_window_name);
saveAs("Tiff", dirname + "yz" +i+ ".tif");
rename(YZ_window_name);

}



