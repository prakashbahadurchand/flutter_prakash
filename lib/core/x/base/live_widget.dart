import 'package:flutter/material.dart';

///
/// LiveWidget for performance improvements
/// by disabling setState feature :)
///
/// class MyLiveWidget extends LiveWidget {
///   const MyLiveWidget({required super.key});
///
///   @override
///   Widget live(BuildContext ctx) {
///     return Container();
///   }
///
///   @override
///   void dispose() {}

abstract class LiveWidget extends StatefulWidget {
  //final List<LiveData> disposable = [];

  const LiveWidget({required Key key}) : super(key: key);

  @override
  _LiveWidgetState createState() => _LiveWidgetState();

  void initState();

  Widget build(BuildContext ctx);

  void dispose();
}

class _LiveWidgetState extends State<LiveWidget> {
  @override
  void initState() {
    widget.initState();
    super.initState();
  }

  @override
  void dispose() {
    widget.dispose();
    /*if (widget.disposable.isNotEmpty) {
      for (LiveData data in widget.disposable) {
        data.dispose();
      }
    }*/
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    return widget.build(ctx);
  }
}
