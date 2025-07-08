class Player{
    String name;
    String surname;
    String gender;

    String firstPos, secPos,email;
    int age, numb, telefono, year, day, month;


    Player(String name, String surname , String gender, String firstPos, String secPos, int numb, int telefono, int year, int day, int month, String email){
        this.name = name;
        this.surname = surname;
        this.age = age;
        this.gender = gender;
        
        
        this.year = year;
        this.day = day;
        this.month = month;

        this.telefono = telefono;
        this.email = email;

        this.firstPos = firstPos;
        this.secPos = secPos;
        this.numb = numb;

    }


    void display(){
        fill(0);
        cabecera();
        datosPersonales();
        datosDeportivos();
    }

    void cabecera(){
        textAlign(LEFT);
        textSize(40);
        text(this.surname+ ", "+ this.name, 200, 100);
    }


    void datosPersonales(){
        //titulo
        //falta translate con push y pop matrix
        fill(royalBlueDark, 100);
        rect (width/9, 220, 300, 400);
        fill(0);
        pushStyle();
        textSize(25);
        text("Datos personales y de contacto: " , width/10, 200);
        popStyle();
        textSize(18);
        text("Fecha de nacimiento: " + this.day + "/" + this.month + "/" +this.year, 150, 250);
        text("Telefono personal: " + this.telefono, 150, 300);
        text("Correo electrónico: " + this.email, 150, 350);


    }

    void datosDeportivos(){
        //rect!!
        pushStyle();
        
        textSize(25);
        text("Datos deportivos: ", 3*width/5, 200);
        popStyle();
        textSize(15);
        text("Número dorsal: "    + this.numb, 3*width/5+100, 400);
        text("Primera posición: " + this.firstPos, 3*width/5+100, 500);
        text("Segunda posición: " + this.secPos, 3* width/5+100, 600);
    }
}