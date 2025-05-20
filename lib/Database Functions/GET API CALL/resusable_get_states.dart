import 'package:wbl/Database%20Functions/GET%20API%20CALL/getstates.dart';

import 'package:flutter/material.dart';
import 'package:wbl/Database%20Functions/GET%20API%20CALL/getstates.dart';

class StateFetcherWidget extends StatefulWidget {
  @override
  _StateFetcherWidgetState createState() => _StateFetcherWidgetState();
}

class _StateFetcherWidgetState extends State<StateFetcherWidget> {
  List<String> stateList = [];
  String selectedState = 'select';

  void fetchstates() async {
    try {
      List<String> states = await fetchStateNames();
      setState(() {
        stateList = ['select', ...states];
        if (!stateList.contains(selectedState)) {
          selectedState = 'select'; // Reset to a valid value
        }
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with your widget tree
  }
}
