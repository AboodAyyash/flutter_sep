import 'package:flutter_sep/models/person.dart';
import 'package:flutter_sep/shared/shared.dart';

List<Person> search(value) {
  List<Person> result = [];
  result = freinds.where((Person person) {
    return person.name.toLowerCase().contains(value.toLowerCase()); //ahmad //t
  }).toList();

  return result;
}
