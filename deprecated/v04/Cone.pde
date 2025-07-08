class Cone{
    float x = width-45;
    float y = height - hBanner - 70;
    
    Cone(float x, float y){
        this.x = x;
        this.y = y;
    }

    void setPosition(float x, float y){
        this.x = x;
        this.y = y;
    }
    void display(){
    pushStyle();
        image(cono, x, y, 35, 45);
    popStyle();
    }

    boolean mouseOverCono(){
        return (mouseX >= this.x) && 
          (mouseX<=this.x + 35) && 
          (mouseY>= this.y) && 
          (mouseY<= this.y + 45); 
    }
}