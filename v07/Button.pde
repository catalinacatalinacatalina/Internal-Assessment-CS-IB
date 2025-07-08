
class Button {
  
 // Propiedades
 float x, y, w, h;  // Posición y dimensiones
 // Colores de contorno, de relleno...
 color fillColor, strokeColor;
 color fillColorOver, fillColorDisabled;
 String textBoton;  // Texto del botón
 boolean enabled;  // Habilitado o deshabilitado
 boolean opaco;    // Opaco o transparente
 int a;
 
 // Método Constructor
  Button(String text, float x, float y, float w, float h, boolean opaco){
   this.textBoton = text;
   this.x = x;
   this.y = y; 
   
   this.w = w;
   this.h = h;
   this.enabled = true;
   this.opaco = opaco;

   fillColor = color(blackCoral);
   fillColorOver = color(blackCoral, 200);
   fillColorDisabled = color(50, 80, 100);
   strokeColor = color(0,0,0,0);
 }
 
 // Setters varios
 void setEnabled(boolean b){
   this.enabled = b;
 }
 boolean enability(){
   return enabled;
 }
 
 // Dibuja el botón
 void display(){
   pushStyle();

      if(opaco){
        a=255;
      } else{
        a=0;
      }
      
      if(!enabled){
        fill(fillColorDisabled,a);   // Color deshabilitado
      }
      else if(mouseOverButton()){
        fill(fillColorOver, a);      // Color cuando se ubica el ratón encima
      }
      else{
        fill(fillColor, a);          // Color botón activo pero sin el ratón encima
      }
      stroke(strokeColor, a); strokeWeight(2);        //Color y grosor del contorno
      float b=0;
      if(mouseX>hBanner){
        b=hBanner;
      }
      rect(this.x, this.y- hBanner, this.w, this.h, 10);    // Rectangulo del botón
      
      
      // Parámetros estéticos del texto
      fill(255); textAlign(CENTER); textSize(20);
      text(textBoton, this.x + this.w/2, this.y + this.h/2 + 10- hBanner);
    popStyle();
 }

 
 // Indica si el cursor esta sobre el botón
 boolean mouseOverButton(){
   return (mouseX >= this.x) && 
          (mouseX<=this.x + this.w) && 
          (mouseY>= this.y) && 
          (mouseY<= this.y +this.h); 
 }
}
