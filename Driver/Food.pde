class Food {
  float cookTime;
  String type, size;
  boolean isCooked, isBurned;
  float price;
  ArrayList<String> ingredients = new ArrayList<String>(); 

  Food(String newType, String newSize) {
    type = newType;
    size = newSize;
    isBurned = false;
    isCooked = false;
    if (type.equals("hamburgers")) {
      ingredients.add("bread");
      ingredients.add("beef");
      ingredients.add("lettuce");
      ingredients.add("tomato");
      ingredients.add("cheese");
      ingredients.add("bacon");
      ingredients.add("bread");
      price = 4.5;
      cookTime = 15;
    }
    if(type.equals("chickenburger")) {
      ingredients.add("bread");
      ingredients.add("chicken");
      ingredients.add("lettuce");
      ingredients.add("tomato");
      ingredients.add("cheese");
      ingredients.add("bread");
      price = 3.0;
      cookTime = 10;
    }
    if(type.equals("grilledcheese")) {
      ingredients.add("bread");
      ingredients.add("cheese");
      ingredients.add("cheese");
      ingredients.add("cheese");
      ingredients.add("bread");
      price = 4.0;
      cookTime = 8;
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
