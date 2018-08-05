bot[] bots;
food[] foods;

void setup() {
  size(600, 400);

  background(0);
  //frameRate(400);

  bots = new bot[1000];
  foods = new food[5];

  //set bots & food
  for (int x = 0; x < bots.length; x++) {
    bots[x] = new bot(random(0, width), random(0, height));
  }

  for (int x = 0; x < foods.length; x++) {
    foods[x] = new food(random(0, width), random(0, height));
  }
}

void draw() {
  background(0);
  //smooth();
  for (int i = 0; i < bots.length; i++) {
    bots[i].update();
    for (int k = 0; k < foods.length; k++) {
      if ((abs(bots[i].getX() - foods[k].getX()) < 10 && abs(bots[i].getY() - foods[k].getY()) < 10) && bots[i].state == true) {
        bots[i].eat();
        foods[k].die();

        //System.out.println(foods[k].getX()-bots[i].getX());
      }
    }
  }

  for (int i = 0; i < foods.length; i++) {
    foods[i].update();
  }
}

class bot {
  PVector location, velocity, acc;
  int hunger;
  color c;
  int s;
  boolean run;

  boolean state;
  bot(float x, float y) {  
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acc = new PVector(0, 0);
    hunger = 255;
    s = 5;
    state = true;
    run = true;
    c = color(random(150, 255), random(150, 255), random(150, 255));
  }

  void update() {
    hunger--;
    if (hunger < 0)
      state = false;

    acc.add(PVector.random2D());
    velocity.add(acc);

    if ((abs(location.x - mouseX) < 50 && (abs(location.y - mouseY) < 50)) && run == true) {
     // velocity.mult(-1);
      run = false;
    }

    if ((abs(location.x - mouseX) > 50 && (abs(location.y - mouseY) > 50)))
      run = true;



    velocity.limit(5);
    location.add(velocity);
    acc.mult(0);

    if (location.x > width-10) location.x = 0;
    if (location.x < 0) location.x = width-10;

    if (location.y > height-10) location.y = 0;
    if (location.y < 0) location.y = height-10;


    float r = velocity.heading() + PI/2;
    fill(c, hunger);
    //noFill();
    stroke(255, hunger);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(r);

    beginShape();

    vertex(0, -s*2);
    vertex(-s, s*2);
    vertex(s, s*2);

    endShape(CLOSE);

    popMatrix();
  }

  float getX() {
    return location.x;
  }
  float getY() {
    return location.y;
  }

  void eat() {

    hunger+= 200;
  }
}

class food {
  float x, y, r;
  food(float x, float y) {
    this.x = x;
    this.y = y;
    r = 0;
  }

  void update() {
    r+= 4;
    fill(255);
    //noFill();
    stroke(255);
    pushMatrix();
    translate(x, y);
    rotate(radians(r));
    rectMode(CENTER);
    rect(0, 0, 10, 10);
    //println("Angle: ");
    popMatrix();
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }

  void die() {
    x = random(0, width);
    y = random(0, height);
  }
}