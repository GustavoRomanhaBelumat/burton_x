import 'package:burton_x/Model/Event/EventListItemCategoryModel.dart';
import 'package:burton_x/Model/Event/EventListItemModel.dart';
import 'package:burton_x/Repo/Event/EventCategoryRepository.dart';
import 'package:burton_x/Repo/Event/EventRepository.dart';
import 'package:flutter/widgets.dart';


class EventListBLoC extends ChangeNotifier {
  final eventRepository = new EventRepository();
  final eventCategoryRepository = new EventCategoryRepository();
  List<EventListItemModel> events;
  List<EventListItemCategoryModel> typedEvents;

  String selectedEventTypes = 'all';

  EventListBLoC(){
    getEventByType(selectedEventTypes);
    getAllEvents();
  }

  getEventByType(String tag) {
    eventCategoryRepository.listEventsByType(tag).then((data) {
      this.typedEvents = data;
      notifyListeners();
    });
  }

  getAllEvents() {
    eventRepository.listEvents().then((data) {
      this.events = data;
      notifyListeners();
    });
  }

}