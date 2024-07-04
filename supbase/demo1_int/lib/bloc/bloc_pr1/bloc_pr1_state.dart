part of 'bloc_pr1_bloc.dart';
@immutable
class Pr1State extends Emittable {

  List<Map<String,dynamic>>? list;

  List<Map<String,dynamic>>? list1;

  int? limit;
  int? page;

  Locale? locale;
  
  
  Pr1State({this.list =const [],this.list1=const [],this.limit=10,this.page=1,this.locale=const Locale("en"),});


  Pr1State copyWith({List<Map<String,dynamic>>? list,List<Map<String,dynamic>>? list1,int? limit,int? page,Locale? locale}){
    return
      Pr1State(
          list: list ?? this.list,
          list1: list1 ?? this.list1,
          limit: limit ?? this.limit,
          page: page ?? this.page,
          locale: locale ?? this.locale,

      );
  }
  
  @override
  List<Object?> get props => [list,list1,limit,page,locale];

  @override
  void emit(Object? state) {
  }

}


