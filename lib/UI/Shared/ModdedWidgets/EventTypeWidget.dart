import 'package:burton_x/BLoC/EventListBLoC.dart';
import 'package:burton_x/Model/Event/EventListItemCategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:burton_x/GeneralSettings.dart';


class EventTypeWidget extends StatelessWidget {
  final EventListItemCategoryModel typedEvent;
  
  EventTypeWidget({@required this.typedEvent});

  @override
  Widget build(BuildContext context) {
    final EventListBLoC bloc = Provider.of<EventListBLoC>(context);
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: typedEvent.tag == bloc.selectedEventTypes
        ? Theme.of(context).primaryColor.withOpacity(0.3)
        : Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(70),
        )
 
      ),
      child: FlatButton(
        child: Text(bloc.selectedEventTypes),
        onPressed: (){ 
          bloc.getEventByType(typedEvent.tag);
        },
      ),
    );
  }
}