import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:personal_portfolio/constants.dart';

class NavButton extends StatefulWidget {
  const NavButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  final String text;
  final void Function() onPressed;
  final bool isSelected;

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  bool _hovering = false;

  _mouseOnButton() {
    setState(() {
      _hovering = true;
    });
  }

  _mouseOffButton() {
    setState(() {
      _hovering = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(widget.isSelected);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: widget.onPressed,
          onHover: (b) => b == true ? _mouseOnButton() : _mouseOffButton(),
          child: Text(
            widget.text.toString(),
            style: TextStyle(
              color: widget.isSelected ? kRedColor : kGreyColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        AnimatedContainer(
          duration: kDefaultDuration,
          child: Row(
            children: [
              const SizedBox(
                width: 1,
              ),
              SizedBox(
                width: 16,
                child: Divider(
                  color: _hovering || widget.isSelected
                      ? kRedColor
                      : Colors.transparent,
                  thickness: 2,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
