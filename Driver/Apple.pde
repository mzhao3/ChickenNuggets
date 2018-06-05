class Apple extends Ingredients {
  Apple() {
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
