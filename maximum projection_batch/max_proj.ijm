

// This macro performs max projection and sum projection in batch.
//
// Written by hui ting, 29 Nov 2016.


dir = getDirectory("Choose a input folder"); 

res_dir_max = dir+"MAX";
res_dir_sum = dir+"SUM";
File.makeDirectory(res_dir_max); 
File.makeDirectory(res_dir_sum); 


list = getFileList(dir); 

 for (i=0; i< list.length; i++) {
     // process ids files only
     if (endsWith(list[i], ".ids")) {
         
         run("Bio-Formats Importer", "open=" + dir + list[i] + " color_mode=Default view=Hyperstack stack_order=XYCZT");

         name = getTitle;
		 run("Z Project...", "projection=[Max Intensity]");
		 run("Bio-Formats Exporter", "save="+res_dir_max+File.separator+name+"_max.ids");
		 close("MAX_"+name);

		 selectWindow(name);
		 run("Z Project...", "projection=[Sum Slices]");
		 run("Bio-Formats Exporter", "save="+res_dir_sum+File.separator+name+"_sum.ids");

		 close(name);
		 close("SUM_"+name);
         
     }
 }







