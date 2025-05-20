// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wbl/API_States/get_states.dart';
import 'package:wbl/Reusable%20Widgets/Admin_Year_dropwon/year.dart';

class MyColumn extends StatefulWidget {
  const MyColumn({super.key});

  @override
  State<MyColumn> createState() => _MyColumnState();
}

class _MyColumnState extends State<MyColumn> {
  late Future<List<Map<String, dynamic>>> futureCandidates;
  late Map<String, int> genderCount;
  String selectedCohort = 'select';
  String? selectedState;
  String selectedLevel = 'select';
  int? selectedYear;

  final List<String> cohortList = [
    'select',
    'Cohort 1',
    'Cohort 2',
    'Cohort 3'
  ];
  List<String> stateList = [];
  final List<String> levelList = ['select', 'Level 1', 'Level 2', 'Level 3'];
  List<_ChartData> chartMonthData = [];
  bool isLoading = true;
  String? errorMessage;
  List<_ChartData> categoryChartData = [];
  late List<_ChartData> genderChartData = [];
  final Map<String, String> categoryNames = {
    "0": "SC",
    "1": "ST",
    "2": "EWS",
    "3": "WOMEN",
  };

  @override
  void initState() {
    super.initState();
    futureCandidates = fetchCandidates();
    fetchCategoryData();
    fetchmonthData();
    initFetchstates();
  }

  void initFetchstates() async {
    List<String> names = await fetchStateNames();
    setState(() {
      stateList = ['Select', ...names]; 
      selectedState = stateList.isNotEmpty
          ? stateList.first
          : null; 
    });
  }

  // Convert month number to name
  String getMonthName(int month) {
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return (month >= 1 && month <= 12) ? months[month] : 'Unknown';
  }

  // Fetch and group data
  Future<void> fetchmonthData() async {
    try {
      final url =
          Uri.parse('http://localhost:8081/stipend'); // Replace with your API
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        Map<int, double> monthTotals = {};

        for (var item in data) {
          int month = int.tryParse(item['stipendMonth'] ?? '0') ?? 0;
          double amount = double.tryParse(item['amount'] ?? '0') ?? 0.0;

          if (month > 0) {
            monthTotals.update(month, (value) => value + amount,
                ifAbsent: () => amount);
          }
        }

        setState(() {
          chartMonthData = monthTotals.entries
              .map((e) => _ChartData(getMonthName(e.key), e.value))
              .toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load stipend data');
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

//fetch category data from API
  Future<void> fetchCategoryData() async {
    try {
      final response = await http
          .get(Uri.parse('http://localhost:8081/candidates')); // Your API URL

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        // Initialize a map to count categories
        Map<String, int> categoryCount = {
          "0": 0,
          "1": 0,
          "2": 0,
          "3": 0,
        };

        // Count occurrences of each category
        for (var candidate in data) {
          String category = candidate['category'];
          if (categoryCount.containsKey(category)) {
            categoryCount[category] = categoryCount[category]! + 1;
          }
        }

        // Prepare chart data from category count map
        setState(() {
          categoryChartData = categoryCount.entries.map<_ChartData>((entry) {
            return _ChartData(
                categoryNames[entry.key]!, entry.value.toDouble());
          }).toList();
        });
      } else {
        print('Failed to load categories. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  // Fetching data from the API
  Future<List<Map<String, dynamic>>> fetchCandidates() async {
    final response =
        await http.get(Uri.parse('http://localhost:8081/candidates'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load candidates');
    }
  }

  // Count Male and Female based on gender field
  Map<String, int> countGender(List<Map<String, dynamic>> candidates) {
    int maleCount = 0;
    int femaleCount = 0;

    for (var candidate in candidates) {
      // Check if the gender is '0' for male or '1' for female (update based on actual API response)
      if (candidate['gender'] == '0' || candidate['gender'] == 0) {
        maleCount++;
      } else if (candidate['gender'] == '1' || candidate['gender'] == 1) {
        femaleCount++;
      }
    }

    return {'Male': maleCount, 'Female': femaleCount};
  }

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
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWrap(),
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
                                    padding:
                                        EdgeInsets.all(isSmallScreen ? 6 : 10),
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
                                                    fontSize:
                                                        isSmallScreen ? 14 : 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                  textAlign: TextAlign.end,
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  stat['value'],
                                                  style: TextStyle(
                                                    fontSize:
                                                        isSmallScreen ? 10 : 12,
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
          FutureBuilder<List<Map<String, dynamic>>>(
            future: futureCandidates,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (snapshot.hasData) {
                // Counting male and female based on the data
                genderCount = countGender(snapshot.data!);

                // Update the chart data dynamically
                genderChartData = [
                  _ChartData('Male', genderCount['Male']!.toDouble()),
                  _ChartData('Female', genderCount['Female']!.toDouble()),
                ];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Pie charts row
                        Wrap(
                          alignment: WrapAlignment.start,
                          children: [
                            // Pie chart 1: Monthly Stipend
                            Expanded(
                              child: _piChart(
                                title: 'Monthly Stipend',
                                chartData: chartMonthData,
                              ),
                            ),
                            const SizedBox(width: 50),
                            // Pie chart 2: Gender Distribution
                            Expanded(
                              child: _piChart(
                                title: 'Gender Distribution',
                                chartData: genderChartData,
                              ),
                            ),
                            const SizedBox(width: 50),
                            // Pie chart 3: Category Distribution
                            Expanded(
                              child: _piChart(
                                title: 'Category Distribution',
                                chartData: categoryChartData,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                            height:
                                20), // Space between charts and other content
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(child: Text("No data found"));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget SearchWrap() {
    return Wrap(
      spacing: 8, // Space between dropdowns
      runSpacing: 8, // Space between rows of dropdowns
      alignment: WrapAlignment.start,
      children: [
        Dropdown("Select Cohort", selectedCohort, cohortList, (newValue) {
          setState(() {
            selectedCohort = newValue!;
          });
        }),
        Dropdown("Select State", selectedState ?? "", stateList, (newValue) {
          setState(() {
            selectedState = newValue;
          });
        }),
        Dropdown("Select Level", selectedLevel, levelList, (newValue) {
          setState(() {
            selectedLevel = newValue!;
          });
        }),
        YearDropdown(
          selectedYear: selectedYear,
          onChanged: (newValue) {
            setState(() {
              selectedYear = newValue;
            });
          },
        ),
      ],
    );
  }

  Widget Dropdown(String label, String? selectedValue, List<String> items,
      ValueChanged<String?> onChanged) {
    return mysearchbutton(
      selectedValue ?? "Select",
      items,
      label,
      onChanged,
    );
  }

  Widget mysearchbutton(String? selectedItem, List<String> items,
      String labelText, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: 200,
        child: DropdownButtonFormField<String>(
          hint: Text("Select", style: TextStyle(color: Colors.black)),
          value: items.contains(selectedItem) ? selectedItem : "Select",
          isExpanded: true,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                maxLines: 1,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
        ),
      ),
    );
  }

  // Pie chart widget
  Widget _piChart(
      {required String title, required List<_ChartData> chartData}) {
    double totalCount = chartData.fold(0, (sum, data) => sum + data.y);

    return SizedBox(
      width: 400,
      child: SfCircularChart(
        title: ChartTitle(
          text: title,
          textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        legend: const Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CircularSeries>[
          PieSeries<_ChartData, String>(
            dataSource: chartData,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            dataLabelMapper: (_ChartData data, _) {
              if (data.y == 0) return '';
              final percentage = (data.y / totalCount * 100).toStringAsFixed(1);
              return '${data.x}\n$percentage%';
            },
            pointColorMapper: (_ChartData data, _) =>
                null, // Optional: default color
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.inside,
              overflowMode: OverflowMode.hide,
              connectorLineSettings: ConnectorLineSettings(width: 0),
              textStyle: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // 👇 Add these two lines to create white border
            strokeColor: Colors.white, // White line between slices
            strokeWidth: 2, // Thickness of the line
          )
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
