import java.lang.*;

class GordanRamsay extends Customer{

  GordanRamsay() {
    super();
    priority = 1; //test = 1
    img = loadImage("Image/Gordan.png");
    isLeaving = false; 
  }
  
  String comment() {
    int random = (int)(Math.random() * 3);
    if (random == 0) {
      comment = "My gran could do better! and she is dead"; 
    } else if(random == 1) {
      comment = "Why did the chicken cross the road? Because you didn't f**king cook it";
    } else {
      comment = "For what I am about to eat, may the Lord make me truly not vomit.";
    }
    return comment;
  }
}
