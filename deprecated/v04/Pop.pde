class Pop{

    String type;
    boolean d;

    Pop(String type, boolean d){
        this.type=type;
        this.d = d;
    }

    void display(){
        if(d){
            rectMode(CENTER);
            fill(blackCoral, 200);
            noStroke();
            rect(width/2, (height- hBanner)/2, 3*width/4, 3*height/4);
            textAlign(CENTER);
            text("" + type, width/2, height/2);
            textAlign(LEFT);

            if (type == "New player"){
                campo("Nombre: ", width/3, height/2 -100);
                campo("Apellidos: ", width/3, height/2-50);       
                campo("Fecha de nacimiento: ", width/3, height/2-25);
                campo("Edad: ", width/3, height/2);      

            }
            
            if (type == "Save"){

            }
            
            close.display();

            
        }
        
    }

    String getType(){
        return type;
    }

    void setType(String t){
        type = t;
    }

    boolean getDisplay(){
        return d;
    }

    void setDisp(boolean disp){
        d = disp;
    }

}