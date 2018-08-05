
import processing.video.*;
PImage img;
Capture vid;

void setup() {
  vid = new Capture(this, 640 ,480, 30);
  vid.start();
  size(600,400);
  background(0);
}

void draw() {
  if(vid.available()) {
  vid.read();
  }
  tint(255,mouseY,mouseX);
  image(vid,0,0);
  loadPixels();
  vid.loadPixels();
  
  for (int x = 0; x < width-1; x++) {
    for(int y = 0; y < height; y++) {
      int loc = x+y*width;
      if (brightness(pixels[loc]) > 127) {
       pixels[loc] = 255;
      } else if (brightness(pixels[loc]) <= 127) {
       pixels[loc] = 0; 
      }
    }
  }
  updatePixels();
  int size = 5;
  for(int i = 0; i < 500; i++) {
  float x =  random(width);
  float y = random(height);
  color c = vid.get(int(x), int(y));
  noStroke();
  fill(c);
  ellipse(x,y, size, size);
}
}