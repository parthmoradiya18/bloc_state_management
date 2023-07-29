import 'package:bloc/bloc.dart';

import 'demo_event.dart';
import 'demo_state.dart';

class DemoBloc extends Bloc<DemoEvent, DemoState> {
  int sum=0,sub=0;
  String str="";

  DemoBloc() : super(sum_state(0)) {
    on<InitEvent>((event, emit){
      emit(init_class(0));
    });
    on<Sum_Event>((event, emit){
      sum=int.parse(event.s1)+int.parse(event.s2);
      emit(sum_state(sum));
    });
    on<Sub_Event>((event, emit){
      sub=int.parse(event.s1)-int.parse(event.s2);
      emit(sub_state(sub));
    });
    on<Str_Event>((event, emit){
      str=event.s1;
      emit(str_state(str));
    });
  }
  //
  // void _init(InitEvent event, Emitter<DemoState> emit) async {
  //   emit(state.clone());
  // }
}
