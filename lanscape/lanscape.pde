import processing.pdf.*;

int cols, rows;
int scl = 20;
int h = 2400;
int w = 2400;
float rotate = 0;
boolean rite = true;

float flying;

float[][] terrain;

void setup() {
  size(1200, 1200, P3D);
  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
 
}

void draw() {
  
  flying -= 0.1;
  float yoff = flying;
   for (int y = 0; y < rows; y++) {
    float xoff = 0;
   for (int x = 0; x < cols; x++) {
     terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100); 
     //xoff += 0.07;
     xoff += 0.1;

     //background(random(0, 255), random(0, 255), random(0, 255));
   }
   yoff += 0.1;
  }

 stroke(255);
 //fill(random(0, 255), random(0, 255), random(255, 0));
 //fill(0,255,255);
 noFill();
 background(0);
 
 translate(width/2, height/2);
 rotateX(PI/3);
 rotateZ(rotate);
 translate(-w/2, -h/2);
 rotate+= 0.01;
 
 for (int y = 0; y < rows-1; y++) {
   if(rite) {
   beginShape(TRIANGLE_STRIP);
   }
   for (int x = 0; x < cols; x++) {
     vertex(x*scl,y*scl, terrain[x][y]);
     vertex(x*scl,(y+1)*scl, terrain[x][y+1]);
   }
   endShape();
 }
}