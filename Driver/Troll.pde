class Troll extends Customer{
   Troll() {
    priority = 2; //test = 1
    waitTime = 15;  //shorter wait time
    tipRate = 0.1;  //less tip
    isLeaving = false; 
  }
  
  void skip() {
    priority = 0;
  }
  
  //hasn't implemented kitchen yet
  void steal() {
    
  }
  
}
