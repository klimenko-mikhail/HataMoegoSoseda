final int MENU_STATE = 0; //<>//
final int GAME_STATE = 1;
final int PAUSED_STATE = 2;
final int VICTORY_STATE = 3;
// final int DEFEAT_STATE = 4; TODO

int currentState = MENU_STATE;

void setup() {
  fullScreen();
  background(0);

  loadFonts();
  loadSounds();
  loadImages();
}

void draw() {
  background(0);

  switch (currentState) {
  case MENU_STATE:
    drawMenu();
    break;
  case GAME_STATE:
    drawGame();
    break;
  case PAUSED_STATE:
    drawPause();
    break;
  case VICTORY_STATE:
    drawVictory();
    break;
  }
}

void drawMenu() {
  fill(255, 0, 0);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("Dungeon", width / 2, height / 2);

  fill(255);
  textSize(40);
  text("Press Enter to start the game", width / 2, height / 2 + 100);
}

void drawGame() {
  drawLevel();
  drawPlayer();
  drawPlayerScore();
}

void drawPause() {
  textAlign(CENTER, CENTER);

  fill(255);
  textSize(40);
  text("Press P to continue the game", width / 2, height / 2);
}

float angle = 0;
void drawVictory() {
  noStroke();
  pushMatrix();
  translate(width / 2, height / 2);
  for (int i = 0; i < 100; i++) {
    rotate(angle);
    angle += 0.00005;
    translate(i * 10, 0);
    fill(200 * i / 100.0);
    rect(0, 0, 100, 100);
  }
  popMatrix();

  // TODO

  fill(255, 0, 0);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("You are Victory!", width / 2, height / 2);

  textSize(50);
  text("Your Score " + playerScore, width / 2, height / 2 + 100);

  fill(255);
  textSize(40);
  text("Press Enter to go back to menu", width / 2, height / 2 + 200);
}

void keyPressed() {
  switch (currentState) {
  case MENU_STATE:
    keyPressedInMenu();
    break;
  case GAME_STATE:
    keyPressedInGame();
    break;
  case PAUSED_STATE:
    keyPressedOnPause();
    break;
  case VICTORY_STATE:
    keyPressedInVictory();
    break;
  }
}

void keyPressedInMenu() {
  if (keyCode == ENTER) {
    playerScore = 0;
    currentLevelIndex = -1;
    loadNextLevel();
    currentState = GAME_STATE;
  }
}

void keyPressedInGame() {
  switch (key) {
  case 'w':
  case 'W':
    movePlayer(0, -1);
    break;
  case 's':
  case 'S':
    movePlayer(0, 1);
    break;
  case 'a':
  case 'A':
    movePlayer(-1, 0);
    break;
  case 'd':
  case 'D':
    movePlayer(1, 0);
    break;
  case 'p':
  case 'P':
    currentState = PAUSED_STATE;
    break;
  }
}

void keyPressedOnPause() {
  if (keyCode == 'P') {
    currentState = GAME_STATE;
  }
}

void keyPressedInVictory() {
  if (keyCode == ENTER) {
    currentState = MENU_STATE;
  }
}
