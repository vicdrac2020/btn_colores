import 'package:btn_colores/src/bloc/select/select_bloc.dart';
import 'package:btn_colores/src/bloc/select/select_event.dart';
import 'package:btn_colores/src/models/item_model_select.dart';
import 'package:flutter/material.dart';
//import 'package:multi_select_item/multi_select_item.dart';

class Deportes extends StatefulWidget {
  const Deportes({ Key? key }) : super(key: key);

  @override
  _DeportesState createState() => _DeportesState();
}

class _DeportesState extends State<Deportes> {
  SelectBloc _selectBloc = SelectBloc();
  bool _status  = true;
  //List<Map<String, dynamic>> stats = [];
  List<ItemModel> model = [];
  @override
  void initState(){
    _addModel();
    _selectBloc.sendEvent.add(GetSelectEvent());
    super.initState();
  }
  @override
  void dispose() {
    _selectBloc.dispose();
    super.dispose();
  }
  _addModel(){
    for (var i = 0; i < 50; i++){
      model.add(ItemModel("Deporte $i",false));
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 325,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Selecciona '),
                          Text('los ',  style: TextStyle(color: Colors.amberAccent),), 
                          Text('que más te gusten')],),),
                  ),
                  Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Seleccionar todos',textAlign: TextAlign.center,),
                          IconButton(
                            onPressed: (){
                              setState(() {
                                _status = !_status;
                                if(!_status){
                                  for (var i = 0; i < model.length; i++) {
                                    if(model[i].status){
                                      _selectBloc.sendEvent.add(RemoveSelectItemEvent(model[i]));  
                                    }
                                    model[i].addStatus = true;
                                    _selectBloc.sendEvent.add(AddSelectItemEvent(model[i]));  
                                  }
                                }else{
                                  for (var i = 0; i < model.length; i++) {
                                     
                                    model[i].addStatus = false;
                                    _selectBloc.sendEvent.add(RemoveSelectItemEvent(model[i])); 
                                  }
                                  
                                }
                                
                              });
                            }, 
                            icon: Icon(
                              _status?Icons.check_box_outline_blank_sharp:Icons.check_box_outlined
                            ), 
                            color: Colors.amberAccent,
                            )
                        ],
                      ),
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      for(int i = 0; i < model.length; i++) Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: GestureDetector(
                          child: Text(model[i].item,style: TextStyle(color: model[i].status?Colors.amberAccent:Colors.black),),
                          onTap: (){
                            setState(() {
                              model[i].addStatus = !model[i].status;
                              if(model[i].status){
                                _selectBloc.sendEvent.add(AddSelectItemEvent(model[i]));
                              }else{
                                if(!_status){
                                   setState(() {
                                    _status = !_status;  
                                   });
                                   
                                }
                                _selectBloc.sendEvent.add(RemoveSelectItemEvent(model[i]));
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ), 
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
            child: Container(
                  width: double.infinity,
                  child: Center(
                    child:StreamBuilder<List<ItemModel>>(
                      initialData: [],
                      stream: _selectBloc.selectStream,
                      builder: (context, snapshot) {
                        return ElevatedButton(
                            child: Text('Guardar', style: TextStyle(color: Colors.black),),
                            onPressed: snapshot.data!.length>0?(){
                              Navigator.pushNamed(context, '/Seleccionados');
                            }:null,
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              
                            )
                          );
                      }
                    ), 
                  )
                ),
          )
        ],
    );
  }
}