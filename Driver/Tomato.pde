class Tomato extends Ingredients {
   Tomato() {
    isCooked = false;
    isBurned = false;
    cookTime = 1.0;
  }
 
   void setCookTime(double newCookTime) {
     cookTime = newCookTime;
   }
   
   double getCookTime() {
     return cookTime;
   }
}
