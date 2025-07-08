class Guardado{

    //declaración de parámetros
    PImage img;
    String titulo;
    int day, month, year;
    float x, y, w, h;

    //método constructor
    Guardado(PImage img,String titulo, int day, int month, int year){
        
        this.day = day; 
        this.month = month;
        this.year = year;
        this.titulo = titulo;
        this.x = 0;
        this.y = 0;
        this.img = img;
        w = 350;
        h = 250;

    }
    //setter posición
    void setXY(float a, float b){
        x = a;
        y = b;
    }

    //método dibujar
    void display(){
        pushStyle();
            fill(150);
            stroke(1);
            rect(x,y, w, h, 5);
            image(img, x+10,y+10, w- 20, h-50);
                //println(i+" "+j);
            textSize(20);
            fill(0);
            textAlign(LEFT);
            text(this.titulo, x+10, y+h-20);
            textSize(10);
            text(this.day +"/"+this.month+"/"+this.year, x+ 15, y+h-10); 
        popStyle();
    }


}