import java.util.PriorityQueue;
import java.util.LinkedList;

//instance variables 
Food[] menu;
PriorityQueue<Customer> customerList;
ArrayList<Ingredients> makeOrder; //arrayList of orders
LinkedList<Food> combineOrder;
Ingredients[][] ingredient;
Stove[][] stove;
Juicer[][] juicer;
float totalTips, xPos, yPos;
int cursorValue = 40; //every ingredients icon on the screen are numbered 0-9 corresponding to the Ingredients object 
int numLeave;

//instantiate the instance variables
//populate the icons for Ingredients and kitchen items
void setup() {
  //specify display windows
  rectMode(CORNER);
  imageMode(CORNER);
  size(1024, 768);
  background(0);
  //instantiate and populate
  menu = new Food[6];
  makeOrder = new ArrayList<Ingredients>();
  combineOrder = new LinkedList<Food>();
  customerList = new PriorityQueue<Customer>();
  ingredient = new Ingredients[2][5];
  populateIngredient();
  stove = new Stove[2][2];
  juicer = new Juicer[2][1];
  populateStove();
  populateJuicer();
  populateMenu();
}


//draw all the icons and launch the game
void draw() {
  fill(0, 255, 255);
  rect(0, 0, 1024, 500); //draw the room, fill it blue
  fill(255);
  rect(0, 500, 1024, 268); //draw the table, fill it white
  fill(0);
  drawIngredients();
  drawCustomers();
  drawStoves();
  drawJuicers();
  drawTrash();
  drawTray();
  drawServe();
  drawCursor();
  stoveCook();
  juiceCook();
  displayItem();
  displayOrder();
  come();
}

//function called once after every time a mouse is pressed.
//Will check if the current mouse position is on an ingredient icon, a stove icon or a juicer icon
void mousePressed() {
  ingredientCheck(mouseX, mouseY);
  stoveCheck(mouseX, mouseY);
  juicerCheck(mouseX, mouseY);
  itemCheck(mouseX, mouseY);
  orderCheck(mouseX, mouseY);
  serviceCheck(mouseX, mouseY);
  trash(mouseX, mouseY);
}

//specify location of the menu
void populateMenu() {
  menu[0] = new Food("hamburger");
  menu[1] = new Food("chickenburger");
  menu[2] = new Food("grilledcheese");
  menu[3] = new Food("salad");
  menu[4] = new Food("appleJuice");
  menu[5] = new Food("orangeJuice");
}

//Assign cursorValue to each of the ingredients icon
void ingredientCheck(float x, float y) {
  if (isWithin(x, 20, 70, y, 520, 570)) {
    cursorValue = 0; //cheese
  } else if (isWithin(x, 80, 130, y, 520, 570)) {
    cursorValue = 1; //chicken
  } else if (isWithin(x, 140, 190, y, 520, 570)) {
    cursorValue = 2; //beef
  } else if (isWithin(x, 200, 250, y, 520, 570)) {
    cursorValue = 3; //bacon
  } else if (isWithin(x, 260, 310, y, 520, 570)) {
    cursorValue = 4; //fish
  } else if (isWithin(x, 20, 70, y, 640, 690)) {
    cursorValue = 5; //tomato
  } else if (isWithin(x, 80, 130, y, 640, 690)) {
    cursorValue = 6; //bread
  } else if (isWithin(x, 140, 190, y, 640, 690)) {
    cursorValue = 7; //lettuce
  } else if (isWithin(x, 200, 250, y, 640, 690)) {
    cursorValue = 8; //apple
  } else if (isWithin(x, 260, 310, y, 640, 690)) {
    cursorValue = 9; //orange
  }
}

//check if the cursor is dragged toward an unoccupied stove
//keep track of time
//renew state of stove once food is cooked
void stoveCook() {
  for (int r = 0; r < 2; r ++ ) {
    for (int c = 0; c < 2; c ++) {
      if (stove[r][c].inUse == true) {
        int x = stove[r][c].xPos;
        int y = stove[r][c].yPos;        
        text(stove[r][c].makeFood() + "", x, y, 30, 30);
        if (stove[r][c].currFood.cookTime <= -300) {
          stove[r][c].currFood.isBurned = true;
          stove[r][c].currFood.isCooked = false;
        } else if (stove[r][c].currFood.cookTime <= 0) {
          stove[r][c].currFood.isCooked = true;
        }
      }
    }
  }
}


//check if the mouse is within the region of the juicer
//if the juiver is not being used then tell Juicer to store the new cursor as its currFood
void juiceCook() { 
  for (int r = 0; r < 2; r ++ ) {
    for (int c = 0; c < 1; c ++) {
      if (juicer[r][c].inUse == true) {
        int x = juicer[r][c].xPos;
        int y = stove[r][c].yPos;
        text(juicer[r][c].makeFood()+"", x, y, 30, 30);
        if (juicer[r][c].currFood.cookTime <= 0) {
          juicer[r][c].currFood.isCooked = true;
        }
      }
    }
  }
}

//check if the mouse is within the region of the stove
//if the stove is not being used then tell Stove to store the cursor as its currFood
void stoveCheck(float x, float y) {
  for (int r = 0; r < 2; r ++ ) {
    for (int c = 0; c < 2; c ++) {
      if (isWithin(x, stove[r][c].xPos, stove[r][c].xPos + 100, y, stove[r][c].yPos, stove[r][c].yPos + 100) ) {
        if (cursorValue >= 0 && cursorValue < 5 && stove[r][c].inUse == false) {
          stove[r][c].inUse = true;
          Ingredients temp = ingredient[0][cursorValue];
          Ingredients storedFood = new Ingredients(temp.type, stove[r][c].xPos + 25, stove[r][c].yPos + 25, temp.img);
          stove[r][c].currFood = storedFood;
        } else if (cursorValue == 40 && stove[r][c].inUse == true && stove[r][c].currFood.isCooked == true) { //IT'S COOKED TO PERFECTION
          Ingredients currFood = stove[r][c].currFood;
          if (currFood.type.equals("cheese")) {
            cursorValue = 10;
          } else if (currFood.type.equals("chicken")) {
            cursorValue = 11;
          } else if (currFood.type.equals("beef")) {
            cursorValue = 12;
          } else if (currFood.type.equals("bacon")) {
            cursorValue = 13;
          } else if (currFood.type.equals("fish")) {
            cursorValue = 14;
          }
          stove[r][c].currFood = null;
          stove[r][c].inUse = false;
        } else if (cursorValue == 40 && stove[r][c].inUse == true && stove[r][c].currFood.isBurned == true) { //"IT'S BLOODY RAW"
          Ingredients currFood = stove[r][c].currFood;
          if (currFood.type.equals("cheese")) {
            cursorValue = 20;
          } else if (currFood.type.equals("chicken")) {
            cursorValue = 21;
          } else if (currFood.type.equals("beef")) {
            cursorValue = 22;
          } else if (currFood.type.equals("bacon")) {
            cursorValue = 23;
          } else if (currFood.type.equals("fish")) {
            cursorValue = 24;
          }
          stove[r][c].currFood = null;
          stove[r][c].inUse = false;
        }
      }
    }
  }
}

//add items to the ArrayList of prepared Food based on their cursor value
//check if the added item matched the default way of making in Food
//if everything matched, store the order
void itemCheck(float x, float y) {
  if (isWithin(x, 692, 792, y, 514, 614) ) {
    //for the food you put in tray
    if (mouseButton == RIGHT && !(makeOrder.isEmpty())) {
      makeOrder.remove(makeOrder.size() - 1);
    } else {
      if (cursorValue >= 5 && cursorValue < 8) {
        Ingredients temp = new Ingredients(ingredient[1][cursorValue - 5].type);
        makeOrder.add(temp);
        cursorValue = 40;
      } else if (cursorValue >= 10 && cursorValue < 15) {
        Ingredients temp = new Ingredients(ingredient[0][cursorValue - 10].type);
        makeOrder.add(temp);
        cursorValue = 40;
      } else if (cursorValue > 17 && cursorValue < 20) {
        Ingredients temp = new Ingredients(ingredient[1][cursorValue - 15].type);
        makeOrder.add(temp);
        cursorValue = 40;
      } else if (cursorValue == 40 && !(makeOrder.isEmpty())) {
        for (int i = 0; i < menu.length; i++) {
          for (int j = 0; j < menu[i].components.size(); j++) {
            if (makeOrder.size() == menu[i].components.size()) {
              if (!(makeOrder.get(j).type.equals(menu[i].components.get(j).type))) {
                break;
              }
              cursorValue = i + 30;
              ArrayList temp = new ArrayList();
              makeOrder = temp;
            }
          }
          if (makeOrder.isEmpty()) {
            break;
          }
        }
      }
    }
  }
}

//after making the order in itemCheck
//combine all the makeOrder into a list of orders that the user made
void orderCheck(float x, float y) {
  if (isWithin(x, 692, 792, y, 628, 728)) {
    if (mouseButton == RIGHT && !(combineOrder.isEmpty())) {
      combineOrder.remove(combineOrder.size() - 1);
    } else {
      if (cursorValue >= 30 && cursorValue < 36) {
        Food temp = new Food(menu[cursorValue - 30].type);
        combineOrder.add(temp);
        cursorValue = 40;
      }
    }
  }
}


//check if the ingredients cursor is within the region of the juicer
//if it is within the region, then store the juicer as an used Juicer, meaning it cannot be occupied until the ingredients is ready
void juicerCheck(float x, float y) { 
  for (int r = 0; r < 2; r ++ ) {
    for (int c = 0; c < 1; c ++) {
      if (isWithin(x, juicer[r][c].xPos, juicer[r][c].xPos + 100, y, juicer[r][c].yPos, juicer[r][c].yPos + 100) ) {
        if (cursorValue > 7 && cursorValue < 10 && juicer[r][c].inUse == false) {
          juicer[r][c].inUse = true;
          Ingredients temp = ingredient[1][cursorValue - 5];
          Ingredients storedFood = new Ingredients(temp.type, juicer[r][c].xPos + 25, juicer[r][c].yPos + 25, temp.img);
          juicer[r][c].currFood = storedFood;
        } else if (cursorValue == 40 && juicer[r][c].inUse == true && juicer[r][c].currFood.isCooked == true) {
          Ingredients currFood = juicer[r][c].currFood;
          if (currFood.type.equals("apple")) {
            cursorValue = 18;
          } else if (currFood.type.equals("orange")) {
            cursorValue = 19;
          }
          juicer[r][c].currFood = null;
          juicer[r][c].inUse = false;
        }
      }
    }
  }
}

//helper function for stoveCheck and juicerCheck
boolean isBetween(float currPos, float lower, float upper) {
  return currPos >= lower && currPos <= upper;
}

//helper fuction for stoveCheck and JuicerCheck
boolean isWithin(float xPos, float lowerX, float upperX, float yPos, float lowerY, float upperY) {
  return isBetween(xPos, lowerX, upperX) && isBetween(yPos, lowerY, upperY);
}

//when user clicked on the ingredients icon, a cursor of the icon appears and the user may move it to the kitchen equipments
void drawCursor() {
  PImage temp;
  xPos = mouseX;
  yPos = mouseY;
  if (cursorValue < 10) {
    temp = getIngredient().img;
    image(temp, xPos - 15, yPos - 15, 30, 30);
    if (cursorValue < 5) {
      text("uncooked", xPos - 30, yPos - 30, 60, 30);
    }
    if (cursorValue > 7 && cursorValue < 10) {
      text("whole", xPos - 15, yPos - 30, 60, 30);
    }
  } else if (cursorValue < 15) {
    temp = getIngredient().img;
    image(temp, xPos - 15, yPos - 15, 30, 30);
    text("cooked", xPos - 20, yPos - 30, 60, 30);
  } else if (cursorValue > 17 && cursorValue < 20) {
    temp = getIngredient().img;
    image(temp, xPos - 15, yPos - 15, 30, 30);
    text("juice", xPos - 10, yPos - 30, 60, 30);
  } else if (cursorValue < 25) {
    temp = getIngredient().img;
    image(temp, xPos - 15, yPos - 15, 30, 30);
    text("burned", xPos - 15, yPos - 30, 60, 30);
  } else if (cursorValue < 36) {
    temp = menu[cursorValue - 30].img;
    image(temp, xPos - 15, yPos -15, 30, 30);
  }
}

//return Ingredients based on whether it is cookable
//top row must be used on stove
//cursor 8 and 9 must be used on juicer
Ingredients getIngredient() {
  if (cursorValue < 5) {
    return ingredient[0][cursorValue];
  } else if (cursorValue < 10) {
    return ingredient[1][cursorValue - 5];
  } else if (cursorValue < 15) {
    return ingredient[0][cursorValue - 10];
  } else if (cursorValue > 17 && cursorValue < 20) {
    return ingredient[1][cursorValue - 15];
  } else if (cursorValue < 25) {
    return ingredient[0][cursorValue - 20];
  } else {
    return null;
  }
}

//specify the location of the Ingredients icon
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

//specify the location of the stove icon
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

//specify the location of the juicer icon
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

//display the ingredients icon in 2 x 5 matrix
void drawIngredients() {
  for (Ingredients[] row : ingredient) {
    for (Ingredients i : row) {
      i.display();
    }
  }
}

//display the customers in the Pqueue
void drawCustomers() {
  for (Customer c : customerList) {
    c.display();
    fill(0);
    text(c.printOrder(), c.xPos + 50, c.yPos + 20);
  }
}

//display the juicer icon in 2 x 1 matrix
void drawJuicers() {
  for (Juicer[] jRow : juicer) {
    for (Juicer j : jRow) {
      j.display();
    }
  }
}

//display the stove icon in 2 x 2 matrix
void drawStoves() {
  for (Stove[] sRow : stove) {
    for (Stove s : sRow) {
      s.display();
    }
  }
}


//display the final product once the food is cooked
void displayItem() {
  int y = 594;
  for (Ingredients i : makeOrder) {
    text(i.type, 806, y, 100, 20);
    y -= 20;
  }
}

//
void displayOrder() {
  int y = 708;
  for (Food f : combineOrder) {
    text(f.type, 806, y, 100, 20);
    y -= 20;
  }
}

//create two tray icons
void drawTray() {
  PImage img = loadImage("Image/tray.png");
  noFill();
  stroke(0);
  rect(692, 514, 100, 100);
  image(img, 692, 514, 100, 100);
  rect(692, 628, 100, 100);  
  image(img, 692, 628, 100, 100);
}

//draw the service table
void drawServe() {
  PImage img = loadImage("Image/service.png");
  noFill();
  stroke(0);
  rect(920, 514, 100, 100);
  image(img, 920, 514, 100, 100);
}

//check whether the food made in orderCheck matched the desired orders in orderList
void serviceCheck(float x, float y) {
  if (isWithin(x, 920, 1020, y, 514, 614) && cursorValue == 40 && !(combineOrder.isEmpty())) {
    for (int i = 0; i < customerList.peek().orderList.size(); i++) {
      if (customerList.peek().orderList.size() == combineOrder.size()) {
        if (!(customerList.peek().orderList.get(i).type.equals(combineOrder.get(i).type))) {
          break;
        }
        customerList.remove();
        LinkedList temp = new LinkedList();
        combineOrder = temp;
      }
    }
  }
}

//if the order is burnt or does not match the order, remove the order and remake
void trash(float x, float y) {
  if (isWithin(x, 920, 1020, y, 628, 728))
    cursorValue = 40;
}


//create the trash icon
void drawTrash() { 
  PImage img = loadImage("Image/trash.png");
  noFill();
  stroke(0);
  rect(920, 628, 100, 100);
  image(img, 920, 628, 100, 100);
}

//spawn the customers
//Different types of customers have different probability to show up every second
//special customers may skip regular customers in the PQueue
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
