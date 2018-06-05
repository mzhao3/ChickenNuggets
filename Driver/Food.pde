import java.util.Stack;

class Food {
  String type, size;
  float price;
  Stack<Ingredients> components = new Stack<Ingredients>(); 

  Food(String newType, String newSize) {
    type = newType;
    size = newSize;

    if (type.equals("hamburgers")) {
      components.push(new Ingredients("bread"));
      components.push(new Ingredients("beef"));
      components.push(new Ingredients("lettuce"));
      components.push(new Ingredients("tomato"));
      components.push(new Ingredients("cheese"));
      components.push(new Ingredients("bacon"));
      components.push(new Ingredients("bread"));
      price = 4.5;
    }
    if (type.equals("chickenburger")) {
      components.push(new Ingredients("bread"));
      components.push(new Ingredients("chicken"));
      components.push(new Ingredients("lettuce"));
      components.push(new Ingredients("tomato"));
      components.push(new Ingredients("cheese"));
      components.push(new Ingredients("bread"));
      price = 3.0;
    }
    if (type.equals("grilledcheese")) {
      components.push(new Ingredients("bread"));
      components.push(new Ingredients("cheese"));
      components.push(new Ingredients("cheese"));
      components.push(new Ingredients("cheese"));
      components.push(new Ingredients("bread"));
      price = 4.0;
    }

    if (type.equals("salad")) {
      components.push(new Ingredients("cheese"));
      components.push(new Ingredients("lettuce"));
      components.push(new Ingredients("tomato"));
    }
    if (type.equals("appleJuice")) {
      components.push(new Ingredients("apple"));
    }
    if (type.equals("orangeJuice")) {
      components.push(new Ingredients("orange"));
    }
  }


  String getType() {
    return type;
  }

  double getPrice() {
    return price;
  }

  //hamburgers - bread, beef, lettuce, tomato, cheese, bread, bacon
  //chickenburger- chicken, lettuce, tomato, cheese, bread
  //grilledcheese- bread, cheese,chesse,chesse, bread
  //soda - sizes
}
