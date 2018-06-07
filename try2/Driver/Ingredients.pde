class Ingredients {
  boolean isCooked;
  boolean isBurned;
  double cookTime = 300;
  double cookSpeed;
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

  void setCooked() {
    if (cookTime <= -300) {
      isBurned = true;
    } else if (cookTime <= 0) {
      isCooked = true;
    }
  }


}
