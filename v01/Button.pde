
class Button {
  
 // Propietats d'un botó:
 float x, y, w, h;  // Posició i dimensions
 // Colors de contorn, farciment, actiu i desactiu
 color fillColor, strokeColor;
 color fillColorOver, fillColorDisabled;
 String textBoto;  // Text
 boolean enabled;  // Abilitat / desabilitat
 boolean transparency;
 int a;
 
 // Mètode Constructor
 Button(String text, float x, float y, float w, float h, boolean transparencia){
   this.textBoto = text;
   this.x = x;
   this.y = y; 
   
   
   this.w = w;
   this.h = h;
   this.enabled = true;
   fillColor = color(prussianBlue);
   fillColorOver = color(prussianBlue);
   fillColorDisabled = color(150);
   strokeColor = color(0,0,0,0);
   this.transparency = transparencia;
 }
 
 // Setters
 
 void setEnabled(boolean b){
   this.enabled = b;
 }
 
 // Dibuixa el botó
 void display(){
   
   if(transparency){
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
   rect(this.x, this.y, this.w, this.h, 10);    // Rectangle del botó
   
   
   // Text (color, alineació i mida)
   fill(0); textAlign(CENTER); textSize(20);
   text(textBoto, this.x + this.w/2, this.y + this.h/2 + 10);
 }
 
 // Indica si el cursor està sobre el botó
 boolean mouseOverButton(){
   return (mouseX >= this.x) && 
          (mouseX<=this.x + this.w) && 
          (mouseY>= this.y) && 
          (mouseY<= this.y + this.h); 
 }
  
}
