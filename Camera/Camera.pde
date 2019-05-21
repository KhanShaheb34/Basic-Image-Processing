import processing.video.*;

Capture cam;
Filter filter;

void setup() {
  size(640, 480);
  filter = new Filter();
  cam = new Capture(this, 640, 480);
  cam.start();
}

void mousePressed() {
  Utils.saveImage(cam);
}

void draw() {
  background(0); 
  changeCam();
  image(cam, 0, 0, 640, 480);
}

void changeCam() {
  if(cam.available()) cam.read();
  filter.grayScale(cam);
}

void keyPressed() {
}
