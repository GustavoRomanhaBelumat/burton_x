import 'package:dio/dio.dart';
import 'package:burton_x/GeneralSettings.dart';
import 'package:burton_x/Model/Event/EventListItemModel.dart';
import 'package:burton_x/Model/Event/DetailedEventModel.dart';

class EventRepository {

  Future<List<EventListItemModel>> listEvents() async { 
    var targetUrl = "${GeneralSettings.apiTarget}/events";
    Response response = await Dio().get(targetUrl);
    return (response.data as List)
    .map((course)=> EventListItemModel.fromJson(course))
    .toList(); 
    //This method gets the simplified available event list.
  }

  Future<DetailedEventModel> getDetailedEvent(double eventID) async { 
    var targetUrl = "${GeneralSettings.apiTarget}/events/$eventID";
    Response response = await Dio().get(targetUrl);
    return DetailedEventModel.fromJson(response.data);
    //This method gets the detailed event through eventID.
  }


}