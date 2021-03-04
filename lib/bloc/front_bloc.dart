import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'front_event.dart';
part 'front_state.dart';

class FrontBloc extends Bloc<FrontEvent, FrontState> {
  FrontBloc() : super(FrontInitial());
  List<String> list1 = ["Limon", "Naranja", "Durazno", "Guayaba", "Platano"];
  List<String> list2 = ["Limon", "Naranja", "Durazno", "Guayaba", "Platano"];
  int listSize;
  int i = 0;
  int count = 0;

  @override
  Stream<FrontState> mapEventToState(
    FrontEvent event,
  ) async* {
    if (event is StartEvent) {
      list2.shuffle();
      listSize = list1.length;
      count = 0;
      i = 0;
      yield GameStartState(
          contador: count, palabra: list1[i], titulo: "The word is...");
    } else if (event is SkipEvent) {
      if (list1[i] != list2[i]) count += 1;
      i += 1;
      if (i < listSize) {
        yield GameStartState(
            contador: count, palabra: list1[i], titulo: "The word is...");
      } else
        yield GameEndState(contador: count, titulo: "Your Scored:");
    } else if (event is GotItEvent) {
      if (list1[i] == list2[i]) count += 1;
      i += 1;
      if (i < listSize) {
        yield GameStartState(
            contador: count, palabra: list1[i], titulo: "The word is...");
      } else
        yield GameEndState(contador: count, titulo: "Your Scored:");
    } else if (event is EndEvent) {
      yield GameEndState(contador: count, titulo: "Your Scored:");
    }
  }
}
