import 'package:flutter/material.dart';

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

class TextIcon extends StatelessWidget {
  final IconData icon;
  final String text;
  final String preText;
  final double fontSize;
  final Color color;
  final bool showIcon;
  final Function onTap;

  TextIcon(
      {@required this.icon,
      @required this.text,
      this.preText = '',
      this.color = const Color(0XFF828282),
      this.fontSize = 16,
      this.showIcon = true,
      this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showIcon)
              Icon(
                icon,
                color: color,
              ),
            if (showIcon)
              SizedBox(
                width: 2,
              ),
            Text(
              preText,
              style: TextStyle(fontSize: fontSize, color: color),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              text,
              style: TextStyle(fontSize: fontSize, color: color),
            )
          ],
        ),
      );
}

class TextArrow extends StatelessWidget {
  final String text1;
  final String text2;
  final IconData icon;
  final double fontSize;
  final Color color;

  TextArrow(
      {@required this.text1,
      @required this.text2,
      this.icon,
      this.color = const Color(0XFF828282),
      this.fontSize = 16});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: color,
            ),
          if (icon != null)
            SizedBox(
              width: 2,
            ),
          Text(
            text1,
            style: TextStyle(fontSize: fontSize, color: color),
          ),
          SizedBox(
            width: 3,
          ),
          Icon(
            Icons.arrow_right,
            color: color,
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            text2,
            style: TextStyle(fontSize: fontSize, color: color),
          )
        ],
      );
}
