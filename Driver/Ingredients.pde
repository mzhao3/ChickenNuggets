abstract class Ingredients {
    boolean isCooked, isBurned;
    float cookTime;
    float xPos, yPos;
    
    abstract void display();
    
    boolean setCooked() {
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