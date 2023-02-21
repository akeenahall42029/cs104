float circleX; 
int circleY = 20;
int GAP = 40; 
int paddleX;
int paddleY; 
float dirx; 
float diry;
float paddleW; 
float paddleH;
int score = 0;
float speed = 2; 
boolean gameStatus = true; // this will be used to conditionals to change the screen for 
// the game in play or game over

void setup() {
  size(640, 360); // static size of display window, this will need to be changed later
  // Need to fix 
  paddleY = height - GAP; // makes the paddle's y position a gap of 50 pixels, adjusts depending on the height of the window
  circleX= random(GAP, width-GAP);
  // need to modifiy so I can make it faster every hit
  dirx = random(-1, 1);
  diry = 1;
  fill(255, 0, 0);
  paddleW = width/4; 
  paddleH = height/16;
  textAlign(CENTER, CENTER);
} 

void draw() {

  if (!mousePressed) {
    background(0);
  }
  
  textSize(25);
  text("Points:" + score, width*5/6, height/10);
  fill(random(0, 255), random(0, 255), random(0, 255));


  circle(circleX, circleY, 20); // ball
  circleX += dirx * speed; // moves the ball in a horizontal random direction 
  circleY += diry * speed; // moves the ball down the screen

  // paddle code 
  //rectMode(CENTER);
  fill(255);
  paddleX = constrain(mouseX, 0, width-100);
  rect(paddleX, paddleY, paddleW, paddleH); 

  if (circleX >= width || circleX<=0) { 
    dirx = dirx*-1;
  } 
  if (circleY <=0) {
    diry = diry*-1;
  }
  // this needs fixing; only works when the ball bounces off the side  

  if ((circleX > paddleX && circleX < paddleX+paddleW) && circleY == paddleY) {
    // need to make the ball bounce up if it touches the paddle
    //dirx = dirx*-1; 
    diry = diry*-1;  
    speed+=1;
    score+=1;
  } else if (circleY > paddleY) {
    gameStatus = false;
  }
  if (gameStatus == false) {
    textSize(70);
    text("Game Over", width/2, height/2);
    textSize(35); 
    text("Press any key to start over", width/2, (height/2)+50);
    if (keyPressed) {
      gameStatus = true; 
      circleY = 20;
      score = 0;
      speed = 2;
      println(gameStatus);
    }
  }
}
