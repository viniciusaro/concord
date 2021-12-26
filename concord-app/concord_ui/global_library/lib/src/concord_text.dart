import 'package:flutter/widgets.dart';

class ConcordText extends StatelessWidget {
  final String text;

  const ConcordText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
