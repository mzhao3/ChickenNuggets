class Ingredients {
  boolean isCooked = false;
  boolean isBurned = false;
  double cookTime;
  int xPos, yPos;
  PImage img;
  String type;

  Ingredients (String name) {
    type = name;
  }

  Ingredients(String name, int x, int y, PImage image) {
    this(name);
    xPos = x;
    yPos = y;
    img = image;
  }

  void display() {
    noFill();
    stroke(0);
    rect(xPos, yPos, 50, 50);
    image(img, xPos, yPos, 50, 50);
  }

  double getCookTime() {
    return cookTime;
  }

  void setCooked() {
    if (cookTime <= -50) {
      isBurned = true;
    } else if (cookTime <= 0) {
      isCooked = true;
    }
  }

  void reduceCookTime() {
    cookTime -= 1;
  }
}
