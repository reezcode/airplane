import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class PhotoItem extends StatelessWidget{

  final String imageUrl;

  const PhotoItem({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.only(
          right: 16
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                imageUrl
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(18)
      ),
    );
  }


}