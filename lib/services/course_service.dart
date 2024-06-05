import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uy_ishi/model/course.dart';

class Courseservice {
  Future<List<Course>> getCourse() async {
    Uri url = Uri.parse(
        'https://courses-57a9c-default-rtdb.firebaseio.com/courses.json');
    final responce = await http.get(url);
    final data = jsonDecode(responce.body);
    List<Course> loadedcourses = [];
    data.forEach((key, value) {
      value['id'] = key;
      loadedcourses.add(Course.fromJson(value));
    });
    return loadedcourses;
  }
}