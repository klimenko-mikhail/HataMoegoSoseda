int currentLevelIndex = -1;
char[][] currentLevel;
int currentLevelWidth;
int currentLevelHeight;

void loadNextLevel() {
  if (currentLevelIndex >= LEVELS.length - 1) {
    currentState = VICTORY_STATE;
    return;
  }

  currentLevelIndex++;
  currentLevelWidth = LEVELS[currentLevelIndex][0].length;
  currentLevelHeight = LEVELS[currentLevelIndex].length;
  currentLevel = new char[currentLevelHeight][currentLevelWidth];

  for (int y = 0; y < currentLevelHeight; y++) {
    for (int x = 0; x < currentLevelWidth; x++) {
      char cell = LEVELS[currentLevelIndex][y][x];
      if (cell == 'P') {
        placePlayer(x, y);
      }
      currentLevel[y][x] = cell;
    }
  }

  recalcDrawingParams();
}

void drawLevel() {
  for (int y = 0; y < currentLevelHeight; y++) {
    for (int x = 0; x < currentLevelWidth; x++) {
      int pixelX = x * cellSize + centeringShiftX;
      int pixelY = y * cellSize + centeringShiftY;
      char cell = currentLevel[y][x];
      switch (cell) {
      case '#':
        image(wallImage, pixelX, pixelY, cellSize, cellSize);
        break;
      case 'W':
        fill(100, 100, 100);
        image(wayImage, pixelX, pixelY, cellSize, cellSize);
        break;
      case 'P':
        fill(100, 100, 100);
        image(wayImage, pixelX, pixelY, cellSize, cellSize);
        break;
      case 'C':
        fill(100, 100, 100);
        image(wayImage, pixelX, pixelY, cellSize, cellSize);
        coinSprite.draw(pixelX, pixelY, cellSize, cellSize);
        break;
      case 'E':
        fill(100, 100, 100);
        image(wayImage, pixelX, pixelY, cellSize, cellSize);
        image(exitImage, pixelX, pixelY, cellSize, cellSize);
        break;
      case 'G':
        fill(30, 200, 30);
        rect(pixelX, pixelY, cellSize, cellSize);
        break;
      case 'S':
        fill(200, 200, 200);
        rect(pixelX, pixelY, cellSize, cellSize);
        break;
      case 'p':
        fill(60, 60, 60);
        rect(pixelX, pixelY, cellSize, cellSize);
        break;
      }
    }
  }
  recalcDrawingParams();
}
