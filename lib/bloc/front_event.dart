part of 'front_bloc.dart';

abstract class FrontEvent extends Equatable {
  const FrontEvent();

  @override
  List<Object> get props => [];
}

class StartEvent extends FrontEvent{
  @override
  List<Object> get props => [];
}

class SkipEvent extends FrontEvent{
  final bool result = false;
  @override
  List<Object> get props => [result];
}
 
class GotItEvent extends FrontEvent{
  final bool result = true;
  @override
  List<Object> get props => [result];
}
 
class EndEvent extends FrontEvent{
  @override
  List<Object> get props => [];
}
 
