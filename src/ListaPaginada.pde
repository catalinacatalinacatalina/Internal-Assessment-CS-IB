class ListaPaginada{
    //declaración de variables a usar
    Resultado[] r;
    int currentRes=0;
    int numRes;
    int numResVisibles = 3;
    float x, y, w, h;

    //método constructor
    ListaPaginada(Resultado[] r, float x, float y, float w, float h){
        this.r = r;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        numRes = r.length;
    }

    // método para dibujar la lista
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
        
        // Activar y desactivar botones
        // para evitar un error index out of bounds
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
    }

    //métodos para pasar de página en la lista
    void next() { this.currentRes++;}
    void prev() { this.currentRes--;}
}
