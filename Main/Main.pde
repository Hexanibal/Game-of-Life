public LifeGame lifeGame;
private int genPerSec = 30;

void setup(){
  //size(1920, 1080);
  fullScreen(SPAN);
  lifeGame = new LifeGame(1920/5, 1080/10);
}

void draw(){
  background(40);
  lifeGame.setDisplay();
  lifeGame.update();
  delay(1000 / genPerSec);
}