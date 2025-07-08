class Player{
    // Declaración de datos 
    String name;

    String firstPos, secPos;
    int age, numb, year, day, month;

    //Método constructor
    Player(String name, String firstPos, String secPos, int numb, int year, int day, int month){
        this.name = name;

        this.year = year;
        this.day = day;
        this.month = month;

        this.firstPos = firstPos;
        this.secPos = secPos;
        this.numb = numb;
    }


    void display(){
        textAlign(LEFT);

        pushStyle();
          image(usuario, 130, 70, 50, 50);
          logoDrawing(450, 102.0, 70, this.name, redSalsa, royalBlueDark);
        popStyle();

        textSize(15); fill(0);

        pushStyle();
          textFont(fuente1);
          fill(blackCoral);
          textSize(30);
          
          text("Fecha de nacimiento: "+ this.day+ "/"+ this.month+"/"+this.year, 300, 300);
          text("Número dorsal: "+ this.numb, 300, 400);
          text("Primera posición: " +this.firstPos, 300, 500);
          text("Segunda posición: " + this.secPos,  900, 500);
        popStyle();
    }

   
    String getName(){
        return this.name;
    }
}