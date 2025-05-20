// import 'package:flutter/material.dart';
// import 'package:wbl/Database%20Functions/GET%20API%20CALL/getstates.dart';

// class Dropdown extends StatefulWidget {
//   const Dropdown({super.key});

//   @override
//   State<Dropdown> createState() => _DropdownState();
// }

// class _DropdownState extends State<Dropdown> {
//   String selectedCohort = 'select';
//   String selectedState = 'select';
//   String selectedLevel = 'select';
//   String selectedYear = 'select';
//   List<Map<String, dynamic>> filteredcandidate = [];
//   final List<String> cohortList = [
//     'select',
//     'Cohort 1',
//     'Cohort 2',
//     'Cohort 3'
//   ];
//   List<String> stateList = ['select'];
//   final List<String> levelList = ['select', 'Level 1', 'Level 2', 'Level 3'];
//   final List<String> yearList = ['select', '2022', '2023', '2024'];

//   void fetchstates() async {
//     try {
//       List<String> states = await fetchStateNames();
//       setState(() {
//         stateList = ["Select", ...states];
//         if (!stateList.contains(selectedState)) {
//           selectedState = "Select";
//         }
//       });
//     } catch (e) {
//       print("Error: $e");
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     // filteredcandidate = candidates;
//     fetchstates();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SearchWrap();
//   }

//   Widget SearchWrap() {
//     return Wrap(
//       spacing: 8, // Space between dropdowns
//       runSpacing: 8, // Space between rows of dropdowns
//       alignment: WrapAlignment.start,
//       children: [
//         Dropdown("Select Cohort", selectedCohort, cohortList, (newValue) {
//           setState(() {
//             selectedCohort = newValue!;
//           });
//         }),
//         Dropdown("State", selectedState, stateList, (newValue) {
//           setState(() {
//             selectedState = newValue!;
//           });
//         }),
//         Dropdown("Level", selectedLevel, levelList, (newValue) {
//           setState(() {
//             selectedLevel = newValue!;
//           });
//         }),
//         Dropdown("Year", selectedYear, yearList, (newValue) {
//           setState(() {
//             selectedYear = newValue!;
//           });
//         }),
//       ],
//     );
//   }

//   Widget Dropdown(String label, String selectedValue, List<String> items,
//       ValueChanged<String?> onChanged) {
//     return mysearchbutton(
//       selectedValue,
//       items,
//       label,
//       onChanged,
//     );
//   }

//   Widget mysearchbutton(String selectedItem, List<String> items,
//       String labelText, ValueChanged<String?> onChanged) {
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: SizedBox(
//         width: 200,
//         child: DropdownButtonFormField<String>(
//           value: selectedItem,
//           items: items.map((String item) {
//             return DropdownMenuItem<String>(
//               value: item,
//               child: FittedBox(
//                 fit: BoxFit.scaleDown,
//                 child: Text(
//                   item,
//                   style: const TextStyle(fontSize: 12),
//                   softWrap: true,
//                   overflow: TextOverflow.visible,
//                   maxLines: 1,
//                 ),
//               ),
//             );
//           }).toList(),
//           onChanged: onChanged,
//           decoration: InputDecoration(
//             border: const OutlineInputBorder(),
//             labelText: labelText,
//           ),
//         ),
//       ),
//     );
//   }
// }
