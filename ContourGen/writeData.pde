PrintWriter output;

void writeData() {  
  String[] fileList = split(file, '.');
  output = createWriter("gcode/"+fileList[0]+"/"+fileList[0]+"_"+resolution+".nc");  // nc for gcode file
  output.println("G0 Z"+zHeight);
  int amount = int(sorted.length*stopAt);
  for (int i = 0; i<amount; i++) {  //print speed
    
    //float distanceCheck = dist(sorted[i][0],sorted[i][1],sorted[i][2],sorted[i][3]);
    
    float x =     map(sorted[i][0], 0,width,0,paperW);
    float y =     map(sorted[i][1], 0,height,paperH,0);
    float distX = map(sorted[i][2], 0,width,0,paperW);
    float distY = map(sorted[i][3], 0,height,paperH,0);
    
    float distance = dist(x,y,distX,distY);
    distance = map(distance,0,paperH,0,width);
    
    if(i==0){                                     // lift when going to start
      output.println("G0"+" X"+x+" Y"+y);
      output.println("G0 Z"+zTarget);
   /* }else if(distanceCheck > threshold){        // lift for travels
      output.println("G0 Z"+zHeight);
      output.println("G0"+" X"+x+" Y"+y);  */            
    }else if(i==sorted.length-stopAt){            // lift when done and save file
      output.println("G0 Z"+zHeight);
      output.flush(); 
      output.close(); // Finishes the file 
      println("File saved: "+"gcode/"+fileList[0]+"/"+fileList[0]+"_"+resolution+".nc");
      
    }else{         // print 
      output.println("G0"+" X"+x+" Y"+y);         // draw lines
    }
  }
}