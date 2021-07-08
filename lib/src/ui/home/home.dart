import 'package:btn_colores/src/bloc/select/select_bloc.dart';
import 'package:btn_colores/src/bloc/select/select_event.dart';
import 'package:btn_colores/src/ui/deportes/deportes.dart';
import 'package:btn_colores/src/ui/interes/interes.dart';
import 'package:btn_colores/src/ui/otro/otro.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({ Key? key }) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
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
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Title(
                      color: Colors.black, 
                      child:Text(
                        'Título',
                        style: TextStyle(fontSize: 30),
                      )
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 2),
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            index =  0;
                            bd[0]=false;
                            bd[1]=true;
                            bd[2]=true;  
                          });
                          
                          }, 
                        child: Text('DEPORTES',  style: TextStyle(color: bd[0]?Colors.black:Colors.amberAccent,fontWeight: FontWeight.bold),)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 2),
                      child: TextButton(
                        onPressed: (){
                          setState(() {
                            index = 1;
                            bd[1]=false;
                            bd[0]=true;
                            bd[2]=true;  
                          });
                        }, 
                        child: Text('INTERES',style: TextStyle(color: bd[1]?Colors.black:Colors.amberAccent,fontWeight: FontWeight.bold),)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(18, 18, 18, 2),
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
                        child: Text('OTRO',style: TextStyle(color: bd[2]?Colors.black:Colors.amberAccent,fontWeight: FontWeight.bold),)
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
                    Container(child: Deportes(),height: MediaQuery.of(context).size.height - 220,),
                    Container(child: Interes(),height: MediaQuery.of(context).size.height - 220,),
                    Container(child: Otro(),height: MediaQuery.of(context).size.height - 260,),
                  ]
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}