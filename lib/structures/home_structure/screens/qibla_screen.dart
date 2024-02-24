// import 'dart:math' as math;

// import 'package:flutter/material.dart';
// import 'package:flutter_compass/flutter_compass.dart';
// import 'package:new_prayer_app/structures/intro_structure/screens/intro_location_screen.dart';
// import 'package:new_prayer_app/widgets/custom_appbar.dart';
// import 'package:permission_handler/permission_handler.dart';

// class QiblaScreen extends StatefulWidget {
//   const QiblaScreen({super.key});

//   @override
//   State<QiblaScreen> createState() => _QiblaScreenState();
// }

// class _QiblaScreenState extends State<QiblaScreen> {
//   bool _hasPermissions = false;
//   CompassEvent? _lastRead;
//   DateTime? _lastReadAt;

//   @override
//   void initState() {
//     super.initState();

//     _fetchPermissionStatus();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: customAppbar(context, title: "Qibla"),
//         body: Builder(builder: (context) {
//           if (_hasPermissions) {
//             return Column(
//               children: <Widget>[
//                 _buildManualReader(),
//                 Expanded(child: _buildCompass()),
//               ],
//             );
//           } else {
//             return _buildPermissionSheet();
//           }
//         }));
//   }

//   Widget _buildCompass() {
//     return StreamBuilder<CompassEvent>(
//       stream: FlutterCompass.events,
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return Text('Error reading heading: ${snapshot.error}');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }

//         double? direction = snapshot.data!.heading;

//         // if direction is null, then device does not support this sensor
//         // show error message
//         if (direction == null) {
//           return const Center(
//             child: Text("Device does not have sensors!"),
//           );
//         }

//         // return Transform.rotate(
//         //     angle: (direction * (math.pi / 180) * -1),
//         //     child: Image.asset(
//         //       "assets/images/arrow.png",
//         //       height: 100,
//         //       width: 100,
//         //     ));

//         return Container(
//           child: Transform.rotate(
//             angle: (direction * (math.pi / 180) * -1),
//             child: Image.asset(
//               "assets/images/arrow.png",
//               width: 100,
//               height: 100,
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildManualReader() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Row(
//         children: <Widget>[
//           ElevatedButton(
//             child: Text('Read Value'),
//             onPressed: () async {
//               final CompassEvent tmp = await FlutterCompass.events!.first;
//               setState(() {
//                 _lastRead = tmp;
//                 _lastReadAt = DateTime.now();
//               });
//             },
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Text(
//                     '$_lastRead',
//                     style: Theme.of(context).textTheme.bodySmall,
//                   ),
//                   Text(
//                     '$_lastReadAt',
//                     style: Theme.of(context).textTheme.bodySmall,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPermissionSheet() {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Text('Location Permission Required'),
//           ElevatedButton(
//             child: Text('Request Permissions'),
//             onPressed: () {
//               Permission.locationWhenInUse.request().then((ignored) {
//                 _fetchPermissionStatus();
//               });
//             },
//           ),
//           SizedBox(height: 16),
//           ElevatedButton(
//             child: Text('Open App Settings'),
//             onPressed: () {
//               openAppSettings().then((opened) {
//                 //
//               });
//             },
//           )
//         ],
//       ),
//     );
//   }

//   void _fetchPermissionStatus() {
//     Permission.locationWhenInUse.status.then((status) {
//       if (mounted) {
//         setState(() => _hasPermissions = status == PermissionStatus.granted);
//       }
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:new_prayer_app/widgets/custom_appbar.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, title: "Qibla"),
      body: Column(
        children: [],
      ),
    );
  }
}
