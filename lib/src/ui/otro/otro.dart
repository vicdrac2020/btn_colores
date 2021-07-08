import 'package:btn_colores/src/bloc/select/select_bloc.dart';
import 'package:btn_colores/src/bloc/select/select_event.dart';
import 'package:btn_colores/src/ui/otro/otros/otros.dart';
import 'package:flutter/material.dart';

class Otro extends StatefulWidget {
  const Otro({ Key? key }) : super(key: key);

  @override
  _OtroState createState() => _OtroState();
}

class _OtroState extends State<Otro> {
  SelectBloc _selectBloc = SelectBloc();
  bool bda = false;
  List<bool> bd = [false,true,true];
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
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            index =  0;
                            bd[0]=false;
                            bd[1]=true;
                            bd[2]=true;  
                          });
                          
                          }, 
                        child: Text('ALIMENTOS',  style: TextStyle(color: bd[0]?Colors.black:Colors.amberAccent,fontSize: 8),)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            index = 1;
                            bd[1]=false;
                            bd[0]=true;
                            bd[2]=true;  
                          });
                        }, 
                        child: Text('BEBIDAS',  style: TextStyle(color: bd[1]?Colors.black:Colors.amberAccent,fontSize: 8),)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            print( MediaQuery.of(context).size.height);
                            index = 2;
                            bd[2]=false;
                            bd[1]=true;
                            bd[0]=true;  
                          });
                        }, 
                        child: Text('TEXTOLARGOPARAPROBARELMEENU',style: TextStyle(color: bd[2]?Colors.black:Colors.amberAccent,fontSize: 8),)
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: IndexedStack(
                  index: index,
                  children: <Widget>[
                    Container(child: Otros(),height: MediaQuery.of(context).size.height - 312,),
                    Container(child: Otros(),height: MediaQuery.of(context).size.height - 312,),
                    Container(child: Otros(),height: MediaQuery.of(context).size.height - 312,),
                  ]
                ),
              ),
            ],
          ),
        );
  }
}