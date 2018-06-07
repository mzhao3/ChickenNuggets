class Kitchen {
  PImage img;
  float xPos, yPos;
  int efficiency;
  boolean inUse = false;

  Ingredients currFood;
  
  Kitchen(int x, int y) {
  xPos = x;
  yPos = y;
  }
  
  void display() {
    noFill();
    stroke(0);
    rect(xPos, yPos, 100, 100);
    image(img, xPos, yPos, 100, 100);
  }  
}
