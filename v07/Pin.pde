class Pin {
 
  // Propietades de un Pin
  float x, y, r;
  String txt;
  color c;
  boolean enabled;
  
  // Constructor
  Pin(float x, float y, float r, String t, color c, boolean enabled){
    this.x = x;
    this.y = y;
    this.r = r;
    this.txt = t;
    this.c = c;
    this.enabled = enabled;
  }
  
  
  // Setter de posición
  void setPosition(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  // Dibuja el Pin
  void display(){
    pushStyle();
      stroke(0); strokeWeight(3); fill(c);
      ellipse(x, y-hBanner, 2*r, 2*r);
      fill(255); textAlign(CENTER); textSize(r);
      text(txt, x, y-hBanner + r/4);
    popStyle();
  }
  
  // Indica si el cursor está sobre el Pin
  boolean mouseOver(){
    return dist(mouseX, mouseY, this.x, this.y)<=this.r;
  }

  //Setter habilitado
  void setEnability (boolean enab){
    this.enabled = enab;
  }

  // Getter habilitado
  boolean getEnabled(){
    return enabled;
  }
}
