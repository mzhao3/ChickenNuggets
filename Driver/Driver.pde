import java.util.PriorityQueue;
import java.util.LinkedList;
import java.util.Stack;

PriorityQueue<Customer> customerList;
Stack<Food> makeOrder;
Ingredients[][] ingredient;
Stove[][] stove;
float totalTips, xPos, yPos;
int cursorValue = 10;
int numLeave;

void setup() {
  rectMode(CORNER);
  imageMode(CORNER);
  size(1024, 768);
  background(0);
  customerList = new PriorityQueue<Customer>();
  ingredient = new Ingredients[2][5];
  populateIngredient();
  stove = new Stove[2][2];
  populateStove();
}

void draw() {
  fill(0, 255, 255);
  rect(0, 0, 1024, 500);
  fill(255);
  rect(0, 500, 1024, 268);
  drawIngredients();
  drawCustomers();
  drawStoves();
  drawCursor();
  come();
}

void mousePressed() {
  ingredientCheck(mouseX, mouseY);
}

void ingredientCheck(float x, float y) {
  if (isWithin(x, 20, 70, y, 520, 570)) {
    cursorValue = 0;
  } else if (isWithin(x, 80, 130, y, 520, 570)) {
    cursorValue = 1;
  } else if (isWithin(x, 140, 190, y, 520, 570)) {
    cursorValue = 2;
  } else if (isWithin(x, 200, 250, y, 520, 570)) {
    cursorValue = 3;
  } else if (isWithin(x, 260, 310, y, 520, 570)) {
    cursorValue = 4;
  } else if (isWithin(x, 20, 70, y, 640, 690)) {
    cursorValue = 5;
  } else if (isWithin(x, 80, 130, y, 640, 690)) {
    cursorValue = 6;
  } else if (isWithin(x, 140, 190, y, 640, 690)) {
    cursorValue = 7;
  } else if (isWithin(x, 200, 250, y, 640, 690)) {
    cursorValue = 8;
  } else if (isWithin(x, 260, 310, y, 640, 690)) {
    cursorValue = 9;
  }
}

boolean isBetween(float currPos, float lower, float upper) {
  return currPos >= lower && currPos <= upper;
}

boolean isWithin(float xPos, float lowerX, float upperX, float yPos, float lowerY, float upperY) {
  return isBetween(xPos, lowerX, upperX) && isBetween(yPos, lowerY, upperY);
}

void drawCursor() {
  PImage temp;
  xPos = mouseX;
  yPos = mouseY;
  if (cursorValue < 5) {
    temp = ingredient[0][cursorValue].img;
    image(temp, xPos - 15, yPos - 15, 30, 30);
  } else if (cursorValue < 10) {
    temp = ingredient[1][cursorValue - 5].img;
    image(temp, xPos - 15, yPos -15, 30, 30);
  }
}

void populateIngredient() {
  //50 x 50
  ingredient[0][0] = new Ingredients("cheese", 20, 520, loadImage("Image/cheese.png"));
  ingredient[0][1] = new Ingredients("chicken", 80, 520, loadImage("Image/chicken.png"));
  ingredient[0][2] = new Ingredients("beef", 140, 520, loadImage("Image/beef.png"));
  ingredient[0][3] = new Ingredients("bacon", 200, 520, loadImage("Image/bacon.png"));
  ingredient[0][4] = new Ingredients("fish", 260, 520, loadImage("Image/fish.png"));
  ingredient[1][0] = new Ingredients("tomato", 20, 640, loadImage("Image/tomato.png"));
  ingredient[1][1] = new Ingredients("bread", 80, 640, loadImage("Image/bread.png"));
  ingredient[1][2] = new Ingredients("lettuce", 140, 640, loadImage("Image/lettuce.png"));
  ingredient[1][3] = new Ingredients("apple", 200, 640, loadImage("Image/apple.png"));
  ingredient[1][4] = new Ingredients("orange", 260, 640, loadImage("Image/orange.png"));
}

void populateStove() {
  int x = 350;
  for (int r = 0; r < stove.length; r++) {
    int y = 514;
    for (int c = 0; c < stove[r].length; c++) {
      stove[r][c] = new Stove(x, y);
      y += 114;
    }
    x+= 114;
  }
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
    fill(0);
    text(c.printOrder(), c.xPos + 50, c.yPos + 20);
  }
}

void drawStoves() {
  for (Stove[] sRow : stove) {
    for (Stove s : sRow) {
      s.display();
    }
  }
}

void trash() {
  makeOrder.pop();
}

void come() {
  float randInt = (float)Math.random();
  //~3% for special customers & ~10% for regular customers
  if (randInt <= .00051) {
    customerList.add(new Troll());
  } else if (randInt <= .00102) {
    customerList.add(new GordanRamsay());
  } else if (randInt <= .00153) {
    customerList.add(new GuyFieri());
  } else if (randInt <= .00283) {
    customerList.add(new Customer());
  }
  int y = 400;
  for (Customer c : customerList) {
    c.setPOrder(y);
    y-= 100;
  }

  // CLICKING!!

  // with kitchen equipment :) 
  /**
   void cook() {
   if (cursorValue < 6) {
   
   }
   }
   **/
}

void leave() {
}
