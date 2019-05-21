import processing.video.*;

Capture cam;
PImage prevFrame, currFrame, outFrame;
Filter filter;
int frame = 0;

void setup() {
  size(640, 480);
  filter = new Filter();
  cam = new Capture(this, 640, 480);
  prevFrame = new PImage();
  currFrame = new PImage();
  outFrame = new PImage();
  cam.start();
  outFrame = cam.copy();
}

void mousePressed() {
  Utils.saveImage(currFrame);
}

void draw() {
  background(0);
  updateFrame();
  image(outFrame, 0, 0, 640, 480);
}

void updateFrame() {
  prevFrame = currFrame.copy();
  if(cam.available()) cam.read();
  currFrame = cam.copy();
  outFrame = filter.motionCapture(prevFrame, currFrame);
}

void keyPressed() {
  
}
