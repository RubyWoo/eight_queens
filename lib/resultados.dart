import 'package:flutter/material.dart';
/*
*
* Con este widget construimos los ITEMS de la LISTA
* Le pasamos una variable lista de tipo cadena
*
*
* */
class Resultados extends StatefulWidget { //CLASE DEL WIDGET

  Resultados(this.products);
  final List<String> products;

  @override
  State<StatefulWidget> createState() {
    return  _ResultadosState();
  } //Variable Type Function
}

class _ResultadosState extends State<Resultados>{ //CLASE DEL ESTADO

  //Función para refrescar la lista
  Future<Null> refreshList() async{
    await Future.delayed(Duration(seconds: 1));
    setState((){
      // ignore: unnecessary_statements
      widget.products;
    });
    return null;
  } /////////////////////////////////////////////////////// END _refreshList()

  //Función que construye las cards
  Widget _buildItem(BuildContext context, int index){

    return Container(
      margin: EdgeInsets.only(left: 9.0, right: 9.0, top:5.0),
      width: 175.0,
      height: 135.0,
      child: Card(
        //color: Colors.white,
        child: Column(
          children: <Widget>[
            Text(
              "Solución" +(index+1).toString(),
              style: TextStyle(
                  //color: Colors.black,
                  fontSize: 16.0),
            ),
            Text(
              widget.products[index],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  } //////////////////////////////////////////////////////////END _buildItem()

  //Función que construye la lista con ListView.builder()
  Widget _buildList() {
    Widget listCards;
    if (widget.products.length > 0) {
      listCards = RefreshIndicator(
        child:ListView.builder(
            itemCount: widget.products.length,
            itemBuilder: _buildItem
        ),
        onRefresh: refreshList,
      );
    } else {
      listCards = Center(
        child:Container(
          width: 330.0,
          height: 387.0,
          child: Center(
              child: Text(
                "Obteniendo las soluciones...",
                style: TextStyle(
                    //color: Colors.white,
                    fontSize: 20.0
                ),
              )
          ),
        ),
      );
    }
    return listCards;
  } ///////////////////////////////////////////////////////// END _buildList()

  @override
  Widget build(BuildContext context) {
    return _buildList();
  }
}