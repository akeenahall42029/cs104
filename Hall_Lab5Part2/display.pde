/* function will interact with both the display and game_state 2D arrays //<>//
 
 - all cells start closed
 - if the flag is closed, and no 
 - if the cell value is 
 */

int [][] display_info(int n) {
  for (int x = 0; x < n; x++) {
    for (int y = 0; y < n; y++) {
      int rect_x = x*rect_size + margin;
      int rect_y = y*rect_size + margin;
      if (gameOver) {
        //revealAllMines(x,y);
        game_over();
      }
      if (gameWin) {
        //  // if all the cells are open
        //  // if all the flags are on the correct mines
        game_win();
      }
      // Open cell + hints 
      if (display[x][y] == 1 && game_state[x][y] > 0 ) { // display the text  
        fill(150); 
        //rect((x*rect_size), (y*rect_size), rect_size, rect_size); // draw squares
        rect(rect_x, rect_y, rect_size, rect_size);
        fill(255);
        textSize(rect_size/2);
        textAlign(CENTER);
        text(game_state[x][y], margin+(x+0.5)*rect_size, margin+(y+0.5)*rect_size); // the last row of # is not showing
      }
      // Open cell + no hint 
      else if (display[x][y] == 1 && game_state[x][y] == 0) {  
        fill(150);
        rect(rect_x, rect_y, rect_size, rect_size);
        //rect((x*rect_size), (y*rect_size), rect_size, rect_size); // draw squares
      }
      //Open  & mine 
      else if (display[x][y] == 1 && game_state[x][y] == -1) {
        image(mine, rect_x, rect_y); 
        gameOver = true;
      }
      // flagged 
      else if (display[x][y] == 5) {
        fill(150);
        rect(rect_x, rect_y, rect_size, rect_size);
        image(flag, rect_x, rect_y);

        //rect((x*rect_size), (y*rect_size), rect_size, rect_size);
      } else {
        fill(255, 196, 234); 
        rect(rect_x, rect_y, rect_size, rect_size);
        //rect((x*rect_size), (y*rect_size), rect_size, rect_size); // draw squares
      }
    }
  }
  return display;
}



void mousePressed() {

  for (int x = 0; x < n; x++) {
    for (int y = 0; y < n; y++) {
      // mouseX/rect_size == x && (mouseY/rect_size) == y
      if (mouseX >= x*rect_size + margin && mouseX < (x+1)*rect_size + margin && 
        mouseY >= y*rect_size + margin && mouseY < (y+1)*rect_size + margin) {
        // if the cell is closed, open it 
        if (mouseButton == LEFT) { // left is to open cells 
          if (display[x][y] == 0) {
            if (game_state[x][y] == -1) {
              revealAllMines(x, y); // needs to be debugged, doesn't open all the mines
            }
            reveal(x, y);
            checkWin();
          }
        }
        // flag a closed cell
        if (mouseButton == RIGHT) {
          if (display[x][y] == 5) {
            display[x][y] = 0;
            flag_count++;
          } else if (display[x][y] == 0 && flag_count >0) {
            display[x][y] = 5;
            flag_count--;
            if (game_state[x][y] == -1) {
              counter--; // if the user flags a mine, decrease
            }
          }
          //if (flag_count == 0 && counter == 0) { // might need to change location
          //  gameWin = true;
          //  //check_win();
          //}
        }



        //println(flag_count);
        println("There are : " + mine_counter + " mines and you have  " + counter +" left to open and "+ flag_count + " flags used");
        //        mine_counter = # mines
      }
    }
  }
}

void reveal(int row, int col) {
  if (game_state[row][col] == -1) { // if issa mine
    gameOver = true;
    display[row][col] = 1; 
    return;
  }

  if (display[row][col] == 1 || display[row][col] == 5) {
    return; // stop recursion if square has already been revealed
  }

  display[row][col] = 1;

  if (game_state[row][col] == 0) {
    for (int xx = row-1; xx <= row+1; xx++) {
      for (int yy = col -1; yy <= col+1; yy++) {
        if (xx >= 0 && xx < n && yy >= 0 && yy < n) {
          reveal(xx, yy);
        }
      }
    }
  }
}

void checkWin() {
  int nonMineCount = (n * n) - mine_counter; // num of non-mines 
  int openedCount = 0;

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (game_state[i][j] != -1 && display[i][j] == 1) { // if the hint is 0 and the display is open
        openedCount++; // increase num of open cells
      }
    }
  }
  if (nonMineCount == openedCount && flag_count == 0 && counter == 0) {
    gameWin = true;
  }
}



// CHANGE 

void revealAllMines(int x, int y) {
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (display[i][j] != 1) { // if cell is not already revealed
        display[i][j] = 1; // reveal cell
        if (game_state[i][j] == -1) { // if cell contains mine
          // handle mine explosion here
          display[x][y] = 1;
        }
      }
    }
  }
}

//void revealAllMines(int row, int col) {
//  if (game_state[row][col] == -1 && display[row][col] != 1) {
//    display[row][col] = 1; // reveal the cell
//    for (int xx = row - 1; xx <= row + 1; xx++) {
//      for (int yy = col - 1; yy <= col + 1; yy++) {
//        if (xx >= 0 && xx < n && yy >= 0 && yy < n) {
//          if (game_state[xx][yy] == -1) {
//            revealAllMines(xx, yy);
//          }
//        }
//      }
//    }
//  }
//}
