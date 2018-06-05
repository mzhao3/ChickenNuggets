import java.util.LinkedList;

class Customer implements Comparable<Customer>{
  LinkedList<Food> orderList = new LinkedList<Food>();
  float tipRate, waitTime;
  boolean isLeaving;
  int priority, xPos, yPos;
  String comment;
  PImage img;
  //-----Food Items-----------
  final int hamburger = 0;
  final int chickenburger = 1;
  final int grilledcheese = 2;
  final int salad = 3;
  final int appleJuice = 4;
  final int orangeJuice = 5;
  
  Customer() {
    priority = 2;
    tipRate = 0.15;
    waitTime = 20;
    isLeaving = false;
    comment = "Thank you";
    img = loadImage("image/customer.png");
    xPos = 50;
  }
  
  Customer(int y) {
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
  
  void makeOrder(String newType) {
    Food order = new Food(newType); 
    orderList.add(order);
  }
  
  ArrayList<String> getOrder() {
    ArrayList<String> typeList = new ArrayList<String>();
    for(Food order: orderList) {
      typeList.add(order.getType());
    }
    return typeList;
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
