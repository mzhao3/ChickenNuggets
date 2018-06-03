import java.util.PriorityQueue;
import java.util.Stack;

PriorityQueue<Customer> customerList;
Stack<Food> makeOrder;
float totalTips;
int numLeave;

void setup() {
  rectMode(CORNER);
  size(1500,800);
  background(0);
  customerList = new PriorityQueue<Customer>();
  come();
}

void draw() {
  rect(0,500,1500,300);
}

void trash() {
  makeOrder.pop();
}

void come() {
  //PriorityQueue is min heap
  /*
  Customer temp = new Customer(1);
  Customer temp1 = new Customer(2);
  Customer temp2 = new Customer(1);
  Customer temp3 = new Customer(1);
  Customer temp4 = new Customer(2);
  customerList.add(temp);
  customerList.add(temp1);
  customerList.add(temp2);
  customerList.add(temp3);
  customerList.add(temp4);
  System.out.println(customerList);
  */
}
