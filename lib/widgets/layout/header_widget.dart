import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String headerTitle;
  final String headerSubTitle;
  final String headerButtonTitle;
  final pageRoute;

  const HeaderWidget(
      {Key? key,
      required this.headerTitle,
      required this.headerSubTitle,
      required this.headerButtonTitle,
      this.pageRoute = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: _size.height * 0.1),
          Text(
            headerTitle,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: _size.height * 0.01),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: headerSubTitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextSpan(text: '    '),
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                (pageRoute == false) ? null : pageRoute,
                          ),
                        ),
                  text: headerButtonTitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: _size.height * 0.01),
        ],
      ),
    );
  }
}
