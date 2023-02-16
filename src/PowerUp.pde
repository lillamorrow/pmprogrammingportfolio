class PowerUp {
  int x, y, diam, speed;
  char type;
  //PImage rock;

  PowerUp() {
    x= int (random(width));
    y= -100;
    diam= 100;
    speed = 3;
    //rock = loadImage("rock1.png");
    int rand = int(random(3));
    if (rand == 0) {
      type= 'H';
    } else if(rand ==1) {
      type = 'A';
    } else {
      type = 'T';
    }
  }

  void display() {
    fill(0,222,0);
    ellipse(x,y,diam,diam);
    //imageMode(CENTER);
    //rock.resize(diam, diam);
    //image (rock, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y>height+10) {
      return true;
    } else {
      return false;
    }
  }
   boolean intersect(SpaceShip ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<40) { // refine collison detection
      return true;
    } else {
      return false;
    }
  }
}
