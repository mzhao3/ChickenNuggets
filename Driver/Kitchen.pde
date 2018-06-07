class Kitchen {
  PImage img;
  int efficiency, xPos, yPos;
  boolean inUse;
  Ingredients currFood;

  //construct kitchen
  Kitchen(int x, int y) {
    xPos = x;
    yPos = y;
  }
  
  //timer
  int makeFood() {
    currFood.cookTime = currFood.cookTime -=1;
    return (int) (currFood.cookTime / 60);
  }
  
  //create white space / room to contain kitchen item
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
