import 'package:dio/dio.dart';
import 'package:burton_x/GeneralSettings.dart';
import 'package:burton_x/Model/Event/EventListItemCategoryModel.dart';

class EventCategoryRepository {

  Future<List<EventListItemCategoryModel>> listEventsByType(String type) async { 
    var targetUrl = "${GeneralSettings.apiTarget}/events/$type";
    Response response = await Dio().get(targetUrl);
    return (response.data as List)
    .map((course)=> EventListItemCategoryModel.fromJson(course))
    .toList(); 
    //This method gets the simplified available event list.
  }



}