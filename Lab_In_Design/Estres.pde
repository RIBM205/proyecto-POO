    float estres,aumentoEstres;
    boolean camarasDesconectadas,lucesDesconectadas,ventilacionFallando;
    
class Estres{

    int probabilidadFallo;
    float tiempoComprobacion;
    int tiempoMaximo=1200;
    
    boolean coolDown;
    int tiempoCooldown=6000;
    int contadorCooldown;
    
    void aumentar(){
    if(cerrado==true){
      estres+=aumentoEstres;
      }
     
     
      
    }
    
    void dificultad(){
      if (estres >= 90) {
        probabilidadFallo = 70;
        
      } else if (estres >= 70) {
        probabilidadFallo = 50;
        
      } else if (estres >= 50) {
        probabilidadFallo = 20;
        
      } else if (estres >= 20) {
        probabilidadFallo = 10;
        
      } else {
        probabilidadFallo = 0;
      }
      
    if(enPartida){
      tiempoComprobacion++;
      
      if(coolDown){
        contadorCooldown++;
      }
      
      if(contadorCooldown>=tiempoCooldown){
        coolDown=false;
        contadorCooldown=0;
      }
     
     if(tiempoComprobacion>=tiempoMaximo && !coolDown){
       int fallo=(int(random(100)));
       println("Probabilidad de Fallo  "+fallo);
       
       if(fallo<probabilidadFallo){
         int sistemaFallo=int(random(3));
         println("Fallo El Sistema  "+sistemaFallo);
           switch(sistemaFallo){
             case 0: camarasDesconectadas=true;
             break;
             case 1: lucesDesconectadas=true;
             break;
             case 2: ventilacionFallando=true;
             break;
           } //Fin del Switch
           coolDown=true;
         }
         tiempoComprobacion=0;
       }  
     }  
    } 
      
    
    
    

}
Estres EST= new Estres();

class Cafe{
boolean enCafetera;
float cafeX,cafeY;
float  granosX,granosY;
int granosRestantes;
boolean llenando;
float tiempoLlenado;
boolean cafeListo;
float tazaX,tazaY;
float bolsaX,bolsaY;

  void dibujar(){
    if(enCafetera==false){
    image(cafetera,cafeX,cafeY,300,200);
    } else {
    image(cafetera,width/4,height/3,700,500);
    fill(#794831);
    
    if(granosRestantes>0)
    square(granosX,granosY,50);
      
      if(llenando){
         fill(#4DBF63);
         } else {
         fill(#F24245);
         }
         circle(width/2,height/1.8,25);
    }
  
  }
    void llenar(){
    
      if(llenando&&granosRestantes>=0){ 
         if(escenario==6){
      noStroke();
      fill(#EA6C32);
       rect(width/3,height/1.2,400,25);
      } 
       tiempoLlenado++;
       
       }
      
      if(tiempoLlenado>=300){
      llenando=false;
       tiempoLlenado=0;
       cafeListo=true;
      } 
      
   
    }
   void tomarCafe(){
     if(cafeListo){
       fill(#E5DEDE);
       square(tazaX,tazaY,50);
     }
   } 
   
   void recogerGranos(){
       noStroke();
       fill(#CEC3BF);
       rect(bolsaX,bolsaY,100,400);
       
       
   }
    
    Cafe(){
      cafeX=width*4;
      cafeY=height*3;
      
      granosRestantes=3;
      
      granosX=width*8;
      granosY=height*5;
      
      tazaX=width*8.5;
      tazaY=height*5;
      
      bolsaX=width*5;
      bolsaY=height*6;
    }
}


Cafe cafe=new Cafe();
