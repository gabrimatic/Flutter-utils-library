import 'package:flutter/widgets.dart';

class Creator extends StatefulWidget {
  final Widget child;

  Creator({this.child});

  @override
  _CreatorState createState() => _CreatorState();

  static recreate(BuildContext context) =>
      context.findAncestorStateOfType<_CreatorState>().restartApp();
}

class _CreatorState extends State<Creator> {
  var _key = UniqueKey();

  void restartApp() => setState(() => _key = UniqueKey());

  @override
  Widget build(BuildContext context) =>
      Container(key: _key, child: widget.child);
}
