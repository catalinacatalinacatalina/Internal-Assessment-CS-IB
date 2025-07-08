class Cone{
    //declaraciones de parámetros
    float x = width-45;
    float y = height - hBanner - 70;

    //método constructor
    Cone(float x, float y){
        this.x = x;
        this.y = y;
    }

    //setter posición
    void setPosition(float x, float y){
        this.x = x;
        this.y = y;
    }
    //método dibujar
    void display(){
        pushStyle();
            image(cono, x, y, 35, 45);
        popStyle();
    }

    //getter para saber si el ratón está encima del cono
    boolean mouseOverCono(){
        return (mouseX >= this.x) && 
          (mouseX<=this.x + 35) && 
          (mouseY>= this.y) && 
          (mouseY<= this.y + 45); 
    }
}