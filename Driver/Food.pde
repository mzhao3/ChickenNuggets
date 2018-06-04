import java.util.Stack;

class Food {
  String type, size;
  float price;
  Stack<String> foodItem = new Stack<String>(); 

  Food(String newType, String newSize) {
    type = newType;
    size = newSize;
    isBurned = false;
    isCooked = false;
    if (type.equals("hamburgers")) {
      foodItem.push("bread");
      foodItem.push("beef");
      foodItem.push("lettuce");
      foodItem.push("tomato");
      foodItem.push("cheese");
      foodItem.push("bacon");
      foodItem.push("bread");
      price = 4.5;
    }
    if(type.equals("chickenburger")) {
      foodItem.push("bread");
      foodItem.push("chicken");
      foodItem.push("lettuce");
      foodItem.push("tomato");
      foodItem.push("cheese");
      foodItem.push("bread");
      price = 3.0;
    }
    if(type.equals("grilledcheese")) {
      foodItem.push("bread");
      foodItem.push("cheese");
      foodItem.push("cheese");
      foodItem.push("cheese");
      foodItem.push("bread");
      price = 4.0;
    }
  }
  
  void setCookTime(float newCookTime) {
    cookTime = newCookTime;
  }
  
  double getCookTime() {
    return cookTime;
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