class ListaPaginada{
    Resultado[] r;
    RoundButton bPrev, bNext;
    int currentRes=0;
    int numRes =0;
    int numResVisibles = 3;
    float x, y, w, h;

    ListaPaginada(Resultado[] r, float x, float y, float w, float h){
        this.r = r;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }

    void display(){
        /*
        if(currentRes==0){
            for(int i=0;i<numResVisibles; i++){
                r[i].display();
            }
        } else if (currentRes==1){
            for(int i=3;i<numResVisibles+3; i++){
                r[i].display();
            }
        } else if (currentRes==2){
            for(int i=6;i<numResVisibles+2*3; i++){
                r[i].display();
            }
        }
        */

        for(int i=currentRes*numResVisibles;i<numResVisibles+currentRes*numResVisibles; i++){
            if(r[i] != null){
                r[i].display();
            }
        }
        
        if(currentRes*numResVisibles>r.length){
            next.setEnabled(false);
        } else{
            next.setEnabled(true);
        }
        //bPrev.display();
        //bNext.display();
    }

    void setButtons(String img1, String img2) {
        PImage imgPrev = loadImage(img1);
        bPrev = new RoundButton(imgPrev, x, y + h/2, 30);

        PImage imgNext = loadImage(img2);
        bNext = new RoundButton(imgNext, x + w + 30, y + h/2, 30);
    }

    void next() {
        this.currentRes++;
        //falta hacer algun if para no exceder las casillas del array
    }

    void prev() {
        this.currentRes--;
    }
}

