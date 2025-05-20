import 'package:flutter/material.dart';

class YearDropdown extends StatelessWidget {
  final int? selectedYear;
  final Function(int?) onChanged;

  const YearDropdown({
    super.key,
    required this.selectedYear,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    final List<int> yearList =
        List.generate(currentYear - 1980 + 1, (index) => currentYear - index);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 150,
        child: DropdownButtonFormField<int>(
          hint: Text("Select",
              style: TextStyle(color: Colors.black, fontSize: 12)),
          value: selectedYear,
          onChanged: onChanged,
          isExpanded: true,
          items: yearList.map((year) {
            return DropdownMenuItem<int>(
              value: year,
              child: Text(
                year.toString(),
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
              ),
            );
          }).toList(),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Year',
          ),
        ),
      ),
    );
  }
}
