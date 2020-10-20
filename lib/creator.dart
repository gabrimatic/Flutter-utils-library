import 'package:flutter/widgets.dart';

class Creator extends StatefulWidget {
  final Widget child;

  Creator({this.child});

  @override
  _CreatorState createState() => _CreatorState();

  /// Add [Creator] widget as the root widget of your app and call [recreate] method to restart the app!
  static recreate(BuildContext context) =>
      context.findAncestorStateOfType<_CreatorState>().recreateApp();
}

class _CreatorState extends State<Creator> {
  var _key = UniqueKey();

  void recreateApp() => setState(() => _key = UniqueKey());

  @override
  Widget build(BuildContext context) =>
      Container(key: _key, child: widget.child);
}
