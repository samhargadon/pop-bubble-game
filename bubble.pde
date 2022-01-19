//creat class Bubble 
class Bubble {
  
//variables
  float x;
  float y;
  float diameter;
  float yspeed;
  float r = random(100, 255);
  float b = random(100, 255);

//define bubble variables 
  Bubble(float floatD) {
    x = random(width);
    y = height;
    diameter = floatD;
    yspeed = random(2.5, 4.5);
  }
  
//make bubbles move up 
  void ascend() {
    y = y-yspeed;
    x = x + random(-2, 2);
  }

//display bubbles 
  void display() {
    fill(r, 0, b);
    ellipse(x, y, diameter, diameter);
  }


  void top() {
    if (y < -diameter/2) {
      y = height + diameter/2;
    }
  }

//if the mouse clicks the bubble, it pops 
//score increases by 1 and speed increases 
  void pop() {
    if (mouseX <= x+(diameter/2) && mouseX >= x-(diameter/2)) {
      if (mouseY <= y+(diameter/2) && mouseY >= y-(diameter/2)) {
        x=random(width);
        y=height;
        total = total + 1;
        yspeed = yspeed + 1;
      }
    }
  }

//if the bubble goes past the top without being popped, you lose 1 point and speed decreases 
  void miss() {
    if (y<0) {
      x=random(width);
      y=height;
      total = total - 1;
      yspeed = yspeed - 1;
    }
  }
}
