
import 'package:eight_queens/resultados.dart';
import 'package:flutter/material.dart';
/*
*
* Con este widget llamamos a la lista dentro de un Expanded()
* para mostrarla
*
* */

class ListManager extends StatefulWidget {

  final List<String> startingProduct;
  ListManager(this.startingProduct);

  @override
  State<StatefulWidget> createState() {
    return _ListManagerState();
  }
}

class _ListManagerState extends State<ListManager>{

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Container(
          margin: EdgeInsets.all(10.0),
        ),
        Expanded(
            child: Resultados(widget.startingProduct)
        ),
      ],
    );
  }
}