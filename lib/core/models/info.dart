
import 'package:equatable/equatable.dart';

class InfoClass extends Equatable{
  int id;
  String name;

  InfoClass({required this.id, required this.name});

  factory InfoClass.fromJson(Map data){
    return InfoClass(id: data['id'], name: data['name']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id,name];
}