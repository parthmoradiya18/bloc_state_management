import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'demo_bloc.dart';
import 'demo_event.dart';
import 'demo_state.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DemoBloc()..add(InitEvent()),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<DemoBloc>(context);
    TextEditingController t1=TextEditingController();
    TextEditingController t2=TextEditingController();
    TextEditingController t3=TextEditingController();
    String str="";
    return Scaffold(
      appBar: AppBar(title: Text("Demo Bloc"),),
      body: Column(children: [
            Card(margin: EdgeInsets.all(5),
              color: Colors.grey,
              child:
              TextField(controller: t1,decoration: InputDecoration(hintText: "Enter value"),),),

        Card(margin: EdgeInsets.all(5),
          color: Colors.grey,
          child:
        TextField(controller: t2,decoration: InputDecoration(hintText: "Enter value"),),),
        Card(margin: EdgeInsets.all(5),
          color: Colors.grey,
          child:
        TextField(controller: t3,decoration: InputDecoration(hintText: "Enter value"),onChanged: (value){
            bloc.add(Str_Event(t3.text));
        },),),
        SizedBox(height: 10,),
          ElevatedButton(onPressed: () {
            bloc.add(Sum_Event(t1.text, t2.text));
          }, child: Text("sum",style: TextStyle(fontSize: 25),)),
       SizedBox(height: 10,),
        ElevatedButton(onPressed: () {
          bloc.add(Sub_Event(t1.text, t2.text));
        }, child: Text("sub",style: TextStyle(fontSize: 25),)),
        BlocBuilder<DemoBloc,DemoState>(builder: (context ,state){
         if(state is sum_state)
           {
             return Text("Sum : ${state.s}",style: TextStyle(fontSize: 25),);
           }
         else
           {
             return Text("Sum :0 ",style: TextStyle(fontSize: 25),);
           }
        },buildWhen: (previous, current)=> current is sum_state,),

        BlocBuilder<DemoBloc,DemoState>(builder: (context ,state){
          if(state is sub_state)
            {
              return Text("Sub : ${state.s}",style: TextStyle(fontSize: 25),);
            }
          else
            {
              return Text("Sub : 0",style: TextStyle(fontSize: 25),);
            }
        },buildWhen: (previous, current)=> current is sub_state,),
        BlocBuilder<DemoBloc,DemoState>(builder: (context ,state){
         if(state is str_state)
           {
             return Text("String : ${state.s}",style: TextStyle(fontSize: 25),);
           }
         else
           {
             return Text("String :0 ",style: TextStyle(fontSize: 25),);
           }
        },buildWhen: (previous, current)=> current is str_state,),
      ],),
    );
  }
}

