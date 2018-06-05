abstract class Ingredients {
    boolean isCooked, isBurned;
    double cookTime;
    double xPos, yPos;
    
    //abstract void display(); will implement later because don't know where you guy want it
    abstract void setCookTime(double newCookTime);
    abstract double getCookTime();
    
    void setCooked() {
      if (cookTime <= -50) {
        isBurned = true;
      } else if (cookTime <= 0) {
        isCooked = true;
      }
    }
    
    void reduceCookTime() {
      cookTime -= 1;
    }
    
}
