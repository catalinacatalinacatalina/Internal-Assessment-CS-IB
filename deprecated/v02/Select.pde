class Select{
    float x, y, w;
    boolean selected;
    String txt;

    Select(String txt, float x, float y, boolean selected, float w){
        this.txt = txt;

        this.x =  x;
        this.y = y;
        this.w = w;
        this.selected = selected;
    }

    void display(){
        pushStyle();
            fill(255,255,255,0);
            stroke(0);
            strokeWeight(1);
            rect(x,y, w, w);

            if(selected){
                strokeWeight(2);
                line(x,y, x+w, y+w);
                line(x, y+w, x+w,y);
            }

            textAlign(LEFT);
            textSize(15);
            fill(0);
            text(this.txt, x+w+ 7, y+13);
        popStyle();
    }
    

    void setSelected (boolean select){
        selected = select;
    } 
    
    boolean getSelected(){
        return selected;
    }

    boolean mouseOverSelected(){
        return (mouseX >= this.x) && 
                (mouseX<=this.x + this.w) && 
                (mouseY>= this.y) && 
                (mouseY<= this.y + this.w);
    }

}