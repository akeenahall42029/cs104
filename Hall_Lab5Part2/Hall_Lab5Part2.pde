/* Next steps 
 -instruction screen 
 - top handle bar to display # of flags 
 - exit button 
 - gameWin 
 - if the number of flags placed in the correct spot matches the mine_counter 
 gameWin = true; 
     - a win: 
       - if the player opens all the spots that are not mines 
       - if all the flags are places correctly --> if 
 - gameOver 
 - if a mine is touched 
 */
int n; // will be used to change the grid size 
int counter; //used to count # of mines   
int flag_count; //used to all the flags  placed are equal to # of mines
int margin; 
int [][] game_state; // 2D array, 3 rows, three coloums -- this would be changed to the width and height of the window 
int [][] display; // used to display hints, mines 
int rect_size; 
int random_x; // picks a random x value for the mine(s)
int random_y; // picks a random y value for the mine(s)

// Game control 

boolean gameOver = false;
boolean gameWin = false; 
boolean gameStatus = true; 

PImage flag; 
PImage mine;
// Graphics 
PImage flag2; 

int exit_x; 
int exit_y = 17;
int exit_w = 75; 
int exit_h = 30; 
void setup() {
  size(600, 600);
  margin = width/10;
  exit_x = (width*2)/3;
  // Instructions 
  textH = height/4;
  rectX1 = width/4; 
  rectX2 = width/2;
  rectX3 = width/2+GAP*4;
  rectY = (height/2)+GAP*2;
  flag2 = loadImage("Flag.png");
  flag2.resize(48, 48);
}
void draw() {
  if (gameStatus && !gameOver) { // when the game loads 
    instructions();
  }
  if (!gameStatus) {
    background(217,85,133);
    image(flag2,margin*2,10);
    textAlign(CENTER,CENTER);
    textSize(30);
    fill(255);
    text(" : " + flag_count, (margin*3.25), 48-10);
    stroke(1);
    display_info(n); // takes in n
    exit_game();
  }
 
}
