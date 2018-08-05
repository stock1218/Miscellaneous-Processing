
public ArrayList<ball> ballz = new ArrayList<ball>();

ball b;

void setup() {
  background(0);
  size(600,600);
  for(int x = 0; x < 10; x++){
    ballz.add(new ball());
  }
  b = new ball();
  
}

void draw() {
  //background(0);
  for(int x = 0; x < 10; x++){
  ballz.get(x).move();
  ballz.get(x).bounce();
  ballz.get(x).display();
  }
  
  b.move();
  b.bounce();
  b.display();
  
}