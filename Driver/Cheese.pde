class Cheese extends Ingredients {
  Cheese() {
    isCooked = false;
    isBurned = false;
    cookTime = 3.0;
  }
 
   void setCookTime(double newCookTime) {
     cookTime = newCookTime;
   }
   
   double getCookTime() {
     return cookTime;
   }
   
  
}
