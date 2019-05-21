class Filter {
  PImage outImage;
  
  Filter() {
    outImage = new PImage();
  }
  
  PImage grayScale(PImage image) {
    outImage = image.copy();
    for(int j=0; j<image.width; j++) {
      for(int k=0; k<image.height; k++) {
        color c = image.get(j, k);
        float gray = getGray(c);
        c = color(gray);
        outImage.set(j, k, c);
      }
    }
    return outImage;
  }
  
  PImage treshold(PImage image, int tresholdLimit) {
    outImage = image.copy();
    for(int j=0; j<image.width; j++) {
      for(int k=0; k<image.height; k++) {
        color c = image.get(j, k);
        float gray = getGray(c);
        if(gray > tresholdLimit) c = color(255);
        else c = color(0);
        outImage.set(j, k, c);
      }
    }
    return outImage;
  }
  
  PImage motionCapture(PImage prevImage, PImage currImage) {
    outImage = prevImage.copy();
    for(int j=0; j<prevImage.width; j++) {
      for(int k=0; k<prevImage.height; k++) {
        color prevC = prevImage.get(j, k);
        color currC = currImage.get(j, k);
        float prevGray = getGray(prevC);
        float currGray = getGray(currC);
        float diff = abs(prevGray - currGray) - 20;
        color c = color(diff);
        outImage.set(j, k, c);
      }
    }
    return outImage;
  }
  
  PImage lowPass(PImage prevImage, PImage currImage, float amount) {
    outImage = prevImage.copy();
    for(int j=0; j<prevImage.width; j++) {
      for(int k=0; k<prevImage.height; k++) {
        color prevC = prevImage.get(j, k);
        color currC = currImage.get(j, k);
        float prevGray = getGray(prevC);
        float currGray = getGray(currC);
        float diff = abs(prevGray - currGray) * amount;
        color c = color(currGray + diff);
        outImage.set(j, k, c);
      }
    }
    return outImage;
  }
  
  private float getGray(color col) {
    return (red(col)+blue(col)+green(col))/3;
  }
}
