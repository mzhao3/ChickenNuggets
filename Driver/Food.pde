import java.util.Stack;

class Food {
  String type, size;
  float price;
  Stack<Ingredients> components = new Stack<Ingredients>(); 

  Food(String newType, String newSize) {
    type = newType;
    size = newSize;
  
    if (type.equals("hamburgers")) {
      components.push(new Bread());
      components.push(new Beef());
      components.push(new Lettuce());
      components.push(new Tomato());
      components.push(new Cheese());
      components.push(new Bacon());
      components.push(new Bread());
      price = 4.5;
    }
    if(type.equals("chickenburger")) {
      components.push(new Bread());
      components.push(new Chicken());
      components.push(new Lettuce());
      components.push(new Tomato());
      components.push(new Cheese());
      components.push(new Bread());
      price = 3.0;
    }
    if(type.equals("grilledcheese")) {
      components.push(new Bread());
      components.push(new Cheese());
      components.push(new Cheese());
      components.push(new Cheese());
      components.push(new Bread());
      price = 4.0;
    }
   
    if(type.equals("salad")) {
      components.push(new Cheese());
      components.push(new Lettuce());
      components.push(new Tomato());
    }
    if(type.equals("appleJuice")) {
      components.push(new Apple());
    }
    if(type.equals("orangeJuice")) {
      components.push(new Orange());
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
