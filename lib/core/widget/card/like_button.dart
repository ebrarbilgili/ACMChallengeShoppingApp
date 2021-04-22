import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';

// ignore: must_be_immutable
class LikeButton extends StatefulWidget {
  LikeButton({Key? key, required this.isLiked}) : super(key: key);

  bool isLiked;

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: context.colorScheme.error,
      icon: FaIcon(widget.isLiked == false
          ? FontAwesomeIcons.heart
          : FontAwesomeIcons.solidHeart),
      onPressed: () {
        setState(() {
          widget.isLiked = !widget.isLiked;
        });
      },
    );
  }
}
