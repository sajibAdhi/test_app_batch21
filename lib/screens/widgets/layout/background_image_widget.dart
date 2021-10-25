import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatefulWidget {
  const BackgroundImageWidget({
    Key? key,
    required Animation animation,
  })  : _animation = animation,
        super(key: key);

  final Animation _animation;

  @override
  _BackgroundImageWidgetState createState() => _BackgroundImageWidgetState();
}

class _BackgroundImageWidgetState extends State<BackgroundImageWidget> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          "https://cdn.pixabay.com/photo/2021/09/23/09/01/swan-6649194_960_720.jpg",
      placeholder: (context, url) => Image.asset(
        'assets/images/wallpaper.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        alignment: FractionalOffset(widget._animation.value, 0),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
      alignment: FractionalOffset(widget._animation.value, 0),
    );
  }
}
