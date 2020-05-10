import ddf.minim.*;

Minim minim;
AudioPlayer coinSounds;
AudioOutput audioOut;

void loadSounds() {
  minim = new Minim(this);
  audioOut = minim.getLineOut();
  audioOut.setVolume(0.0f);

  coinSounds = minim.loadFile("coin.wav");
}
