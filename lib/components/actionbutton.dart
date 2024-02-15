import 'package:flutter/cupertino.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({Key? key, required this.onPressed, required this.icon})
      : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: const Color.fromARGB(255, 234, 214, 244),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      borderRadius: BorderRadius.circular(40),
      onPressed: onPressed,
      child: Icon(icon, color: const Color.fromARGB(255, 102, 51, 153)),
    );
  }
}
