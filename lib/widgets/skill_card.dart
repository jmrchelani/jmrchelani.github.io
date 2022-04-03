import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';

class SkillCard extends StatefulWidget {
  const SkillCard({
    Key? key,
    required this.image,
    required this.title,
    required this.style,
  }) : super(key: key);

  final int style;
  final Image image;
  final String title;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  var up = false;
  static const kDuration = Duration(milliseconds: 150);
  @override
  void initState() {
    super.initState();
    up = true;
    Future.delayed(kDuration, () {
      setState(() {
        up = !up;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var transformOne = Transform.translate(
      offset: Offset(up ? 5 : -5, up ? -5 : 5),
    ).transform;
    var transformTwo = Transform.translate(
      offset: Offset(up ? -5 : 5, up ? -5 : 5),
    ).transform;
    var transformThree = Transform.translate(
      offset: Offset(
        0,
        up ? 10 : -10,
      ),
    ).transform;
    return AnimatedContainer(
      duration: kDuration,
      transform: widget.style == 1
          ? transformOne
          : widget.style == 2
              ? transformTwo
              : transformThree,
      onEnd: () {
        Future.delayed(kDuration, () {
          setState(() {
            up = !up;
          });
        });
      },
      width: 200,
      height: 100,
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: kGreyColor.withOpacity(0.1),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(15),
          topRight: widget.style == 1 ? Radius.zero : const Radius.circular(15),
          bottomRight:
              widget.style == 2 ? Radius.zero : const Radius.circular(15),
          bottomLeft:
              widget.style == 3 ? Radius.zero : const Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            child: widget.image,
          ),
          const SizedBox(
            width: kDefaultPadding,
          ),
          SizedBox(
            width: 100,
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: kWhiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
