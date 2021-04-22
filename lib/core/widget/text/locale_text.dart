import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../extensions/locale_extensions.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({Key? key, required this.text, this.style})
      : super(key: key);
  final String text;
  final style;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text.locale,
      style: style,
    );
  }
}
