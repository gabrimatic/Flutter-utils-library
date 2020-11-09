import 'package:flutter/material.dart';
import 'package:gabrimatic_utils/gabrimatic_utils.dart';

void main() {
  runApp(Creator(child: ExampleApp()));
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Creator.recreate(context);
              },
              child: Text(
                'Restart App!',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                DateUtils(isJalali: false).showDatePickerDateTime(context);
              },
              child: Text(
                'Show datepicker',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                DateUtils(isJalali: false).showTheTimePicker(context);
              },
              child: Text(
                'Show timepicker',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                print(''.gIsEmpty); // returns: true
                print('null'.gIsEmpty); // returns: true
                print('    '.gIsEmpty); // returns: true
              },
              child: Text(
                'Check string',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                print('5'.addExtraZero); // returns: 05
              },
              child: Text(
                'Add zero',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                print(enDigitToFaDigit('123456789')); // returns: ٠۱۲۳۴۵۶۷۸۹
              },
              child: Text(
                'Convert english digits to farsi digits',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                shortIf(
                  p1: 'First value', // First parameter in condition
                  // p2: 'Second value', if p2 was null, p1 returns
                  returnValue: 'First is Second',
                );
              },
              child: Text(
                'Short if',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                exitApp();
              },
              child: Text(
                'Exit!',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
