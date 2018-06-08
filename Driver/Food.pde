import java.util.Stack;

class Food {
  String type;
  PImage img;
  ArrayList<Ingredients> components = new ArrayList<Ingredients>(); 
  // need to differentiate between cooked beef and raw beef 

  //specify the default way of placing the Ingredients
  //if the order of the Ingredients is violated, then the Food must be trashed
  Food(String newType) {
    type = newType;
    if (type.equals("hamburger")) {
      components.add(new Ingredients("bread"));
      components.add(new Ingredients("beef"));
      components.add(new Ingredients("lettuce"));
      components.add(new Ingredients("tomato"));
      components.add(new Ingredients("cheese"));
      components.add(new Ingredients("bacon"));
      components.add(new Ingredients("bread"));
      img = loadImage("Image/hamburger.png");
    }
    if (type.equals("chickenburger")) {
      components.add(new Ingredients("bread"));
      components.add(new Ingredients("chicken"));
      components.add(new Ingredients("lettuce"));
      components.add(new Ingredients("tomato"));
      components.add(new Ingredients("cheese"));
      components.add(new Ingredients("bread"));
      img = loadImage("Image/chickenburger.png");
    }
    if (type.equals("grilledcheese")) {
      components.add(new Ingredients("bread"));
      components.add(new Ingredients("cheese"));
      components.add(new Ingredients("cheese"));
      components.add(new Ingredients("cheese"));
      components.add(new Ingredients("bread"));
      img = loadImage("Image/grilledcheese.png");
    }

    if (type.equals("salad")) {
      components.add(new Ingredients("cheese"));
      components.add(new Ingredients("lettuce"));
      components.add(new Ingredients("tomato"));
      img = loadImage("Image/salad.png");
    }
    if (type.equals("appleJuice")) {
      components.add(new Ingredients("apple"));
      img = loadImage("Image/appleJuice.png");
    }
    if (type.equals("orangeJuice")) {
      components.add(new Ingredients("orange"));
      img = loadImage("Image/orangeJuice.png");
    }
  }

  void display() {
    image(img, xPos, yPos, 100, 100);
  }

}
