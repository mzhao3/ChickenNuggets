class GuyFieri extends Customer{
   GuyFieri() {
    super();
    img = loadImage("Image/Guy.png");
    priority = 1; //higher priority than regular customers
    waitTime = 15; //shorter wait time
    tipRate = 0.2; //higher tip rate
    isLeaving = false; 
  }
  
    //once food is served, Guy will leave a comment

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
