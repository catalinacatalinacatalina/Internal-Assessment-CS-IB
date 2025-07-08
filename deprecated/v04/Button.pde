
class Button {
  
 // Propietats d'un botó:
 float x, y, w, h;  // Posició i dimensions
 // Colors de contorn, farciment, actiu i desactiu
 color fillColor, strokeColor;
 color fillColorOver, fillColorDisabled;
 String textBoto;  // Text
 boolean enabled;  // Abilitat / desabilitat
 boolean opaco;
 int a;
 
 // Mètode Constructor
  Button(String text, float x, float y, float w, float h, boolean opaco){
   this.textBoto = text;
   this.x = x;
   this.y = y; 
   
   this.w = w;
   this.h = h;
   this.enabled = true;
   this.opaco = opaco;

   fillColor = color(blackCoral);
   fillColorOver = color(blackCoral, 200);
   fillColorDisabled = color(150);
   strokeColor = color(0,0,0,0);
 }
 
 // Setters
 
 void setEnabled(boolean b){
   this.enabled = b;
 }
 
 // Dibuixa el botó
 void display(){
   pushStyle();

      if(opaco){
        a=255;
      } else{
        a=0;
      }
      
      if(!enabled){
        fill(fillColorDisabled,a);  // Color desabilitat
      }
      else if(mouseOverButton()){
        fill(fillColorOver, a);      // Color quan ratolí a sobre
      }
      else{
        fill(fillColor, a);          // Color actiu però ratolí fora
      }
      stroke(strokeColor, a); strokeWeight(2);        //Color i gruixa del contorn
      float b=0;
      if(mouseX>hBanner){
        b=hBanner;
      }
      rect(this.x, this.y- hBanner, this.w, this.h, 10);    // Rectangle del botó
      
      
      // Text (color, alineació i mida)
      fill(255); textAlign(CENTER); textSize(20);
      text(textBoto, this.x + this.w/2, this.y + this.h/2 + 10- hBanner);
    popStyle();
 }

 
 // Indica si el cursor està sobre el botó
 boolean mouseOverButton(){
   return (mouseX >= this.x) && 
          (mouseX<=this.x + this.w) && 
          (mouseY>= this.y) && 
          (mouseY<= this.y +this.h); 
 }
/*
 void press(){
   if(mouseOverButton()&& mousePressed){
     p1();
   }
 }
 */
}
