import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:demo1_int/Repository/Methods.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../generated/l10n.dart';
part 'bloc_pr1_event.dart';
part 'bloc_pr1_state.dart';

class Pr1Bloc extends Bloc<Pr1Event, Pr1State> {

  List<Map<String, dynamic>> list = [];

  List<Map<String, dynamic>> list1 = [];

  Pr1Bloc() : super(Pr1State()) {
    on<AddItem>(_addItem);
    on<DeleteItem>(_deleteItem);
    on<UpdateItem>(_updateItem);
    on<ShowItem>(_showItem);
    on<Addpage>(_addPage);
    on<LoadSavedLocalization>(getLanguage);
    on<LoadLocalization>(changeLanguage);


  }

  void _addItem(AddItem event, Emitter<Pr1State> emit) {
    list.add(event.list_value as Map<String, dynamic>);
    emit(state.copyWith(list: List.from(list)));
  }


  void _deleteItem(DeleteItem event, Emitter<Pr1State> emit) {
    for (int i = 0; i < list.length; ++i) {
      if (list[i]["id"] == event.id) {
        list.removeAt(i);
      }
    }
    emit(state.copyWith(list: List.from(list!)));
  }

  void _updateItem(UpdateItem event, Emitter<Pr1State> emit) {
    list.clear();
    list.add(event.list_value!);
    emit(state.copyWith(list: List.from(list!)));
  }

  void _showItem(ShowItem event, Emitter<Pr1State> emit) {
    list1.add(event.list_value1!);
    emit(state.copyWith(list: List.from(list1)));
  }

  void _addPage(Addpage event, Emitter<Pr1State> emit) {
    emit(state.copyWith(page:state.page! + 1 ));
  }

  Future<void> getLanguage(LoadSavedLocalization event, Emitter<Pr1State> emit)async {
    Locale saveLocale=await getLocale();
    // emit( Pr1State([],[],10,1,saveLocale));
  }

  void changeLanguage(LoadLocalization event, Emitter<Pr1State> emit) {
    emit(state.copyWith(page:state.page! + 1 ));
  }

  saveLocale(Locale locale)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString("language", locale.languageCode);
  }

  Future<Locale> getLocale()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String languageCode=prefs.getString("language" ) ?? "en";
    print(languageCode);
    return Locale(languageCode);
  }

}
