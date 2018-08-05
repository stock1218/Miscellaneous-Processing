public class ball {

  PVector location;
  PVector vel;
  PVector acc;
  PVector mouse;
  
  float lastx;
  float lasty;
  
   public ball() {
     location = new PVector(random(0,width),random(0,height));
     //location = new PVector(width/2,height/2);
     vel = new PVector(0,0);
     acc = new PVector(0,0);
     
 
   }
   
   
   public void move() {
     mouse = new PVector(mouseX, mouseY);
     
     mouse.sub(location);
     
     mouse.setMag(random(3,10));
     
     //if((float)mouse.x < 100 || (float)mouse.y < 100) {
     //  acc = PVector.random2D();
     //  println("SAME");
     //} else {
     
     acc = mouse;
     //}
     
     vel.add(acc);
     location.add(vel);
     
     vel.limit(5);
   }
   
   public void bounce() {
   if(location.x > width-10) location.x = 0;
   if(location.x < 0) location.x = width-10;
   
   if(location.y > height-10) location.y = 0;
   if(location.y < 0) location.y = height-10;
   }
   
   public void display() {
     stroke(0);
     fill(random(0,255),random(0,255),random(0,255));
     ellipse(location.x, location.y, 48, 48);
   }
  
}