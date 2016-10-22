int skipLine = 0;

void sortData() {
  
  sorted = new float[done.length][4];
  float record = 1000000;
  int start = 0;
  int slut = 0;
  int prosSteps = 0;
  int orderCount = 0;
  
  //--------- FIND START BEGIN ---------//
  for (int i = 0; i<done.length; i++) {
    float middel = dist(0, height, dots[i].x, dots[i].y);  
    if (middel<record) {
      record = middel; 
      start = i;
    }
  }
  //--------- FIND START END ---------//
  
  
  ellipse(dots[start].x, dots[start].y, 10, 10);
  done[start]=0;
  int count = 0;
  for (int i = 2; i<done.length; i++) {
    //stroke(i, 200, 200);
    for (int j = 0; j<done.length; j++) {
      int check = done[j];
      if (check != 0) {
        float distance = dist(dots[start].x, dots[start].y, dots[check].x, dots[check].y);  
        if (distance<record) {
          record = distance; 
          slut = j;
        }
      }
      
      if (j==done.length-1) {
        done[slut]=0;
        if(record<threshold){
          sorted[orderCount][0] = dots[start].x;
          sorted[orderCount][1] = dots[start].y;
          sorted[orderCount][2] = dots[slut].x;
          sorted[orderCount][3] = dots[slut].y;         
          orderCount++;
        }else{
          skipLine++; 
        }
        record = 1000000;
        start = slut;
      }
    }
    count++;
    int pros = (100*count)/number;
    
    if(count == 1){
    println("____________________________________");  
    print("Processing:");
    }
    if(pros>prosSteps){
      print("/");
      prosSteps += 4;
    }
  }
  println();
  print("Lines skipped: "+skipLine);
  print("\t");
  println("Threshold: "+threshold+"mm");
}