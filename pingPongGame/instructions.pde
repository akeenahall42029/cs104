
float rectW = 150; 
float rectH = 50; 

void instructions() {
  float textH = height/4;
  float rectX1 = width/4; 
  float rectX2 = width/2;
  float rectX3 = width/2+GAP*4;
  float rectY = height-GAP; 
  background(0);
  fill(255);
  textSize(35);
  textAlign(CENTER, CENTER);
  text("Instructions:", width/2, textH);
  textSize(25);
  text("Move the mouse across the screen to play.", width/2, textH+GAP);
  text("Choose a paddle size", width/2, textH+GAP*2);
  text("The larger the faster the ball will move!", width/2, textH+GAP*3);
  rectMode(CENTER); 
  fill(255);
  rect(rectX1, rectY, rectW, rectH); // 100 rect 
  rect(rectX2, rectY, rectW, rectH); // 200 rect 
  rect(rectX3, rectY, rectW, rectH); // 300 rect 
  fill(0);
  text("100", rectX1, rectY);
  text("200", rectX2, rectY);
  text("300", rectX3, rectY);
  // conditionals to start the game depending on the button pressed 
  if (mousePressed) {
    // this works !! 
    if (((mouseX > rectX1-(rectW/2) && mouseX < rectX1+(rectW/2))
      && (mouseY > rectY-(rectH/2) && mouseY < rectY+(rectH/2)))) {
      paddleW = 100;
     speed = 2; 
      gameStatus = false;
       
      //print(gameStatus);
    } else if (((mouseX > rectX2-(rectW/2) && mouseX < rectX2+(rectW/2))
      && (mouseY > rectY-(rectH/2) && mouseY < rectY+(rectH/2)))) {
      paddleW = 200;    
      //print(paddleW);
      gameStatus = false;
      speed = 3;
    } else if (((mouseX > rectX3-(rectW/2) && mouseX < rectX3+(rectW/2))
      && (mouseY > rectY-(rectH/2) && mouseY < rectY+(rectH/2)))) {
      paddleW = 300; 
      gameStatus = false;
      speed = 10;
    }
  }
}   
