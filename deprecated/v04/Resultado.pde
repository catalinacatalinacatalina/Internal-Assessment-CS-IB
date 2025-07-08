class Resultado{
    float x,y;
    int nPartido;

    String contrario;
    int day, month, year;

    // resultado del partido. equipos 1 y 2
    int r1;
    int r2;

    //set 1
    int s1_1;
    int s1_2;

    //set 2 
    int s2_1;
    int s2_2;
    
    //set 3
    int s3_1;
    int s3_2;

    //set 4
    int s4_1;
    int s4_2;

    //set 5
    int s5_1;
    int s5_2;

    Resultado(float x, float y, int nPartido){
        this.x = x;
        this.y = y;

        this.nPartido = nPartido;
        this.contrario = equipos[nPartido];
        
        this.day  = fecha[nPartido][0];
        this.month= fecha[nPartido][1];
        this.year = fecha[nPartido][2];
        
        this.r1 = resultados[nPartido][0];
        this.r2 = resultados[nPartido][1];
        this.s1_1 = resultados[nPartido][2];
        this.s1_2 = resultados[nPartido][3];
        this.s2_1 = resultados[nPartido][4];
        this.s2_2 = resultados[nPartido][5];
        this.s3_1 = resultados[nPartido][6];
        this.s3_2 = resultados[nPartido][7];
        this.s4_1 = resultados[nPartido][8];
        this.s4_2 = resultados[nPartido][9];
        this.s5_1 = resultados[nPartido][10];
        this.s5_2 = resultados[nPartido][11];
    }

    void display(){
        pushStyle();
            rectMode(CENTER);
            fill(150);
            rect(x, y, 400, 750, 5);
                pushStyle();
                    fill(255);
                    textFont(fuente1);
                    textSize(180);
                    textAlign(CENTER);
                    fill(redSalsa);
                    text(r1 +"-"+ r2, x-3, y-112, 380);
                    fill(255);
                    text(r1 +"-"+ r2, x, y-110, 380);
                    fill(royalBlueDark);
                    text(r1 +"-"+ r2, x+3, y-108, 380);
                    textFont(fuente2);

                    textSize(75);
                    fill(redSalsa);
                    text(contrario, x-2, y-2, 380);
                    fill(255);
                    text(contrario, x, y, 380);
                    fill(royalBlueDark);
                    text(contrario, x+2, y+2, 380);
                    
                    textFont(fuente1);
                    textSize(15);
                    fill(255);
                    text(fecha[nPartido][0] + "/"+fecha[nPartido][1]+"/"+ fecha[nPartido][2],  x, y- 350, 380);
                    textSize(12);
                    textAlign(CENTER);
                    
                    sets = s1_1+"-"+s1_2+"/"+s2_1+"-"+s2_2+"/"+s3_1+"-"+s3_2;

                    if(r1+r2>=4){
                        sets = sets + "/" + s4_1 + "-" + s4_2;
                        
                        if(r1+r2==5){
                            sets = sets + "/" + s5_1 + "-" + s5_2;
                        }
                    }
                    
                    
                    text(sets , x, y + 130, 380);
                    
                popStyle();
        popStyle();
    }
}