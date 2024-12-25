// import 'package:covid_tracker/Models/world_state_model.dart';
// import 'package:covid_tracker/Services/state_services.dart';
// import 'package:covid_tracker/View/countries_list.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:pie_chart/pie_chart.dart';

// class WorldStates extends StatefulWidget {
//   const WorldStates({Key? key}) : super(key: key);

//   @override
//   State<WorldStates> createState() => _WorldStatesState();
// }

// class _WorldStatesState extends State<WorldStates>
//     with TickerProviderStateMixin {
//   late final AnimationController controller =
//       AnimationController(duration: Duration(seconds: 3), vsync: this)
//         ..repeat();

//   @override
//   void dispose() {
//     controller.dispose(); // Call controller.dispose() before super.dispose()
//     super.dispose();
//   }

//   final colorlist = <Color>[
//     const Color(0xff4285F4),
//     const Color(0xff1aa260),
//     const Color(0xffde5246),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     StateServices stateServices = StateServices();
//     return Scaffold(
//         body: SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.all(15),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * .01,
//               ),
//               FutureBuilder( 
//                 future: stateServices.fetchWorldStateRecords(),
//                 builder: (context, AsyncSnapshot<world_states_Model> Snapshot) {
//                   if (!Snapshot.hasData) {
//                     return Center(
//                       child: SpinKitFadingCircle(
//                         color: Colors.white,
//                         size: 50,
//                         controller: controller,
//                       ),
//                     );
//                   } else {
//                     return Column(
//                       children: [
//                         PieChart(
//                           dataMap: {
//                             "Total":
//                                 double.parse(Snapshot.data!.cases!.toString()),
//                             "Recovered": double.parse(
//                                 Snapshot.data!.recovered.toString()),
//                             "Deaths":
//                                 double.parse(Snapshot.data!.deaths.toString()),
//                           },
//                           chartValuesOptions: ChartValuesOptions(
//                               showChartValuesInPercentage: true),
//                           chartRadius: MediaQuery.of(context).size.width / 3.2,
//                           animationDuration: Duration(milliseconds: 1200),
//                           legendOptions: LegendOptions(
//                               legendPosition: LegendPosition.left),
//                           chartType: ChartType.ring,
//                           colorList: colorlist,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.symmetric(
//                               vertical:
//                                   MediaQuery.of(context).size.height * .06),
//                           child: Card(
//                             child: Column(
//                               children: [
//                                 ReusableRow(
//                                     title: "Total",
//                                     value: Snapshot.data!.cases.toString()),
//                                 ReusableRow(
//                                     title: "Deaths",
//                                     value: Snapshot.data!.deaths.toString()),
                               
//                                 ReusableRow(
//                                     title: "Recovered",
//                                     value: Snapshot.data!.recovered.toString()),
//                                 ReusableRow(
//                                     title: "Active",
//                                     value: Snapshot.data!.active.toString()),
//                                 ReusableRow(
//                                     title: "Critical",
//                                     value: Snapshot.data!.critical.toString()),
//                                 ReusableRow(
//                                     title: "Today Deaths",
//                                     value:
//                                         Snapshot.data!.todayDeaths.toString()),
//                                 ReusableRow(
//                                     title: "Today Recovered",
//                                     value: Snapshot.data!.todayRecovered
//                                         .toString()),
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(context, MaterialPageRoute(builder: (context){

//                                      return CountriesListScreen();
//                                     }));
//                                   },
//                                   child: Container(
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                       color: Color(0xff1aa260),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Center(
//                                       child: Text("Track Countries"),
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }

// // ignore: must_be_immutable
// class ReusableRow extends StatelessWidget {
//   String title, value;
//   ReusableRow({Key? key, required this.title, required this.value})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(title),
//               Text(value),
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Divider(),
//         ],
//       ),
//     );
//   }
// }

import 'package:covid_tracker/Models/world_state_model.dart';
import 'package:covid_tracker/Services/state_services.dart';
import 'package:covid_tracker/View/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({Key? key}) : super(key: key);

  @override
  State<WorldStates> createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final colorlist = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'COVID-19 Tracker',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                FutureBuilder(
                  future: stateServices.fetchWorldStateRecords(),
                  builder: (context, AsyncSnapshot<world_states_Model> snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: SpinKitFadingCircle(
                          color: Colors.blueAccent,
                          size: 50,
                          controller: controller,
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.grey[800],
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  const Text(
                                    "Global Statistics",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height * .02,
                                  ),
                                  PieChart(
                                    dataMap: {
                                      "Total": double.parse(
                                          snapshot.data!.cases!.toString()),
                                      "Recovered": double.parse(
                                          snapshot.data!.recovered.toString()),
                                      "Deaths": double.parse(
                                          snapshot.data!.deaths.toString()),
                                    },
                                    chartValuesOptions: const ChartValuesOptions(
                                      showChartValuesInPercentage: true,
                                      showChartValuesOutside: true,
                                    ),
                                    chartRadius:
                                        MediaQuery.of(context).size.width / 2.8,
                                    animationDuration:
                                        const Duration(milliseconds: 1200),
                                    legendOptions: const LegendOptions(
                                      legendPosition: LegendPosition.bottom,
                                      legendTextStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    chartType: ChartType.ring,
                                    colorList: colorlist,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .04,
                          ),
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            color: Colors.grey[800],
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Detailed Stats",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height * .02,
                                  ),
                                  ReusableRow(
                                      title: "Total Cases",
                                      value: snapshot.data!.cases.toString()),
                                  ReusableRow(
                                      title: "Deaths",
                                      value: snapshot.data!.deaths.toString()),
                                  ReusableRow(
                                      title: "Recovered",
                                      value: snapshot.data!.recovered.toString()),
                                  ReusableRow(
                                      title: "Active",
                                      value: snapshot.data!.active.toString()),
                                  ReusableRow(
                                      title: "Critical",
                                      value: snapshot.data!.critical.toString()),
                                  ReusableRow(
                                      title: "Today Deaths",
                                      value: snapshot.data!.todayDeaths
                                          .toString()),
                                  ReusableRow(
                                      title: "Today Recovered",
                                      value: snapshot.data!.todayRecovered
                                          .toString()),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .04,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CountriesListScreen()),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Track Countries",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}
