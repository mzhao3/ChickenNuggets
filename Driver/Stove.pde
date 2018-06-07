class Stove extends Kitchen {

  Stove(int x, int y) {
    super(x, y);
    img = loadImage("Image/stove.png");
    efficiency = 1;
  }



  double cook(Ingredients y) {
    y.reduceCookTime();
    y.setCooked();
    return y.getCookTime();
  }
}
