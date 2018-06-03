import java.util.Stack;

class Customer implements Comparable<Customer>{
  Stack<Food> orderList = new Stack<Food>();
  float tipRate, waitTime;
  boolean isLeaving;
  int priority;
  String comment;
  
  Customer() {
    priority = 2;
    tipRate = 0.15;
    waitTime = 20;
    isLeaving = false;
    comment = "Thank you";
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
  
  String toString() {
    return priority + "";
  }

  
  //------------Customer's methods----------------
  
  void makeOrder(String newType, String newSize) {
    Food order = new Food(newType, newSize); 
    orderList.push(order);
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
  
}
