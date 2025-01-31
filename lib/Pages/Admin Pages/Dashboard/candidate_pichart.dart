// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyColumn extends StatefulWidget {
  const MyColumn({super.key});

  @override
  State<MyColumn> createState() => _MyColumnState();
}

class _MyColumnState extends State<MyColumn> {
  List<_ChartData> chartData = [
    _ChartData('Jul', 71.4),
    _ChartData('Aug', 28.6),
  ];
  List<_ChartData> genderChartData = [
    _ChartData('Male', 71.4),
    _ChartData('Female', 28.6),
  ];
  List<_ChartData> categoryChartData = [
    _ChartData('SC', 64.3),
    _ChartData('ST', 14.3),
    _ChartData('EWS', 21.4),
  ];
  final List<Map<String, dynamic>> statsData = [
    {
      'icon': Icons.people,
      'title': 'Enrolled',
      'value': '10\n',
      'color': const Color.fromARGB(255, 27, 81, 162),
      'iconColor': Colors.white,
    },
    {
      'icon': Icons.arrow_back,
      'title': 'Dropper',
      'value': '1\n',
      'color': Colors.red,
      'iconColor': Colors.white,
    },
    {
      'icon': Icons.check_circle,
      'title': 'Complete',
      'value': '3\n',
      'color': Colors.green,
      'iconColor': Colors.white,
    },
    {
      'icon': Icons.attach_money,
      'title': 'Stipend Dispersed',
      'value': '2556656\n',
      'color': Colors.orange,
      'iconColor': Colors.white,
    },
    {
      'icon': Icons.work,
      'title': 'Total Vacancies',
      'value': '32\n',
      'color': Colors.purple,
      'iconColor': Colors.white,
    },
    {
      'icon': Icons.refresh,
      'title': 'Target Achieved',
      'value': 'Complete: 9%\nEnrolled: 43%',
      'color': const Color.fromARGB(255, 90, 209, 213),
      'iconColor': Colors.white,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDropdownSection(context),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        bool isSmallScreen = constraints.maxWidth <= 800;
                        return Column(
                          children: [
                            GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: isSmallScreen ? 2 : 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio:
                                    isSmallScreen ? 12 / 3.5 : 10 / 3.5,
                              ),
                              itemCount: statsData.length,
                              itemBuilder: (context, index) {
                                final stat = statsData[index];
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Card(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                          isSmallScreen ? 6 : 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(
                                                isSmallScreen ? 8 : 10),
                                            decoration: BoxDecoration(
                                              color: stat['color'],
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Icon(
                                              stat['icon'],
                                              color: stat['iconColor'],
                                              size: isSmallScreen ? 18 : 24,
                                            ),
                                          ),
                                          const Spacer(),
                                          Flexible(
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    stat['title'],
                                                    style: TextStyle(
                                                      fontSize: isSmallScreen
                                                          ? 14
                                                          : 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    maxLines: 1,
                                                    textAlign: TextAlign.end,
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    stat['value'],
                                                    style: TextStyle(
                                                      fontSize: isSmallScreen
                                                          ? 10
                                                          : 12,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    textAlign: TextAlign.end,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5),
            Card(
              child: Wrap(
                children: [
                  Expanded(
                    child: _piChart(
                        title: 'Monthly Stipend', chartData: chartData),
                  ),
                  const SizedBox(width: 50), // Space between charts
                  Expanded(
                    child: _piChart(
                        title: 'Gender Distribution',
                        chartData: genderChartData),
                  ),
                  const SizedBox(width: 10), // Space between charts
                  Expanded(
                    child: _piChart(
                        title: 'Category Distribution',
                        chartData: categoryChartData),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownSection(BuildContext context) {
    return Wrap(
      spacing: 8.0, // Space between dropdowns
      runSpacing: 8.0, // Space between rows of dropdowns
      alignment: WrapAlignment.start, // Align to start
      children: [
        Flexible(child: _dropdownbutton(labelText: 'State', hintText: 'State')),
        Flexible(
            child: _dropdownbutton(
                labelText: 'Current Cohort', hintText: 'Cohort')),
        Flexible(child: _dropdownbutton(labelText: 'Level', hintText: 'Level')),
        Flexible(child: _dropdownbutton(labelText: 'Year', hintText: 'Year')),
      ],
    );
  }

  Widget _dropdownbutton({
    required final String labelText,
    required final String hintText,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: 150, // Responsive width
        child: DropdownButtonFormField(
          value: 'Select',
          hint: Text(hintText),
          decoration: InputDecoration(
            labelText: labelText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          items: <String>['Select', 'Option 1', 'Option 2'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _piChart(
      {required String title, required final List<_ChartData> chartData}) {
    return SizedBox(
      width: 398,
      child: SfCircularChart(
        title: ChartTitle(text: title),
        legend: const Legend(isVisible: true),
        series: <CircularSeries>[
          PieSeries<_ChartData, String>(
            dataSource: chartData,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}
