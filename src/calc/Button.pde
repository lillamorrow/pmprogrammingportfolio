class Button {
  //member variables
  int x, y, w, h;
  color c1, c2;
  char val;
  boolean on;

  //constructor
  Button(int x, int y, int w, int h, char val) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h = h;
    this.val = val;
    c1 = color(#F0C1FF);
    c2 = color(#B88AC6);
    on = false;
  }

  // memeber methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    ellipse(x, y, w, h);
    textAlign(CENTER);
    fill(0);
    strokeWeight(2);
    textSize(20);
    text(val, x, y);
  }

  void hover(int mx, int my) {
    on = (mx>x-w/2 && mx<x+w/2 && my>y-h/2 && my<y+h/2);
  }
}
