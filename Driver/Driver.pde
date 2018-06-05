import java.util.PriorityQueue;
import java.util.LinkedList;

PriorityQueue<Customer> customerList;
Stack<Food> makeOrder;
Ingredients[][] ingredient;
float totalTips;
int numLeave;
float yPos = 400;

void setup() {
  rectMode(CORNER);
  imageMode(CORNER);
  size(1500, 800);
  background(0);
  customerList = new PriorityQueue<Customer>();
  ingredient = new Ingredients[2][5];
  populateIngredient();
}

void draw() {
  fill(0, 255, 255);
  rect(0, 0, 1500, 500);
  fill(255);
  rect(0, 500, 1500, 300); 
  for (Ingredients[] row : ingredient) {
    for (Ingredients i : row) {
      i.display();
    }
  }
  come();
  for (Customer c : customerList) {
    c.display();
  }
}

void populateIngredient() {
  ingredient[0][0] = new Ingredients("bread", 20, 520, loadImage("image/bread.png"));
  ingredient[0][1] = new Ingredients("chicken", 140, 520, loadImage("image/chicken.png"));
  ingredient[0][2] = new Ingredients("beef", 260, 520, loadImage("image/beef.png"));
  ingredient[0][3] = new Ingredients("bacon", 380, 520, loadImage("image/bacon.png"));
  ingredient[0][4] = new Ingredients("fish", 500, 520, loadImage("image/fish.png"));
  ingredient[1][0] = new Ingredients("tomato", 20, 640, loadImage("image/tomato.png"));
  ingredient[1][1] = new Ingredients("cheese", 140, 640, loadImage("image/cheese.png"));
  ingredient[1][2] = new Ingredients("lettuce", 260, 640, loadImage("image/lettuce.png"));
  ingredient[1][3] = new Ingredients("apple", 380, 640, loadImage("image/apple.png"));
  ingredient[1][4] = new Ingredients("orange", 500, 640, loadImage("image/orange.png"));
}

void trash() {
  makeOrder.pop();
}

void come() {
  float randInt = (float)Math.random();
  //5.8%
  if (randInt <= 0.001) {
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
