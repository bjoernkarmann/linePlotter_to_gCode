//=============================================================================//
// ContureGenerator
// By Bjørn Karmann, 01.03.2016
// www.bjoernkarmann.dk
// 
//Note: The resolution has to work on width
//and height.
// 800mm width x 1000mm height allow a resolution
//=============================================================================//

PImage img;
int number = 0;
float res = 0;
PVector[] dots;
float[][] sorted;
int[] done;
boolean targetIs = false;
int sortedLength = 0;
int c = 0;

//=============================================================================//
//                              MACHINE SETTINGS                               //

String file        = "water-color6.jpg";  // file name (data folder)       
int threshold      = 60;                  // max line (mm)
int resolution     = 350;                 // bedst result
int paperW         = 700;                 // mm paper width
int paperH         = 1000;                // mm paper height
int zHeight        = 18;                  // mm (pen lift)
int zTarget        = -1;                  // mm 
float stopAt       = 0.95;                // 1 = finish drawing at 100%

//                             EXAMPLE DRAW SETTINGS
 
float penThickness = 0.005;               // mm pen thikness
boolean grid       = false;               // show grid of resolution
int printSpeed     = 10;                  // lines pr. ms for draw animation


//                                                                             //
//=============================================================================//

void setup() { 
  background(255);
  frameRate(800);
  size(700, 900);  
  res = int(height/resolution);   
  println(res);
  threshold = 100;
  buildData();
  if (grid == true) {
    grid();
  }
  sortData();
  writeData();
  strokeWeight(penThickness);
}

void draw() {
  
//=============================================================================//
//                                EXAMPLE DRAW                                 //

  int amount = int(sorted.length*stopAt);
  
  for (int i = 0; i<100; i++) {  //print speed
      
    float x = sorted[c][0];
    float y = sorted[c][1];
    float distX = sorted[c][2];
    float distY = sorted[c][3];

    line(x, y, distX, distY); 
    c++;
  }
  
  if(c >= amount){
    println("Drawing finished!");
    String[] fileList = split(file, '.');       // save jpg file
    saveFrame("gcode/"+fileList[0]+"/example_"+resolution+".jpg");
    noLoop();    
  }
}

//=============================================================================//
//                            SHOW RESOLUTION GRID                             //

void grid() {

  stroke(240);
  for (int i = 0; i<width; i+=res) {
    line(0, i, height, i);
    line(i, 0, i, width);
  }
}