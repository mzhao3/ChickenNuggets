class Troll extends Customer{

   Troll() {
    super();
    waitTime = 15;  //shorter wait time
    tipRate = 0.1;  //less tip
    img = loadImage("Image/troll.png");
    isLeaving = false;
    priority = 0;
  }
  
  //hasn't implemented kitchen yet
  void steal() {
    
  }
  
}
