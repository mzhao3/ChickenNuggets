class GuyFieri extends Customer{
   GuyFieri() {
    priority = 1; //1
    waitTime = 15;
    tipRate = 0.2;
    isLeaving = false; 
  }
  
  void advise() {
     int random = (int)(Math.random() * 3);
    if (random == 0) {
      comment = "Food is not just eating energy. It's an experience"; 
    } else if(random == 1) {
      comment = "There are two different things: there's grilling, and there's barbecue. Grilling is when people say, 'We're going to turn up the heat, make it really hot and sear a steak, sear a burger, cook a chicken.' Barbecue is going low and slow.";
    } else {
      comment = "Cooking is all about people. Food is maybe the only universal thing that really has the power to bring everyone together.";
    }
  }
  
}
