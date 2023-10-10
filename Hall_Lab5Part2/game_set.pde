
void game_set(int n) {
  rectMode(CORNER);
  game_state =  new int [n][n]; 
  display = new int [n][n]; 
  rect_size = (width-2*margin)/n;
  mine_placer();
  counter = mine_counter;
  println(counter);
  flag_count = mine_counter;
  println(flag_count);
  flag = loadImage("Flag.png");
  flag.resize(rect_size, rect_size);
  mine = loadImage("mine.jpeg");
  mine.resize(rect_size, rect_size);
}
