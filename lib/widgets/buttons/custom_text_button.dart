import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Widget pageRoute;
  final String text;
  const CustomTextButton(
      {Key? key, required this.pageRoute, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => pageRoute));
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
