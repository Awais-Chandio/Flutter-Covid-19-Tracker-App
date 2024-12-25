// import 'package:covid_tracker/View/world_states.dart';
// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class DetailsScreen extends StatefulWidget {
//   String name;
//   String image;
//   int totalCases,
//       totalDeaths,
//       totalRecovered,
//       active,
//       critical,
//       todayRecovered,
//       test;
//   DetailsScreen(
//       {required this.name,
//       required this.image,
//       required this.totalCases,
//       required this.totalDeaths,
//       required this.totalRecovered,
//       required this.active,
//       required this.critical,
//       required this.todayRecovered,
//       required this.test});

//   @override
//   State<DetailsScreen> createState() => _DetailsScreenState();
// }

// class _DetailsScreenState extends State<DetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.name),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Stack(
//               alignment: Alignment.topCenter,
//               children: [
//                 Padding(
//                   padding: EdgeInsets.only(
//                       top: MediaQuery.of(context).size.height * 0.67),
//                   child: Card(
//                     child: Column(
//                       children: [
//                         SizedBox(
//                           height: MediaQuery.of(context).size.height * .06,
//                         ),
//                         ReusableRow(
//                             title: "Cases", value: widget.totalCases.toString()),
//                         ReusableRow(
//                             title: "Recovered", value: widget.totalRecovered.toString()),
//                         ReusableRow(
//                             title: "Deaths", value: widget.totalDeaths.toString()),
//                         ReusableRow(
//                             title: "Critical", value: widget.critical.toString()),
//                         ReusableRow(
//                             title: "Today Recovered", value: widget.todayRecovered.toString()),
//                         ReusableRow(
//                             title: "Cases", value: widget.totalCases.toString()),
//                       ],
//                     ),
//                   ),
//                 ),
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundImage: NetworkImage(widget.image),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailsScreen({
    required this.name,
    required this.image,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Set the scaffold to be transparent
      appBar: AppBar(
        title: Text(
          widget.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0F4B6E), // Deep Blue color
              Color(0xFFF76B8A), // Soft Coral color
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(widget.image),
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "Statistics",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    const SizedBox(height: 10),
                    ReusableRow(
                        title: "Total Cases",
                        value: widget.totalCases.toString(),
                        icon: Icons.coronavirus_outlined),
                    ReusableRow(
                        title: "Recovered",
                        value: widget.totalRecovered.toString(),
                        icon: Icons.healing_outlined),
                    ReusableRow(
                        title: "Deaths",
                        value: widget.totalDeaths.toString(),
                        icon: Icons.dangerous_outlined),
                    ReusableRow(
                        title: "Critical",
                        value: widget.critical.toString(),
                        icon: Icons.warning_amber_outlined),
                    ReusableRow(
                        title: "Today Recovered",
                        value: widget.todayRecovered.toString(),
                        icon: Icons.update_outlined),
                    ReusableRow(
                        title: "Tests Conducted",
                        value: widget.test.toString(),
                        icon: Icons.science_outlined),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  final IconData icon;

  const ReusableRow({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blueAccent,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
        ],
      ),
    );
  }
}
