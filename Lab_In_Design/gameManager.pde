PImage mapaLab,cafetera,valvula;
PImage Angerona;
PImage planeta,poema;
PImage proyectoAngerona;
PImage MundoCruel;

class GameManager{

  void llamar(){
  cam1=loadImage("Camara1.jpg");
cam2=loadImage("Camara2.jpg");
bosque=loadImage("Bosque.jpg"); 
cam0=loadImage("Camara0.jpg");
//Escenarios
recepcion=loadImage("Recepcion.jpg"); //0
mainHall=loadImage("PasilloEntrada.jpg"); //1
pasilloSecundario=loadImage("pasilloSec.jpg"); //2
stairs=loadImage("Escaleras_PB.png");        //3
oficina=loadImage("Oficina.jpg");         //2
twoHall=loadImage("PasilloDerecha.jpg");  //3
cleaning=loadImage("cleaning.jpg");       //4
twoLab=loadImage("escena2.jpg");          //5
stairsS=loadImage("stairsSotano.jpg");    //6.1
stairsR=loadImage("Escaleras_PA.png");      //6.2
restRoom=loadImage("Sala.png");            //7
sotano=loadImage("Sotano.png");           //9
SR=loadImage("DarkRoom.jpg");             //11
conductos=loadImage("conductos.jpg");      //Conductos

laboratorio1=loadImage("Lab1.png");
laboratorio2=loadImage("Lab2.png");
laboratorio3=loadImage("Lab3.png");
laboratorio4=loadImage("Lab4.png");
laboratorio5=loadImage("Lab5.png");
laboratorio6=loadImage("Lab6.png");

//Imagenes para los escondites
eOfi=loadImage("EscOf.jpg");
eLab=loadImage("EscLab.jpg");
eSot=loadImage("EscSot.jpg");

//////////////////
acechador = loadImage("Enemigos/Acechador.png");
merodeador = loadImage("Enemigos/Merodeador.png");
slime=loadImage("Enemigos/Slime.png");
Angerona=loadImage("Enemigos/Angerona.png");
//////////////////////Menus/////////////////////////////////////
mapaLab=loadImage("MapaLaboratorio.jpg");
//////////////////////Assets Laboratorio//////////////////////////////////////////
cafetera=loadImage("Assets/Cafetera.png");
valvula=loadImage("Assets/Valvula.png");

/////////////////////Assets Historia ///////////////////////////////
wow=loadImage("Assets/Historia/WOW.png");
Planeta=loadImage("Assets/Historia/Planeta.png");
Libro_Leyenda=loadImage("Assets/Historia/LibroLeyendaSlime.png");
cartaDoctor=loadImage("Assets/Historia/CartaAlDoctor.png");
merodeadorReporte=loadImage("Assets/Historia/ReporteMerodeador.png");
huyeTexto=loadImage("Assets/Historia/Huye.png");
acechadorTexto=loadImage("Assets/Historia/NoValeLaPena.png");
cartaDespido=loadImage("Assets/Historia/CartaDespido.png");
proyectAngerona1=loadImage("Assets/Historia/Angerona1.png");
proyectAngerona2=loadImage("Assets/Historia/Angerona2.png");
proyectAngerona3=loadImage("Assets/Historia/Angerona3.png");
cuentaEncuesta=loadImage("Assets/Historia/Cuenta.jpg");
listoEncuesta=loadImage("Assets/Historia/Listo.jpg");
silencioEncuesta=loadImage("Assets/Historia/Silencio.jpg");
cartaIl=loadImage("Assets/Historia/IlegibleCarta.png");
postIl=loadImage("Assets/Historia/PostIlegible.png");
papelIl=loadImage("Assets/Historia/Ilegible.png");
libroCerrado=loadImage("Assets/Historia/LibroCerrado.png");
postPensar=loadImage("Assets/Historia/PuedePensar.png");
postPiel=loadImage("Assets/Historia/Piel.png");
puedeVerme=loadImage("Assets/Historia/MeObserva.jpg");
mapaPlan=loadImage("Assets/Historia/MapaPlan.png");
voluntad=loadImage("Assets/Historia/Voluntad.png");
entreNosotros=loadImage("Assets/Historia/EntreNosotros.png"); 
planeta=loadImage("Assets/Planeta.png");
vecinos=loadImage("Assets/Historia/Vecinos.png"); //Escenario  11   Noche 4
progresoM=loadImage("Assets/Historia/PapelProgreso.png"); //Escenario  12   Noche  3
ordenArresto=loadImage("Assets/Historia/OrdenArresto.png"); //Escenario  14   Noche  1
poema=loadImage("Assets/Historia/Poema.jpg");
MundoCruel=loadImage("Assets/Historia/CruelMundo.png");
proyectoAngerona=loadImage("Assets/Historia/ProyectoAngerona.png");
  }
  
  void configuracion(){
  if(ActiveMenu==true)
  MM.MainMenu();
  
  if(pausa==true){
  MM.PausaMenu();
  MM.mapa();
  }
  
    if(ActiveMenu==false&&pausa==false){
      enPartida=true;
    } else {
      if(ActiveMenu==true||pausa==true){
    enPartida=false;
      }
    }
    
    if(hidden==-1&&V.conductosActivos==0&&camarasCerradas==true&&PL.enPalanca==false&&P.panelAbierto==false&&!noches.enTransicion&&!inspeccionando){
      normalSetup=true;} 
      else {
      normalSetup=false;}
  } //Fin de la funcion configuracion
  
    void reset(){
    escenario=0;
    camara=1;
    A.posAct=0;
    A.moveTime = 0;
    A.tiempoAvance=0;
    A.finality=0;
    normalSetup=true;
    cerrado=false;
    noches.tiempoNoche=0;
    S.posSlime=0;
    V.conductosActivos=0;
    PL.enPalanca=false;
    P.panelAbierto=false;
    S.espera=0;
    PL.palancaY=250;
    JS.slimeJumpscare=false;
    JS.merodeadorJumpscare=false;
    JS.acechadorJumpscare=false;
    camarasDesconectadas=false;
    lucesDesconectadas=false;
    ventilacionFallando=false;
    estres=0;
    cafe.enCafetera=false;
    cafe.granosRestantes=3;
    cafe.tiempoLlenado=0;
    cafe.cafeListo=false;
    enMapa=false;
   inspeccionando=false;
    
    } //Fin de la Funcion Reset


} // Fin de la Clase Game Manager





GameManager GM= new GameManager();
