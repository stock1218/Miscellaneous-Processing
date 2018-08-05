
rekt r;
ArrayList<rekt> rekts = new ArrayList<rekt>();

void setup() {
  size(600,600);
  background(255);
  for(int x = 0; x < 10; x++)
   rekts.add(new rekt(random(0,100),random(0,100),random(0,10),random(0,10)));
   //rekts.add(new rekt(10,10,10,13));
  
}

void draw() {
  //background(255);
  for(rekt r : rekts) {
    r.move();
    r.display();
  }
}