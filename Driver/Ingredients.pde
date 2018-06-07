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

  //create the icon for each Ingredients
  void display() {
    noFill();
    stroke(0);
    rect(xPos, yPos, 50, 50);
    image(img, xPos, yPos, 50, 50);
  }

  //set the state of the ingredients
  //if there is no response 50 seconds after the food is cooked, the food will be burnt and trashed
  void setCooked() {
    if (cookTime <= -50) {
      isBurned = true;
    } else if (cookTime <= 0) {
      isCooked = true;
    }
  }


}
