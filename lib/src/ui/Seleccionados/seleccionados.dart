import 'package:btn_colores/src/bloc/select/select_bloc.dart';
import 'package:btn_colores/src/bloc/select/select_event.dart';
import 'package:btn_colores/src/models/item_model_select.dart';

import 'package:flutter/material.dart';

class Seleccionados extends StatefulWidget {
  const Seleccionados({ Key? key }) : super(key: key);

  @override
  _SeleccionadosState createState() => _SeleccionadosState();
}

class _SeleccionadosState extends State<Seleccionados> {
  SelectBloc _selectBloc = SelectBloc();
  @override
  void initState() {
    super.initState();
    _selectBloc.sendEvent.add(GetSelectEvent());
  }

  @override
  void dispose() {
    _selectBloc.dispose();
    super.dispose();
  }
  _construirLista(AsyncSnapshot<List<ItemModel>> lista){
    return ListView.builder(
      itemCount: lista.data!.length,
      shrinkWrap: true,
      itemBuilder:(BuildContext context, int i){
        return Text(lista.data![i].item);
      }
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder<List<ItemModel>>(
          initialData: [],
          stream: _selectBloc.selectStream,
          builder: (context, snapshot) {
            return _construirLista(snapshot);
          }),
              
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_back_sharp),
          onPressed: (){Navigator.of(context).pop();},  
        ),
      ),
    );
  }
}