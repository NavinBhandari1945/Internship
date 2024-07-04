part of 'bloc_pr1_bloc.dart';

@immutable
abstract class Pr1Event extends Equatable {

  Pr1Event();
  @override
  List<Object> get props=>[];

}

class AddItem extends Pr1Event{
  Map<String,dynamic>? list_value;
  AddItem({required this.list_value});
  @override
  List<Object> get props=>[list_value!];

}

class DeleteItem extends Pr1Event{
  int? id;
  DeleteItem({required this.id});
  @override
  List<Object> get props=>[id!];
}

class UpdateItem extends  Pr1Event{
  int? id;
  Map<String,dynamic>? list_value;
  UpdateItem({required this.id,required this.list_value});
  @override
  List<Object> get props=>[id!,list_value!];

}

class ShowItem extends Pr1Event{
  Map<String,dynamic>? list_value1;
  ShowItem({required this.list_value1});
  @override
  List<Object> get props=>[list_value1!];
}

class Addpage extends Pr1Event{
  @override
  List<Object> get props=>[];
}

class LoadLocalization extends Pr1Event{
  late final Locale locale;
  LoadLocalization({required this.locale});
  @override
  List<Object> get props=>[locale!];
}

class LoadSavedLocalization extends Pr1Event{

}