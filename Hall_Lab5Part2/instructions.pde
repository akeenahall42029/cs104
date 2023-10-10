
float rectW = 50; 
float rectH = 50; 
int GAP = 40; 


float textH;
float rectX1; 
float rectX2;
float rectX3;
float rectY; 
void instructions() {
  background(144,99,143);
  fill(255);
  textSize(35);
  textAlign(CENTER, CENTER);
  text("Minesweeper", width/2, textH);
  textSize(20);
  text(" To win the game you must uncover all locations  ", width/2, textH+GAP);
  text("without mines and place flags on all the mines.", width/2, textH+GAP*2);
  text("If you uncover a mine you loose.", width/2, textH+GAP*3);
  text("Pick an n grid to begin the game", width/2, textH+GAP*4);
  rectMode(CENTER); 
  fill(107,242,242);
  noStroke();
  rect(rectX1, rectY, rectW, rectH); // 100 rect 
  rect(rectX2, rectY, rectW, rectH); // 200 rect 
  rect(rectX3, rectY, rectW, rectH); // 300 rect 
  fill(0);
  text("10", rectX1, rectY);
  text("20", rectX2, rectY);
  text("30", rectX3, rectY);
  // conditionals to start the game depending on the button pressed 
  if (mousePressed) { 
    if (((mouseX > rectX1-(rectW/2) && mouseX < rectX1+(rectW/2))
      && (mouseY > rectY-(rectH/2) && mouseY < rectY+(rectH/2)))) {
      n = 10;
      game_set(n);
      gameStatus = false;

      //println(rect_size);


      //print(gameStatus);
    } else if (((mouseX > rectX2-(rectW/2) && mouseX < rectX2+(rectW/2))
      && (mouseY > rectY-(rectH/2) && mouseY < rectY+(rectH/2)))) {
      n = 20;
      game_set(n);
      gameStatus = false;
      //println(n);
    } else if (((mouseX > rectX3-(rectW/2) && mouseX < rectX3+(rectW/2))
      && (mouseY > rectY-(rectH/2) && mouseY < rectY+(rectH/2)))) {
      n = 30;
      game_set(n);
      gameStatus = false;
      //println(n);
    }
  }
  //if (keyPressed) {
  //  n = 3; 
  //  game_set(n);
  //  gameStatus = false;
  //}
}   
