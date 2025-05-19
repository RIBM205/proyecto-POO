PImage mapaLab,cafetera,valvula;
PImage Angerona;
PImage planeta,poema;
PImage proyectoAngerona;
PImage MundoCruel;
PImage mapaCam,noCam;
PImage fondo;
PImage saco,humo,tacha,vasoV,tazaV,tazaL,vasoML,vasoL,palancaU,palancaD;
PImage menuP;
PImage vents;
PImage logoJ;
PImage reloj,iluminar,fuego,escondido;
PImage creditos,ventil;

class GameManager{

  void llamar(){
cam0=loadImage("Cam0.png");
cam1=loadImage("Cam1.png");
cam2=loadImage("Cam2.png");
cam3=loadImage("Cam3.png");
cam4=loadImage("Cam4.png");
cam5=loadImage("Cam5.png");
cam6=loadImage("Cam6.png");
cam7=loadImage("Cam7.png");
cam8=loadImage("Cam8.png");
cam9=loadImage("Cam9.png");
cam10=loadImage("Cam10.jpg");
cam11=loadImage("Cam11.png");
cam12=loadImage("Cam12.png");
noCam=loadImage("noCams.jpg");
mapaCam=loadImage("MapaCamaras.png");
//Escenarios
recepcion=loadImage("Recepcion.png"); //0
mainHall=loadImage("PasilloEntrada.jpg"); //1
pasilloSecundario=loadImage("pasilloSec.png"); //2
stairs=loadImage("EscalerasPB.png");        //3
oficina=loadImage("SalaMandos.png");         //2
twoHall=loadImage("PasilloDerecha.jpg");  //3
cleaning=loadImage("cleaning.png");       //4
twoLab=loadImage("escena2.jpg");          //5
stairsS=loadImage("EscalerasSotano.png");    //6.1
stairsR=loadImage("Escaleras_PA.png");      //6.2
restRoom=loadImage("Sala.png");            //7
sotano=loadImage("Sotano.png");           //9
SR=loadImage("DarkRoom.jpg");             //11
conductos=loadImage("Ventilacion.png");      //Conductos

laboratorio1=loadImage("Lab1.png");
laboratorio2=loadImage("Lab2.png");
laboratorio3=loadImage("Lab3.png");
laboratorio4=loadImage("Lab4.png");
laboratorio5=loadImage("Lab5.png");
laboratorio6=loadImage("Lab6.png");
escondido=loadImage("Escondido.jpg");


//////////////////
acechador = loadImage("Enemigos/Acechador.png");
merodeador = loadImage("Enemigos/Merodeador.png");
slime=loadImage("Enemigos/Slime.png");
Angerona=loadImage("Enemigos/Angerona.png");
//////////////////////Menus/////////////////////////////////////
mapaLab=loadImage("MapaLaboratorio.jpg");
menuP=loadImage("Menu.png");
logoJ=loadImage("Logo.png");
creditos=loadImage("Creditos.jpg");
//////////////////////Assets Laboratorio//////////////////////////////////////////
ventil=loadImage("Assets/ventilaciones.png");
cafetera=loadImage("Assets/Cafetera.png");
valvula=loadImage("Assets/Valvula.png");
fondo=loadImage("Blur.png");
saco=loadImage("Assets/SacoDeGranos.png");
humo=loadImage("Assets/Humo.png");
tacha=loadImage("Assets/cruz.png");
tazaV=loadImage("Assets/Taza_vacia.png");
tazaL=loadImage("Assets/Taza_llena.png");
palancaD=loadImage("Assets/Palanca_down.png");
palancaU=loadImage("Assets/Palanca_up.png");
vents=loadImage("Assets/Ventilacion_abierta.png");
vasoL=loadImage("Assets/VasoLleno.png");
vasoML=loadImage("Assets/VasoMedio.png");
vasoV=loadImage("Assets/VasoVacio.png");
iluminar=loadImage("Assets/Iluminar.png");
fuego=loadImage("Assets/Fuego.png");
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
reloj=loadImage("Assets/Historia/RelojDetenido.png");
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
    
    if(hidden==-1&&
    ventilaciones[0].conductosActivos == 0 &&
    ventilaciones[1].conductosActivos == 0 &&
    ventilaciones[2].conductosActivos == 0 &&
    ventilaciones[3].conductosActivos == 0 &&
    camarasCerradas==true&&PL.enPalanca==false&&!noches.enTransicion&&!inspeccionando&&!VLV.enMinijuego
      &&!cafe.enCafetera
      &&!cable.enPanel)
      {
      normalSetup=true;} 
      else {
      normalSetup=false;}
  } //Fin de la funcion configuracion
  
    void reset(){
    camarasCerradas=true;
    hidden=-1;
    escenario=0;
    camara=1;
    A.posAct=0;
    A.moveTime = 0;
    A.tiempoAvance=0;
    A.finality=0;
    normalSetup=true;

    
    S.posSlime=0;
    
    for (int i = 0; i < ventilaciones.length; i++) {
    ventilaciones[i].conductosActivos = 0;
    ventilaciones[i].cerrado = false;
  }
    PL.enPalanca=false;
 
    S.espera=0;
    PL.palancaY=250;
    PL.bajando=false;
    PL.activada=false;
    PL.tiempoActivada=0;
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
    cafe.llenando=false;
    enMapa=false;
   inspeccionando=false;
   camarasDesconectadas=false;
   lucesDesconectadas=false;
   ventilacionFallando=false;
   EST.tiempoComprobacion=0;
   EST.contadorCooldown=0;
   EST.coolDown=false;
   VLV.enMinijuego=false;
   VLV.angulo=0;
   LabStory.alucinando=false;
   M.nodoActual=12;
   M.movimiento=0;
   JS.tiempoJumpscare=0;
   M.finality=0;
   M.delay=0;
   M.enPersecucion=false;
   M.jugadorHuyo=false;
   //cable.enPanel = false; 
   //cable.reiniciarConexiones();
   
    
    } //Fin de la Funcion Reset


} // Fin de la Clase Game Manager





GameManager GM= new GameManager();
