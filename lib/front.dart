import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/front_bloc.dart';

class Front extends StatefulWidget {
  Front({Key key}) : super(key: key);

  @override
  _FrontState createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Guess the Word"),
        backgroundColor: Color(0xff6AB343),
      ),
      body: BlocProvider(
        create: (context) => FrontBloc(),
        child: BlocConsumer<FrontBloc, FrontState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if(state is GameStartState){
              print(state.contador);
              return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 200,),
                  Center(
                    child: Column(
                      children: [
                        Text(state.titulo),
                        SizedBox(height: 20,),
                        Text(
                          state.palabra,
                          style: TextStyle(fontSize: 26),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 200,),
                  Text(state.contador.toString()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                            child: Text("SKIP"),
                            onPressed: (){
                               BlocProvider.of<FrontBloc>(context).add(SkipEvent());
                            },
                          ),
                      FlatButton(
                            child: Text("GOT IT",style: TextStyle(color: Colors.white),),
                            onPressed: (){
                               BlocProvider.of<FrontBloc>(context).add(GotItEvent());
                            },
                            color: Color(0xff6AB343),
                          ),
                      FlatButton(
                            child: Text("END GAME"),
                            onPressed: (){
                               BlocProvider.of<FrontBloc>(context).add(EndEvent());
                            },
                          ),
                    ],
                  )
                ],
              ),
            );
            }else if(state is GameEndState){
              return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100,),
                  Center(
                    child: Column(
                      children: [
                        Text(state.titulo),
                        SizedBox(height: 20,),
                        Text(
                          state.contador.toString(),
                          style: TextStyle(fontSize: 26),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 90,),
                  FlatButton(
                        child: Text("PLAY AGAIN",style: TextStyle(color: Colors.white),),
                        onPressed: (){
                           BlocProvider.of<FrontBloc>(context).add(StartEvent());
                        },
                        color: Color(0xff6AB343),
                      )
                ],
              ),
            );
            }else
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 200,),
                  Center(
                    child: Column(
                      children: [
                        Text("Get ready to"),
                        SizedBox(height: 20,),
                        Text(
                          "Guess the word!",
                          style: TextStyle(fontSize: 26),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 200,),
                  FlatButton(
                        child: Text("PLAY",style: TextStyle(color: Colors.white),),
                        onPressed: (){
                          BlocProvider.of<FrontBloc>(context).add(StartEvent());
                        },
                        color: Color(0xff6AB343),
                      )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
