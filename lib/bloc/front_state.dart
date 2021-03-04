part of 'front_bloc.dart';

abstract class FrontState extends Equatable {
  const FrontState();

  @override
  List<Object> get props => [];
}

class FrontInitial extends FrontState {}

class GameStartState extends FrontState {
  final String palabra;
  final String titulo;
  final int contador;

  GameStartState({
    @required this.palabra,
    @required this.titulo,
    @required this.contador,
  });

  List<Object> get props => [palabra,titulo,contador];
}

class GameNextState extends FrontState {
  final String palabra;
  final String titulo;
  final int contador;

  GameNextState({
    @required this.palabra,
    @required this.titulo,
    @required this.contador,
  });

  List<Object> get props => [palabra,titulo,contador];
}

class GameEndState extends FrontState {
  final String titulo;
  final int contador;

  GameEndState({
    @required this.titulo,
    @required this.contador,
  });

  List<Object> get props => [titulo,contador];
}
