import java.util.PriorityQueue;
import java.util.Stack;

PriorityQueue<Customer> customerList;
Stack<Food> makeFood;
float totalTips;
int numLeave;

void setup() {
  customerList = new PriorityQueue<Customer>();
  come();
}

void draw() {
}

void trash() {
  makeFood.pop();
}

void come() {
  //PriorityQueue is min heap
  Customer temp = new Customer(2);
  Customer temp1 = new Customer(1);
  Customer temp2 = new Customer(3);
  Customer temp3 = new Customer(0);
  customerList.add(temp);
  customerList.add(temp1);
  customerList.add(temp2);
  customerList.add(temp3);
  System.out.println(customerList);
}
