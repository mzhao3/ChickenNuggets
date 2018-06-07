class Kitchen {
  PImage img;
  int efficiency, xPos, yPos;
  boolean inUse;
  Ingredients currFood;

  Kitchen(int x, int y) {
    xPos = x;
    yPos = y;
  }
  
  int makeFood() {
    currFood.cookTime = currFood.cookTime -=1;
    return (int) (currFood.cookTime / 60);
  }
  
  void display() {
    noFill();
    stroke(0);
    rect(xPos, yPos, 100, 100);
    image(img, xPos, yPos, 100, 100);
    if (currFood != null) {
      currFood.display();
    }
  }
}
