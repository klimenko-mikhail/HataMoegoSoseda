final float CELL_SIZE = 0.8;

int cellSize;
int levelPixelWidth;
int levelPixelHeight;
int centeringShiftX;
int centeringShiftY;

PFont firstFont;

Sprite coinSprite;
Sprite playerSprite;
PImage wallImage;
PImage exitImage;
PImage gemImage;
PImage wayImage;

void recalcDrawingParams() {
  cellSize = int(min(width / currentLevelWidth, height / currentLevelHeight) * CELL_SIZE);
  levelPixelWidth = currentLevelWidth * cellSize;
  levelPixelHeight = currentLevelHeight * cellSize;
  centeringShiftX = (width - levelPixelWidth) / 2;
  centeringShiftY = (height - levelPixelHeight) / 2;
}

void loadFonts() {
  firstFont = createFont("dpcomic.ttf", 32);
  textFont(firstFont);
}

void loadImages() {
  playerSprite = new Sprite("player/sprite_player", 8, ".png", 1); //PS: Я непонимаю, почему фрэймы переключаются с такой скоростью, хотя я указывал 1 фпс в Piskel
  coinSprite = new Sprite("coin/sprite_coin", 6, ".png", 1);
  wallImage = loadImage("wall.png");
  exitImage = loadImage("exit.png");
  gemImage = loadImage("gem.png");
  wayImage = loadImage("way.png");
}

class Sprite {
  PImage[] images;
  int frame;
  
  int skip, _skip;
  int time = -1;
  
  Sprite(String imagePrefix, int count, String extension) {
    this(imagePrefix, count, extension, 3);
  }
  
  Sprite(String imagePrefix, int count, String extension, int skip) {
    images = new PImage[count];

    for (int i = 0; i < count; i++) {
      String fileName = imagePrefix + i + extension;
      images[i] = loadImage(fileName);
    }
    
    this.skip = skip;
    _skip = skip;
  }

  void draw(float x, float y, float width, float height) {
    if (time < 0 || time > 0) {
      _skip--;
      if (_skip < 0) {
        _skip = skip;
        frame = (frame + 1) % images.length;
      }
      if (time > 0) {
        --time;
      }
      
      image(images[frame], x, y, width, height);
    } else {
      image(images[0], x, y, width, height);
    }
  }
}
