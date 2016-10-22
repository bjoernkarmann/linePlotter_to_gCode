void buildData() { 
  
  img = loadImage("data/"+file);
  img.resize(width, height);
  dots = new PVector[img.pixels.length];

  for (int y=0; y<img.height; y+=res) {             
    for (int x=0; x<img.width; x+=res) {

      float addBrightness = 0;
      int c = 0;

      for (int i = 0; i < res; i++) {
        color pixel = img.get(x+i, y+i);
        float bri = brightness(pixel);
        addBrightness += bri;
        c++;
      }
      
      float avg = addBrightness/c;
      int shade = int(map(avg, 10, 245, 12, 1));    //range of grayscale
    
      //------- call patterns 
      patterns(shade, x, y);
    }
  }
  done = new int[number];    //numbers
  for (int i = 0; i< number; i++) {
    done[i] = i;
  }
  println("Number of lines: "+number);
}