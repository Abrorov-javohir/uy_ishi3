
import 'package:uy_ishi/model/course.dart';
import 'package:uy_ishi/services/course_service.dart';

class Courserepository {
  final courseservice = Courseservice();
  Future<List<Course>> getCourse() async {
    return courseservice.getCourse();
  }
}