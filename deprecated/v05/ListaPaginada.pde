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
        //set positions
        for(int i=0; i<numResVisibles; i++){
            r[i].setX(((i+0.5)*width)/(numResVisibles));
        }

        for (int i=numResVisibles+1, k = 0; i<2*numResVisibles+2 && i<r.length; i++, k++){
            r[i].setX(((k+0.5)*width)/numResVisibles);
        }

        //display results
        for(int i=currentRes*numResVisibles;i<numResVisibles+currentRes; i++){
            if(r[i] != null){
                r[i].display();
            }
        }
        

        // enable & disenable buttons
        // to avoid index out of bounds
        if(currentRes*numResVisibles>r.length){
            next.setEnabled(false);
        } else{
            next.setEnabled(true);
        }
        if(currentRes*numResVisibles==0){
            prev.setEnabled(false);
        } else{
            prev.setEnabled(true);
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

    void next() { this.currentRes++;}
    void prev() { this.currentRes--;}
}
