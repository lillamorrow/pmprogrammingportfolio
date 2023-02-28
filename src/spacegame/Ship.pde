class SpaceShip {
  int x, y, w, ammo, turretCount, health;
  PImage ship;

  SpaceShip() {
    x=0;
    y=0;
    w=90;
    ammo = 250;
    turretCount = 2;
    health = 1000;
    ship= loadImage("ship4.png");
  }

  void display() {
    ship.resize(90, 90);
    imageMode(CENTER);
    image(ship, x, y);
  }

  void move(int tempX, int tempY) {
    x= tempX;
    y= tempY;
  }

  boolean fire() {
    if (ammo>0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<40) { // refine collison detection
      return true;
    } else {
      return false;
    }
  }
}
