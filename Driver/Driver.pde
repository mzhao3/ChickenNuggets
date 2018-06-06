import java.util.PriorityQueue;
import java.util.LinkedList;
import java.util.Stack;

PriorityQueue<Customer> customerList;
Stack<Food> makeOrder;
Ingredients[][] ingredient;
float totalTips;
int numLeave;
int yPos = 400;

void setup() {
  rectMode(CORNER);
  imageMode(CORNER);
  size(1024, 768);
  background(0);
  customerList = new PriorityQueue<Customer>();
  ingredient = new Ingredients[2][5];
  populateIngredient();
}

void draw() {
  fill(0, 255, 255);
  rect(0, 0, 1024, 500);
  fill(255);
  rect(0, 500, 1024, 268); 
  drawIngredients();
  drawCustomers();
  come();
}

void populateIngredient() {
  ingredient[0][0] = new Ingredients("bread", 20, 520, loadImage("Image/bread.png"));
  ingredient[0][1] = new Ingredients("chicken", 80, 520, loadImage("Image/chicken.png"));
  ingredient[0][2] = new Ingredients("beef", 140, 520, loadImage("Image/beef.png"));
  ingredient[0][3] = new Ingredients("bacon", 200, 520, loadImage("Image/bacon.png"));
  ingredient[0][4] = new Ingredients("fish", 260, 520, loadImage("Image/fish.png"));
  ingredient[1][0] = new Ingredients("tomato", 20, 640, loadImage("Image/tomato.png"));
  ingredient[1][1] = new Ingredients("cheese", 80, 640, loadImage("Image/cheese.png"));
  ingredient[1][2] = new Ingredients("lettuce", 140, 640, loadImage("Image/lettuce.png"));
  ingredient[1][3] = new Ingredients("apple", 200, 640, loadImage("Image/apple.png"));
  ingredient[1][4] = new Ingredients("orange", 260, 640, loadImage("Image/orange.png"));
}

void drawIngredients() {
  for (Ingredients[] row : ingredient) {
    for (Ingredients i : row) {
      i.display();
    }
  }
}

void drawCustomers() {
  for (Customer c : customerList) {
    c.display();
    System.out.println(c.getOrder());
  }
}

void trash() {
  makeOrder.pop();
}

void come() {
  float randInt = (float)Math.random();
  //~11.6%
  if (randInt <= .002) {
    customerList.add(new Customer(yPos));
    yPos -= 100;
  }
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