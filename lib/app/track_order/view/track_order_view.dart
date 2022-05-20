import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/app/models/user_orders.dart';
import 'package:flutter_shop/app/track_order/controller/track_order_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/routs/routs_names.dart';
import 'package:flutter_shop/services/current_session_service.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/texts.dart';

CurrentSessionService currentSessionService = CurrentSessionService();

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  // final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('orders').snapshots();

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('orders').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          List x = snapshot.data!.docs;
          UserOrders y;
          for (var i in x) {
            Map data = i.data()! as Map;

            print('data');
            print(data);
            print('currentSessionService.currentOrderId');
            print(currentSessionService.currentOrderId);
            if (data['order_id'] == currentSessionService.currentOrderId) {
              y = (UserOrders.fromJson(data));
              print(' found');
              print(
                  '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
              print(
                  '-------------------------------------------------------------------');
              print(y);
              print(y.orderState);
              print(y);

              print(

                  '+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++'
              );
              print(
                  '-------------------------------------------------------------------');
            } else {
              print('not found');
            }
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map data = document.data()! as Map;

              return ListTile(
                title: Text(data['order_state']),
                subtitle: Text(data['user_id']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}

class TrackOrderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<TrackOrderController>(
      onModelReady: (controller) async {},
      builder: (context, controller, child) {
        return Container(
          color: backgroundColor,
          child: SafeArea(
            bottom: false,
            right: false,
            left: false,
            child: Scaffold(
              backgroundColor: backgroundColor,
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                backgroundColor: backgroundColor,
                leading: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: blackColor,
                  ),
                  onPressed: () {
                    controller.navigation
                        .navigateToAndClearStack(RouteName.home);
                  },
                ),
                title: blackTitle3('Track your order'),
              ),
              body: Test(),
            ),
          ),
        );
      },
    );
  }
}
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   final Stream<int> _bids = (() {
//     late final StreamController<int> controller;
//     controller = StreamController<int>(
//       onListen: () async {
//         await Future<void>.delayed(const Duration(seconds: 1));
//         controller.add(1);
//         await Future<void>.delayed(const Duration(seconds: 1));
//         await controller.close();
//       },
//     );
//     return controller.stream;
//   })();
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTextStyle(
//       style: Theme.of(context).textTheme.headline2!,
//       textAlign: TextAlign.center,
//       child: Container(
//         alignment: FractionalOffset.center,
//         color: Colors.white,
//         child: StreamBuilder<int>(
//           stream: _bids,
//           builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//             List<Widget> children;
//             if (snapshot.hasError) {
//               children = <Widget>[
//                 const Icon(
//                   Icons.error_outline,
//                   color: Colors.red,
//                   size: 60,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 16),
//                   child: Text('Error: ${snapshot.error}'),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8),
//                   child: Text('Stack trace: ${snapshot.stackTrace}'),
//                 ),
//               ];
//             } else {
//               switch (snapshot.connectionState) {
//                 case ConnectionState.none:
//                   children = const <Widget>[
//                     Icon(
//                       Icons.info,
//                       color: Colors.blue,
//                       size: 60,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 16),
//                       child: Text('Select a lot'),
//                     )
//                   ];
//                   break;
//                 case ConnectionState.waiting:
//                   children = const <Widget>[
//                     SizedBox(
//                       width: 60,
//                       height: 60,
//                       child: CircularProgressIndicator(),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.only(top: 16),
//                       child: Text('Awaiting bids...'),
//                     )
//                   ];
//                   break;
//                 case ConnectionState.active:
//                   children = <Widget>[
//                     const Icon(
//                       Icons.check_circle_outline,
//                       color: Colors.green,
//                       size: 60,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 16),
//                       child: Text('\$${snapshot.data}'),
//                     )
//                   ];
//                   break;
//                 case ConnectionState.done:
//                   children = <Widget>[
//                     const Icon(
//                       Icons.info,
//                       color: Colors.blue,
//                       size: 60,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 16),
//                       child: Text('\$${snapshot.data} (closed)'),
//                     )
//                   ];
//                   break;
//               }
//             }
//
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: children,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
