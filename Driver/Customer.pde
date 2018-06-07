import java.util.LinkedList;

class Customer implements Comparable<Customer>{
  String[] menu = {"hamburger", "chickenburger", "grilledcheese", 
  "salad", "orangeJuice", "appleJuice"};
  LinkedList<Food> orderList = new LinkedList<Food>();
  float tipRate, waitTime;
  boolean isLeaving;
  float priority, xPos, yPos;
  String comment;
  PImage img;
  
  Customer() {
    priority = 2;
    tipRate = 0.15;
    waitTime = 20;
    isLeaving = false;
    comment = "Thank you";
    img = loadImage("Image/customer.png");
    xPos = 50;
    orderList = makeOrder((int)(Math.random() * 3));
  }
  
  Customer(float y) {
    this();
    yPos = y;
  }
  
  
  
//-------------PQueue--Helper----------------
  boolean equals(Customer other) {
    return priority == other.priority;
  }
  
  int compareTo(Customer other) {
    if(this.equals(other)) {
      return 0;
    } else if (priority > other.priority) {
      return 1;
    } else {
      return -1;
    }
  }

  
  //------------Customer's methods----------------
  
  LinkedList<Food> makeOrder(int numItem) {
    for (int x = numItem; x >= 0; x--) {
      orderList.add(new Food(menu[(int)(Math.random() * menu.length)]));
    }
    return orderList;
  }
  
  ArrayList<String> getOrder() {
    ArrayList<String> typeList = new ArrayList<String>();
    for(Food order: orderList) {
      typeList.add(order.getType());
    }
    return typeList;
  }
  
  String printOrder() {
    String types = "";
    for(Food order: orderList) {
      types = types + order.getType() + ", " ;    
    }
    return types;  
  }
  
  
  double setTips() {
    double total = 0;
    for(Food order: orderList) {
      total += order.getPrice();
    }
    return total * tipRate;
  }
  
  void display() {
    image(img, xPos, yPos, 50, 100);
  }
  
 
}
