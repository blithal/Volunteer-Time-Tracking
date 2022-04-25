import 'package:flutter/material.dart';
import 'package:searchfield/searchfield.dart';

class EventChosen {
  // these values are written in this file, and is read by main.dart
  static String eventChosen = "";
  static int eventChosenId = -1;
}

class EventPicker extends StatefulWidget {
  @override
  _EventPickerState createState() => _EventPickerState();
}

class _EventPickerState extends State<EventPicker> {
  final List<String> _suggestions = [
    'event 1',
    'event 2',
    'event 3',
    'event 4',
    'event 5',
  ];

  final _formKey = GlobalKey<FormState>();

  final _searchController = TextEditingController();
  String eventChosen = "";
  void onOptionPressed(SearchFieldListItem optionPressed) {
    setState(() {
      EventChosen.eventChosen = optionPressed.searchKey;
      EventChosen.eventChosenId = -42;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: <Widget>[
          Text('$eventChosen'),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchField(
              suggestionState: Suggestion.expand,
              suggestionAction: SuggestionAction.next,
              suggestions:
                  _suggestions.map((e) => SearchFieldListItem(e)).toList(),
              textInputAction: TextInputAction.next,
              controller: _searchController,
              hint: 'Choose an event to clock in/out',
              // initialValue: SearchFieldListItem(_suggestions[2], SizedBox()),
              maxSuggestionsInViewPort: 3,
              itemHeight: 45,
              onSuggestionTap: (optionPressed) {
                onOptionPressed(optionPressed);
              },
            ),
          ),
        ],
      ),
    );
  }
}
