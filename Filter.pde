class Filter {
  
  Filter() {}
  
  void grayScale(PImage image) {
    image.loadPixels();
    for(int j=0; j<image.width; j++) {
      for(int k=0; k<image.height; k++) {
        color c = image.get(j, k);
        float gray = (red(c)+blue(c)+green(c))/3;
        c = color(gray);
        image.set(j, k, c);
      }
    }
    image.updatePixels();
  }
  
  void treshold(PImage image, int tresholdLimit) {
    image.loadPixels();
    for(int j=0; j<image.width; j++) {
      for(int k=0; k<image.height; k++) {
        color c = image.get(j, k);
        float gray = (red(c)+blue(c)+green(c))/3;
        if(gray > tresholdLimit) c = color(255);
        else c = color(0);
        image.set(j, k, c);
      }
    }
    image.updatePixels();
  }
  
  void motionCapture(PImage prevImage, PImage currImage) {
    
  }
}
