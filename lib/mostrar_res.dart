import 'package:flutter/material.dart';
import 'list_manager.dart';
/*
*
* Con este widget llamamos a ListManager() y así
* finalmente pasar la lista con las 92 soluciones (para 8 reinas)
*
* */

class MostrarResultados extends StatelessWidget{

  final List<String> listaSoluciones = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EightQueens"),
      ),
      body: Stack(
        children: <Widget>[
          ListManager(ejecutarAlgoritmoReinas()),
        ],
      ),
    );
  }

  //Nos devuelve una lista de cadenas con las 92 soluciones halladas
  List<String> ejecutarAlgoritmoReinas(){

    List<String> soluciones;
    //Vector que representa las columnas inicialmente vacío
    List<int> ocup = new List<int>();
    resolver(ocup);
    soluciones = listaSoluciones;
    return soluciones;
  } //////////////////////////////////////////// END ejecutarAlgoritmoReinas()

  //Obtenemos las casillas disponibles sin comerse
  List<int> disponibles(List<int> ocup){

    //  Lleno la lista de columnas disponibles
    //  que inicialmente está llena
    List<int> d = new List<int>();
    for(int i=0; i<8; i++){
      d.add(i);
    }

    //Obtengo el tamaño de la lista de columnas ocupadas
    //y lo almaceno en k
    int k = ocup.length;
    eliminarDiagonales(k,ocup,d);

    //retorno la lista de columnas disponibles
    return d;
  } //////////////////////////////////////////////////////// END disponibles()

  //Eliminamos las casillas con posible colisión en diagonal
  void eliminarDiagonales(int k,List<int> ocup,List<int> d){

    //Iteramos sobre la lista de columnas ocupadas
    var j = ocup.iterator;
    while(j.moveNext()){
      int c = j.current;

      d.remove(c);   //Removemos las columnas ocupadas
      d.remove(c+k); //Removemos sumando fila mas columna
      d.remove(c-k); //Removemos restando fila menos columna
      k--;           //Avanzamos de la última columna hasta la primera
    }
  } //////////////////////////////////////////////////// END quitarDiagonales()

  void obtenerListaSoluciones(String solucion){
    listaSoluciones.add(solucion);
  }

  //Llamamos recursivamente para hayar las soluciones
  void resolver(List<int> ocup){

    //Si el número de elementos en la lista de columnas ocupadas
    //es menor que 8 quiere decir que no hemos encontrado una solución
    if(ocup.length < 8){

      List<int> d = disponibles(ocup);
      List<int> provisional = new List();


      //Iteramos sobre la lista de disponibles
      for(var c = d.iterator; c.moveNext();){

        provisional = ocup;
        provisional.add(c.current);
        resolver(provisional);

        //Regresamos a un nodo(s) anterior(es) del árbol en caso
        //de que la combinación no llegue a ninguna solución
        int last = provisional.removeLast();
        provisional.remove(last);

      }

    }else{
      //Vamos contando el número de soluciones encontradas
      //y las almacenamos en un arreglo de cadenas
      //El número de fila empieza en cero y va de 0 a 7

      var solucion = "";
      for(var j = ocup.iterator; j.moveNext();){
        solucion += j.current.toString();
      }
      obtenerListaSoluciones(solucion);
    }
  }////////////////////////////////////////////////////////// END resolver()
}

