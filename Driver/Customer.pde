import java.util.Stack;

class Customer implements Comparable<Customer>{
  Stack<Food> order;
  float tip, waitTime;
  boolean isLeaving;
  int priority;
  String comment;
  
  Customer(int test) {
    priority = test;
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
  
}