import java.util.PriorityQueue;
import java.util.LinkedList;
import java.util.Stack;

PriorityQueue<Customer> customerList;
Stack<Food> makeOrder;
Ingredients[][] ingredient;
Stove[][] stove;
Juicer[][] juicer;
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
  juicer = new Juicer[2][1];
  populateStove();
  populateJuicer();
}

void draw() {
  fill(0, 255, 255);
  rect(0, 0, 1024, 500);
  fill(255);
  rect(0, 500, 1024, 268);
  fill(0);
  drawIngredients();
  drawCustomers();
  drawStoves();
  
  drawJuicers();
  drawTrash();
  drawTray();
  drawCursor();
  stoveCook();
  juice();
  come();
}

void mousePressed() {
  ingredientCheck(mouseX, mouseY);
  stoveCheck(mouseX, mouseY);
  juicerCheck(mouseX, mouseY);
  customerCheck(mouseX, mouseY);
  trash();
  makeTray();
  //cookedFoodCheck(mouseX, mouseY);
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

void stoveCook() {
  for (int r = 0; r < 2; r ++ ) {
    for (int c = 0; c < 2; c ++) {
      if (stove[r][c].inUse == true) {
        //System.out.println(stove[r][c].inUse);
        int x = stove[r][c].xPos;
        int y = stove[r][c].yPos;        
        text(stove[r][c].makeFood() + "", x, y);
        if (stove[r][c].currFood.cookTime <= -300) {   
          stove[r][c].inUse = false;
          //stove[r][c].currFood = null; 
        }      
      }
    }
  }  
}

void juice() { 
  for (int r = 0; r < 2; r ++ ) {
    for (int c = 0; c < 1; c ++) {
      if (juicer[r][c].inUse == true) {
        int x = juicer[r][c].xPos;
        int y = stove[r][c].yPos;
        text(juicer[r][c].makeFood()+"", x, y);
        if (juicer[r][c].currFood.cookTime <= 0) {
        }
      }
    }
  }
}

void stoveCheck(float x, float y) {
  for (int r = 0; r < 2; r ++ ) {
    for (int c = 0; c < 2; c ++) {
      if (isWithin(x, stove[r][c].xPos, stove[r][c].xPos + 100, y, stove[r][c].yPos, stove[r][c].yPos + 100) ) {
        if (cursorValue >= 0 && cursorValue < 5) {
          stove[r][c].inUse = true;
          Ingredients temp = ingredient[0][cursorValue];
          Ingredients storedFood = new Ingredients(temp.type, stove[r][c].xPos + 25, stove[r][c].yPos + 25, temp.img);
          stove[r][c].currFood = storedFood;
        }
        cursorValue = 10;
        //used = stove[r][c];

        if (cursorValue == 10 & stove[r][c].currFood.isCooked == true) {
          Ingredients storedFood = null;
          stove[r][c].currFood = null;
        }

      
      }
    }
  }
}

void juicerCheck(float x, float y) { 
  for (int r = 0; r < 2; r ++ ) {
    for (int c = 0; c < 1; c ++) {
      if (isWithin(x, juicer[r][c].xPos, juicer[r][c].xPos + 100, y, juicer[r][c].yPos, juicer[r][c].yPos + 100) ) {
        if (cursorValue > 7 && cursorValue < 10) {
          juicer[r][c].inUse = true;
          Ingredients temp = ingredient[1][cursorValue - 5];
          Ingredients storedFood = new Ingredients(temp.type, juicer[r][c].xPos + 25, juicer[r][c].yPos + 25, temp.img);
          juicer[r][c].currFood = storedFood;
        }
        cursorValue = 10;
      }
    }
  }
}


void customerCheck(float x, float y) { 
  if (isWithin(x, 50, 100, y, 450, 550) ) {
      customerList.peek().printOrder();
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
  if (cursorValue < 10) {
    temp = getIngredient().img;
    image(temp, xPos - 15, yPos - 15, 50, 30);
  }
  
}

Ingredients getIngredient() {
  if (cursorValue < 5) {
    return ingredient[0][cursorValue];
  } else if (cursorValue < 10) {
    return ingredient[1][cursorValue - 5];
  } else
    return null;
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
  int y = 514;
  for (int r = 0; r < stove.length; r++) {
    int x = 350;
    for (int c = 0; c < stove[r].length; c++) {
      stove[r][c] = new Stove(x, y);
      x+= 114;
    }
    y += 114;
  }
}

void populateJuicer() {
  int y = 514;
  for (int r = 0; r < juicer.length; r++) {
    int x = 578;
    for (int c = 0; c < juicer[r].length; c++) {
      juicer[r][c] = new Juicer(x, y);
      x += 114;
    }
    y += 114;
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

void drawJuicers() {
  for (Juicer[] jRow : juicer) {
    for (Juicer j : jRow) {
      j.display();
    }
  }
}

void drawStoves() {
  for (Stove[] sRow : stove) {
    for (Stove s : sRow) {
      s.display();
    }
  }
}

void drawTrash() { 
  PImage img = loadImage("Image/trash.png");
  image(img, 692, 514, 100, 100);
}

void drawTray() {
  PImage img = loadImage("Image/tray.jpg");
  image(img, 692, 628, 100, 100);
}

void trash() {
  if (isWithin(mouseX, 692, 792, mouseY, 514, 614))
      cursorValue = 10;
    //makeOrder.pop();
}

void makeTray() {
  if (isWithin(mouseX, 692, 792, mouseY, 628, 728) ) {
    if (cursorValue < 10) 
      getIngredient().display();
  }
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
}

void leave() {
  Customer c = customerList.peek();
  if (c.waitTime < 0) {
    text(c.comment(), c.xPos + 50, c.yPos + 20);
    customerList.remove();
  }
}
