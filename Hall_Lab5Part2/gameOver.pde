// GAME STATE 

void game_over() {
  textAlign(CENTER, CENTER);
  //I gotta reset the counter, flag_count and shit 
  textSize(70);
  fill(0);
  text("Game Over", width/2, height/2);
  textSize(35); 
  text("Press any key to start over", width/2, (height/2)+50);
  

}
void game_win(){
  textAlign(CENTER, CENTER);
  //I gotta reset the counter, flag_count and shit 
  textSize(70);
  fill(0);
  text("Game Won!!", width/2, height/2);
  textSize(30); 
  text("Congrats!", width/2, (height/2)+50);
  text("Press any key to start over or exit.", width/2, (height/2)+75);


}


void exit_game(){
  fill(255); 
  rect(exit_x,exit_y,exit_w,exit_h);
  fill(0);
  textAlign(CENTER,CENTER);
  textSize(20);
  text("EXIT", exit_x+37.5, 32);
  rectMode(CORNER);
  if(mousePressed){
  if (((mouseX > exit_x && mouseX < exit_x+(exit_w))
      && (mouseY > exit_y && mouseY < exit_y+(exit_h)))) {
        exit();
      }
  }

}

void keyPressed() {
  if (gameOver) {
    gameStatus = true;
    gameOver = false; 
    // reset all the vars to zero before mine_placer is ran in game_set
    counter = 0;
    flag_count = 0;
    mine_counter = 0;
    
  }
  if(gameWin){
    gameStatus = true;
    gameWin = false; 
    counter = 0;
    flag_count = 0;
    mine_counter = 0;
  
  }

}
