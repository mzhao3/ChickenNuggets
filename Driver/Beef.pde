class Beef extends Ingredients {
  Beef() {
    isCooked = false;
    isBurned = false;
    cookTime = 5.0;
  }
 
   void setCookTime(double newCookTime) {
     cookTime = newCookTime;
   }
   
   double getCookTime() {
     return cookTime;
   }
}
