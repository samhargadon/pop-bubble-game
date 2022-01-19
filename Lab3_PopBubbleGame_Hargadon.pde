int gameScreen = 0;
Bubble[] bubbles = new Bubble[5];

void setup() {
  size(600, 600);
  for (int i = 0; i<bubbles.length; i++) {
    bubbles[i] = new Bubble(50);
  }
}

void draw() {
  //0 = instruction screen
  //1 = play game
  //2 = exit window
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen==1) {
    gameScreen();
  } else if (gameScreen==2) {
    exit();
  }
}

void initScreen() {
  float size = (width/20);

  //rectangle variables
  float x1 = size;
  float y1 = (size*15);
  float w1 = (size*7);
  float h1 = (size*3);

  float x2 = (size*13);
  float y2 = (size*15);
  float w2 = (size*6);
  float h2 = (size*3);

  //text placement variables so window can change

  float textLength1 = (size*13);
  float textLength2 = (size*17);
  float textLength3 = (size*15);
  float textLength4 = (size*18);

  float line1X = ((width-textLength1)/2);
  float line1Y = (size*2);

  float line2X = ((width-textLength2)/2);
  float line2Y = (size*4);

  float line3X = ((width-textLength3)/2);
  float line3Y = (size*6);

  float line4X = ((width-textLength4)/2);
  float line4Y = (size*8);

  //background color and text color and width
  background(255, 105, 180);
  strokeWeight(5);
  stroke(0);

  //instructions
  textSize(size);
  fill(0, 255, 255);
  text("Welcome to the pop bubble game!", line1X, line1Y);
  text("Press the bubbles to pop them!", line2X, line2Y);
  text("+1 point if you pop, -1 if you miss", line3X, line3Y);
  text("Speed increases and decreases with points!", line4X, line4Y);

  //button background is white
  fill(255);

  //if the mouse is in the rectangle and is pressed, game will start
  if (mouseX>x1 && mouseX <x1+w1 && mouseY>y1 && mouseY <y1+h1) {
    if (mousePressed) {
      gameScreen=1;
      println("The game will start");
      fill(0);
    }
  }
  //button will turn black and game will begin
  rect(x1, y1, w1, h1);
  fill(50, 205, 50);
  text("Begin Game", x1+(width/40), y1+(width/12));

  fill(255);

  //if the mouse is in the rectangle and is pressed, game will exit
  if (mouseX>x2 && mouseX <x2+w2 && mouseY>y2 && mouseY <y2+h2) {
    if (mousePressed) {
      gameScreen=2;
      println("Game will exit");
      fill(0);
    }
  }
  //button will turn black and game will exit
  rect(x2, y2, w2, h2);
  fill(50, 205, 50);
  text("Exit Game", x2+(width/40), y2+(width/12));
}

void gameScreen() {
  for (int i = 0; i<width; i++) {
    background(255);
  }
    for (int i = 0; i<bubbles.length; i++) {
      bubbles[i].ascend();
      bubbles[i].display();
      bubbles[i].top();
      bubbles[i].miss();
    }

    score();
  }

  void mousePressed() {
    for (int i = 0; i<bubbles.length; i++) {
      bubbles[i].pop();
    }
  }
