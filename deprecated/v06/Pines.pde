class Pines {
 
  // Propietades de la Pizarra
  float x, y, w, h, xPin1, xPin2;
 
  // Arrays de Pins
  Pin[] pins1, pins2;
 
  // Constructor
  Pines(float x, float y, float w, float h,  float xPin1, float  xPin2){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.xPin1= xPin1;
    this.xPin2 = xPin2;
    
    // Crea 5 pins (Equipo 1)
    pins1 = new Pin[6];
    String txt;
    for(int i=0; i<pins1.length; i++){
      if(i<4){
          txt = (i+1)+"";
          pins1[i] = new Pin( xPin1  , y + 80*i, 30, txt, color(blackCoral), true);
      } else if(i==4){
          txt = "C";
          pins1[i] = new Pin( xPin1, y + 80*i, 30, txt, color(prussianBlue), true);
      } else if(i>4){
          txt = "L";
          pins1[i] = new Pin( xPin1 , y + 80*i, 30, txt, color(redSalsa), true);
      }
    }
 
 
   
    // Crea 5 pins (Equipo 2)
    pins2 = new Pin[6];
    for(int i=0; i<pins2.length; i++){
       if(i<4){
          txt = (i+1)+"";
          pins2[i] = new Pin( xPin2 , y + 80*i, 30, txt, color(ming), true);
      } else if(i==4){
          txt = "C";
          pins2[i] = new Pin( xPin2 , y + 80*i, 30, txt, color(royalBlueDark), true);
      } else if(i>4){
          txt = "L";
          pins2[i] = new Pin( xPin2 , y + 80*i, 30, txt, color(celadonBlue), true);
          }
       txt = (i+1)+"";
    }
  }
 
  // Resetea la posición de todos los Pins
  void resetPinPositions(){
    for(int i=0; i<pins2.length; i++){
      pins1[i].setPosition( 100 , y + 80*i);
      pins2[i].setPosition( width-100 , y+ 80*i);
    }
  }
 
  // Dibuja los Pins
  void displayPins1(){
    for(Pin p : pins1){
      p.display();
    }
   
  }
 
  void displayPins2(){
    for(Pin p : pins2){
      p.display();
    }
  }
   
 
  // Comprueba si el cursor está sobre la Pizarra
  boolean mouseOver(){
    return mouseX >= this.x && mouseX <= this.x + this.w &&
           mouseY >= this.y && mouseY <= this.y + this.h && 
           mousePressed ;
  }
 
  // Comprueba si es necesario mover algún pin
  void checkPinsMotion(){
    if(mousePressed){
     
      // Comprueba los pins del equipo 1
      for(Pin p : pins1){
        if(p.mouseOver()){
          p.setPosition(mouseX, mouseY);
          break;
        }
      }
     
      // Comprueba los pins del equipo 2
      for(Pin p : pins2){
        if(p.mouseOver()){
          p.setPosition(mouseX, mouseY);
          break;
        }
      } 
    }
  }
}