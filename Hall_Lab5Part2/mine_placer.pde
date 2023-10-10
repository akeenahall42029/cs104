// this function will place the mines and the hints 

// mine_placer returns the game_state (2D array) after placing mines and hints 
// arrays pass by reference; this will change og game_state, which i would want
int mine_counter = 0;

int [][] mine_placer () { 
  // loop through the n 
  for (int i = 0; i <= n; i++) {
    random_x = int(random(n)); // place mine at random x 
    random_y = int(random(n)); // place mine at random y 

    // Place the mines 
    if (game_state[random_x][random_y] == -1) {
      i--; // goes back on our loop if there's already a mine places on the location we're trying to place a mine
    } else {
      game_state[random_x][random_y] = -1; // place a mine
      mine_counter++; // increase the mine count each time a mine is placed 
      // Add hints 
      for (int x_index = random_x-1; x_index <= random_x+1; x_index++) {
        for (int y_index = random_y -1; y_index <= random_y+1; y_index++) {
          if (x_index > -1 && x_index < n && y_index > -1 && y_index <n) {
            if ( (x_index >=0 && x_index < n) && y_index >=0 && y_index < n) { // checks edge positions 
              if (game_state[x_index][y_index] != -1) {
                game_state[x_index][y_index]+=1;
              }
            }
          }
        }
      }
    }
  }
  //println(random_x);
  //println(random_y);
  //println(mine_counter);
  //println(game_state[random_x][random_y]);
  


  return game_state; // idk what I was doing returning the game_state;
}
