class Juicer extends Kitchen {
  Juicer(int x, int y) {
    super(x, y);
    img = loadImage("Image/Juicer.png");
    efficiency = 1;
  }  
  
  double juice(Ingredients y) {
    y.reduceCookTime();
    y.setCooked();
    return y.getCookTime();
  }
}
