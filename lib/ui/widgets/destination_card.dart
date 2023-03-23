import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import '../pages/detail_page.dart';

class DestinationCard extends StatelessWidget{

  final String title;
  final String city;
  final String imageUrl;
  final double rating;

  const DestinationCard({Key? key, required this.title, required this.city, required this.imageUrl, this.rating = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => DetailPage(),
        ));
      },
      child: Container(
        width: 200,
        height: 323,
        margin: EdgeInsets.only(
            left: defaultMargin
        ),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: kWhiteColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              margin: EdgeInsets.only(
                  bottom: 20
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          imageUrl
                      )
                  ),
                  borderRadius: BorderRadius.circular(18)
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(18)
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        margin: EdgeInsets.only(
                            left: 2,
                            right: 2
                        ),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/icon_star.png'
                                )
                            )
                        ),
                      ),
                      Text(
                        rating.toString(),
                        style: blackTextStyle.copyWith(
                            fontWeight: medium
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 10
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    city,
                    style: greyTextStyle.copyWith(
                        fontWeight: light
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}