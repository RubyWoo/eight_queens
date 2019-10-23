
import 'package:flutter/material.dart';


/*  Se trabajó con un algoritmo encontrado en la red:
 *  https://www.academia.edu/19625941/ALGORITMO_8_REINAS_recursividad
 *  El código está hecho en Java por lo que se transcribió a Dart
 *
 *
 * PLANTEAMIENTO:
//  En primer lugar debemos buscar una notación para poder
//  representar la posición de las reinas en el tablero.
//  Vamos a utilizar una lista(un vector) para denotar la
//  posición de las reinas.
//  Cada componente hace referencia a una COLUMNA del tablero
//  y el valor de la componente nos indica la FILA en la que
//  se encuentra la reina en esa columna.
//
// VECTOR OCUP = [VALOR DE FILAS] y TAMAÑO(OCUP) = NÚMERO COLUMNAS

SE UTILIZA UNA FORMA RECURSIVA PARA TENER UNA ESTRUCTURA
DE DATOS COMO UN TIPO ÁRBOL.
*/

class MyHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EightQueens"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Aplicación que resuelve para un tablero de 8x8',
            ),
            RaisedButton(
              child: Text(
              "Pulsa para iniciar"
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/mostrarResultados');
              },
            ),
          ],
        ),
      ),
    );
  }
}

