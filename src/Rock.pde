class Rock {
  int x, y, diam, speed;
  PImage rock;

  Rock() {
    x= int (random(width));
    y= -50;
    diam= int(random(30, 100));
    speed = int(random(2, 6));
    rock = loadImage("rock1.png");
  }

  void display() {
    imageMode(CENTER);
    rock.resize(diam, diam);
    image (rock, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+50) {
      return true;
    } else {
      return false;
    }
  }
}
