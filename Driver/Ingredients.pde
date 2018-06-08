class Ingredients {
  boolean isCooked;
  boolean isBurned;
  double cookTime = 300;
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

  //create the icon for each Ingredients
  void display() {
    noFill();
    stroke(0);
    rect(xPos, yPos, 50, 50);
    image(img, xPos, yPos, 50, 50);
  }


}
