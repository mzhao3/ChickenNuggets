class Stove extends Kitchen {
  
  Stove() {
    cookBoost = 0;
    tipBoost = 5;
    price = 100;
  }


  void improveStats() {
    cookBoost += 5;
    tipBoost += 5;
    price += 100; 
    
  }
}
