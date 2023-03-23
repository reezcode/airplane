import 'package:airplane/ui/pages/choose_seat_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/interest_item.dart';
import 'package:airplane/ui/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class DetailPage extends StatelessWidget{
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget backgroundImage(){
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/image_destination1.png'
            ),
            fit: BoxFit.cover,
          )
        ),
      );
    }

    Widget customShadow(){
      return Container(
        height: 214,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 236,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ]
          )
        ),
      );
    }

    Widget content(){
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Column(
          children: [
            // EMBLEM
            Container(
              width: 108,
              height: 24,
              margin: EdgeInsets.only(
                top: 30,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_emblem.png'
                  )
                )
              ),
            ),
            // TITLE
            Container(
              margin: EdgeInsets.only(
                top: 256
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lake Ciliwung',
                          style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Tangerang',
                          style: whiteTextStyle.copyWith(
                            fontWeight: light,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
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
                        '4.8',
                        style: whiteTextStyle.copyWith(
                            fontWeight: medium
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // DESCRIPTION
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 30,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30
              ),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ABOUT
                  Text(
                    'About',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Jinja Karya menjadikan tempat Bali.',
                    style: blackTextStyle.copyWith(
                      height: 2,
                    ),
                  ),
                  // PHOTOS
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Photos',
                    style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      PhotoItem(imageUrl: 'assets/image_photo1.png'),
                      PhotoItem(imageUrl: 'assets/image_photo2.png'),
                      PhotoItem(imageUrl: 'assets/image_photo3.png')
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Interests',
                    style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      InterestItem(text: 'Kids Part'),
                      InterestItem(text: 'City Museum'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InterestItem(text: 'Honor Bridge'),
                      InterestItem(text: 'Central Mall'),
                    ],
                  )
                ],
              ),
            ),

            // PRICE & BOOK BUTTON
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 30
              ),
              width: double.infinity,
              child: Row(
                children: [
                  // PRICE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IDR 2.500.000',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'per orang',
                          style: greyTextStyle.copyWith(
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                  ),
                  // BOOK BUTTON
                  CustomButton(
                      width: 170,
                      title: 'Book Now',
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ChooseSeatPage()));
                      },
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        ),
      ),
    );
  }


}