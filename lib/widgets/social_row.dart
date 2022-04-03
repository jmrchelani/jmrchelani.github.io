import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:personal_portfolio/constants.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Follow Me',
            style: TextStyle(
              color: kGreyColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          width: kDefaultPadding,
        ),
        SizedBox(
          width: 16,
          child: Divider(
            thickness: 1,
            color: kRedColor,
          ),
        ),
        SizedBox(
          width: kDefaultPadding,
        ),
        SocialRowBtn(
          icon: FontAwesomeIcons.linkedinIn,
          onPressed: () {},
        ),
        SizedBox(
          width: kDefaultPadding / 2,
        ),
        SocialRowBtn(
          onPressed: () {},
          icon: FontAwesomeIcons.facebookF,
        ),
        SizedBox(
          width: kDefaultPadding / 2,
        ),
        SocialRowBtn(
          onPressed: () {},
          icon: FontAwesomeIcons.twitter,
        ),
        SizedBox(
          width: kDefaultPadding / 2,
        ),
        SocialRowBtn(
          onPressed: () {},
          icon: FontAwesomeIcons.instagram,
        ),
      ],
    );
  }
}

class SocialRowBtn extends StatefulWidget {
  const SocialRowBtn({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final void Function() onPressed;

  @override
  State<SocialRowBtn> createState() => _SocialRowBtnState();
}

class _SocialRowBtnState extends State<SocialRowBtn> {
  var _hovering = false;

  _hover(bool b) {
    setState(() {
      _hovering = b;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _hover(true),
      onHover: (_) => _hover(true),
      onExit: (_) => _hover(false),
      child: IconButton(
        onPressed: widget.onPressed,
        icon: FaIcon(
          widget.icon,
          size: 18,
          color: _hovering ? kRedColor : kGreyColor,
        ),
      ),
    );
  }
}
