import java.util.Stack;

class Food {
  String type;
  float price;
  Stack<Ingredients> components = new Stack<Ingredients>(); 
// need to differentiate between cooked beef and raw beef 
  
  //specify the default way of placing the Ingredients
  //if the order of the Ingredients is violated, then the Food must be trashed
  Food(String newType) {
    type = newType;
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

  Stack<Ingredients> getComponents() {
    Stack<Ingredients> result = new Stack<Ingredients>();
    for(int i = 0; i < components.size(); i++) {
      result.push(components.peek());
    }
    return result;   
  }
  //return name of food
  String getType() {
    return type;
  }

  //return price of food
  double getPrice() {
    return price;
  }

  //hamburgers - bread, beef, lettuce, tomato, cheese, bread, bacon
  //chickenburger- chicken, lettuce, tomato, cheese, bread
  //grilledcheese- bread, cheese,chesse,chesse, bread
  //soda - sizes
}
