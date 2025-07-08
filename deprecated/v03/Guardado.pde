class Guardado{

    PImage img;
    String titulo;
    int day, month, year;
    float x, y, w, h;


    Guardado(PImage img,String titulo, int day, int month, int year,float x, float y, float w, float h){
        
        this.day = day; 
        this.month = month;
        this.year = year;
        this.titulo = titulo;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.img = img;

    }

    void display(){
        fill(150);
        stroke(1);
        rect(x,y, w, h, 5);
        image(img, x+10,y+10);
            //println(i+" "+j);
        text(this.titulo, x+ 15, y+h-20);
        text(this.day +"/"+this.month+"/"+this.year, x+ 15, y+h-10); 
    }


}