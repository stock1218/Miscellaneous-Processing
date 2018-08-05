class rekt {
  
  private float x,y,s;
  
  private float xSpeed = 10;
  private float ySpeed = 10;
  private int hits = 0;
  
 public rekt(float x, float y, float xSpeed, float ySpeed) {
   this.x = x;
   this.y = y;
   this.xSpeed = xSpeed;
   this.ySpeed = ySpeed;
   s = 10;
 }
 
 void display() {
   //stroke(0);
   //fill(random(0,x),random(0,x),random(0,y));
   //fill(125);
   noFill();
   rect(x,y,s,s);
 }
 
 void move() {
   if(x > width-10 || x < 0) {
    xSpeed *= -1;
    hits++;
   }
   if(height-10 < y || y < 0) {
     ySpeed *= -1;
     hits++;
   }
   
   
   x += xSpeed;
   y += ySpeed;
   
   ySpeed -= 0.1;
   xSpeed -= 0.1;
   
   println("X: " + x);
   println("Y: " + y);
 }
}