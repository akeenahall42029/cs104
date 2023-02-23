float circleX; 
int circleY = 20;
int GAP = 40; 
int paddleX;
int paddleY; 
float dirx; 
float diry;
float paddleW; 
float paddleH;
int stage; 
int PLAY = 1;
int GAME_OVER = 2;
int score = 0;
float speed; 
boolean gameStatus = true;
boolean gameOver = false;
// this will be used to conditionals to change the screen for 
// the game in play or game over

void setup() {
  size(640, 360); // static size of display window, this will need to be changed later
  // Need to fix
  speed = 2;
  paddleY = height - GAP; // makes the paddle's y position a gap of 50 pixels, adjusts depending on the height of the window
  circleX= random(GAP, width-GAP);
  // need to modifiy so I can make it faster every hit
  dirx = random(-2, 2);
  diry = 1;
  fill(255, 0, 0); 
  paddleH = height/16;
  textAlign(CENTER, CENTER);
}

void draw() {
  if (gameStatus && !gameOver) {
    instructions();
    println(gameStatus);
  }

  if(!gameStatus){
   gameMode(paddleW, speed);
  }
  
}
// add speed parameter 
void gameMode(float paddleWidth, float sd) {
  speed = sd;
  if (!mousePressed) {
    background(0);
  }

  textSize(25);
  text("Points:" + score, width*5/6, height/10);
  fill(random(0, 255), random(0, 255), random(0, 255));
  circle(circleX, circleY, 20); // ball
  circleX += dirx * speed; // moves the ball in a horizontal random direction 
  circleY += diry * speed; // moves the ball down the screen

  fill(255);
  paddleX = constrain(mouseX, 0, width-GAP);
  rect(paddleX, paddleY, paddleWidth, paddleH); 

  if (circleX >= width || circleX<=0) { 
    dirx = dirx*-1;
  } 
  if (circleY <=0) {
    diry = diry*-1;
  }
  // this needs fixing;  only works the after the 
  // first run for paddleWidth = 100 and not for after you press the instructions
  if ((circleX > paddleX-paddleWidth/2 && circleX < paddleX+paddleWidth/2) && circleY+9<= paddleY+paddleH/2   &&circleY+9 >= paddleY - paddleH/2) {
    // need to make the ball bounce up if it touches the paddle
    //dirx = dirx*-1; 
    diry = diry*-1;  
    speed+=1;
    score+=1;
  } else if (circleY > height+30) {
    gameOver = true;
    textSize(70);
    text("Game Over", width/2, height/2);
    textSize(35); 
    text("Press any key to start over", width/2, (height/2)+50);
  }
}

void keyPressed() {
  if (gameOver) {
    gameStatus = true;
    gameOver = false; 
    circleY = 20;
    score = 0;
    speed = 2;
    background(0);
    println(gameStatus);
    //  instructions();
  }
}
// make a seperate function for when the game is lost 
