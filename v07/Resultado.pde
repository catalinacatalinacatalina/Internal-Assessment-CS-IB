class Resultado{
    float x,y;
    int nPartido;

    String contrario;
    String fecha;
    String tipo;

    // resultado del partido. equipos 1 y 2
    String r1;
    String r2;

    //set 1
    String s1_1;
    String s1_2;

    //set 2 
    String s2_1;
    String s2_2;
    
    //set 3
    String s3_1;
    String s3_2;

    //set 4
    String s4_1;
    String s4_2;

    //set 5
    String s5_1;
    String s5_2;

    Resultado(float x, float y, int nPartido){
        this.x = x;
        this.y = y;

        this.nPartido = nPartido;
        this.contrario = infoPartido[nPartido][3];
        this.tipo = infoPartido[nPartido][2];
        this.fecha  = formataFechaEsp(infoPartido[nPartido][1]);
        
        this.r1 = infoPartido[nPartido][5];
        this.r2 = infoPartido[nPartido][6];

        this.s1_1 = infoPartido[nPartido][7];
        this.s1_2 = infoPartido[nPartido][8];
        this.s2_1 = infoPartido[nPartido][9];
        this.s2_2 = infoPartido[nPartido][10];
        this.s3_1 = infoPartido[nPartido][11];
        this.s3_2 = infoPartido[nPartido][12];
        this.s4_1 = infoPartido[nPartido][13];
        this.s4_2 = infoPartido[nPartido][14];
        this.s5_1 = infoPartido[nPartido][15];
        this.s5_2 = infoPartido[nPartido][16];
    }
	


    void setX (float x){
        this.x = x;
    }

    void setY (float y){
        this.y = y;
    }

    void checkContrario(){
        if(infoPartido[nPartido][4]!=infoPartido[4][4] ){
            this.contrario = infoPartido[nPartido][4];
        } else{
            this.contrario = infoPartido[nPartido][3];
        }
    }

    void display(){
        checkContrario();
        pushStyle();
            rectMode(CENTER);
            fill(150);
            rect(x, y, 450, 800, 5);
                pushStyle();
                    fill(255);
                    textFont(fuente1);
                    textSize(180);
                    textAlign(CENTER);
                    fill(redSalsa);

                    //resultado principal
                    text(r1 +"-"+ r2, x-3, y-112, 380);
                    fill(255);
                    text(r1 +"-"+ r2, x, y-110, 380);
                    fill(royalBlueDark);
                    text(r1 +"-"+ r2, x+3, y-108, 380);
                    textFont(fuente2);

                    textSize(75);
                    fill(redSalsa);
                    
                    text(contrario, x-2, y+ 40-2, 500, 300);
                    fill(255);
                    text(contrario, x, y+ 40, 500, 300);
                    fill(royalBlueDark);
                    text(contrario, x+2, y+ 40+2, 500, 300);
                    textSize(15);
                    fill(255);
                    text(tipo, x,y+ 300, 500, 300);
                    
                    textFont(fuente1);
                    textSize(15);
                    fill(255);
                    text(fecha,  x, y- 350, 380);
                    textSize(12);
                    textAlign(CENTER);
                    
                    // Encadenamiento de sets en funcion del numero de sets:
                    sets = s1_1+"-"+s1_2+"/"+s2_1+"-"+s2_2+"/"+s3_1+"-"+s3_2;

                    if(s4_1 != null && s4_2 != null){
                        sets += "/"+s4_1+"-"+s4_2;
                        if(s5_1 != null && s5_2 != null){
                            sets += "/"+s5_1+"-"+s5_2;
                        }
                    }
                    
                    text(sets , x, y + 130, 380);
                popStyle();
        popStyle();
    }
}