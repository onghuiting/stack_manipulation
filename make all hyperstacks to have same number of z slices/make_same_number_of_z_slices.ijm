

// This macro creates output hyperstacks with same number of z slices.
// The input folder should consist of multiple .tif files.
// Each .tif file should be a stack or hyperstack.
// The macro will add blank z slices to the hyperstack, so that the hyperstack will
// have the total_z_slices as specified by the user.
//
// Written by hui ting, 15 June.

////////////////////////////////////////////////////////////////////////////////////

total_z_slices = 81; // to be specified by user

////////////////////////////////////////////////////////////////////////////////////

pathname = getDirectory("Select your input folder");
list = getFileList(pathname);
total_files = list.length;

res_folder = pathname+"same_z";
File.makeDirectory(res_folder);

for (i = 0; i < total_files; i++) {
	if (endsWith(list[i], ".tif")){
		
open(pathname+list[i]);
rename(list[i]);

name = list[i];
Stack.getDimensions(width, height, channels, slices, frames);
z_diff = total_z_slices-slices;

if (z_diff>0){
newImage("blank", "16-bit grayscale-mode", width, height, channels, z_diff, frames);
run("Concatenate...", "open image1="+name+" image2=blank");
}
saveAs("Tiff", res_folder+File.separator+name);
run("Close All");

	}
}

