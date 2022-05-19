import 'package:flutter/material.dart';
import 'package:flutter_shop/app/track_order/controller/track_order_controller.dart';
import 'package:flutter_shop/base_view.dart';
import 'package:flutter_shop/utils/colors.dart';
import 'package:flutter_shop/utils/texts.dart';

class TrackOrderView extends StatefulWidget {
  @override
  State<TrackOrderView> createState() => _TrackOrderViewState();
}

class _TrackOrderViewState extends State<TrackOrderView> {
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
                    Icons.arrow_back_ios,
                    color: blackColor,
                  ),
                  onPressed: () {},
                ),
                title: blackTitle3('Track your order'),
              ),
              body: StreamBuilder(
                stream: controller.getCurrentOrder(),
                builder: (context, snapShot) {
                  if (snapShot.hasError) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: Colors.amber,
                    );
                  }
                  if (snapShot.hasData) {
                    Column(
                      children: [],
                    );
                  }
                  return Text('loding......');
                },
              ),
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
