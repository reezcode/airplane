import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';

class ChooseSeatPage extends StatelessWidget{
  const ChooseSeatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget title(){
      return Container(
        margin: EdgeInsets.only(
          top: 50
        ),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 24
          ),
        ),
      );
    }

    Widget seatStatus(){
      return Container(
        margin: EdgeInsets.only(
          top: 30
        ),
        child: Row(
          children: [
            // NOTE: AVAILABLE
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/icon_available.png'
                  )
                )
              ),
            ),
            Text(
              'Available',
              style: blackTextStyle,
            ),
            // NOTE: SELECTED
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(left: 10,right: 6),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/icon_selected.png'
                      )
                  )
              ),
            ),
            Text(
              'Selected',
              style: blackTextStyle,
            ),
            // NOTE: UNSELECTED
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(left: 10,right: 6),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/icon_unavailable.png'
                      )
                  )
              ),
            ),
            Text(
              'Unavailable',
              style: blackTextStyle,
            )
          ],
        ),
      );
    }

    Widget selectSeat(){

      Widget indicatorName({
        required String name
      }){
        return Container(
          width: 48,
          height: 48,
          child: Center(
            child: Text(
              name,
              style: greyTextStyle.copyWith(
                  fontSize: 16
              ),
            ),
          ),
        );
      }

      return Container(
        margin: EdgeInsets.only(top: 30),
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 30
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            // NOTE: SEAT INDICATORS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                indicatorName(name: 'A'),
                indicatorName(name: 'B'),
                indicatorName(name: ' '),
                indicatorName(name: 'C'),
                indicatorName(name: 'D')
              ],
            ),
            // NOTE: SEAT ITEM
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 2),
                  SeatItem(status: 2),
                  indicatorName(name: '1'),
                  SeatItem(status: 0),
                  SeatItem(status: 2),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                  indicatorName(name: '2'),
                  SeatItem(status: 0),
                  SeatItem(status: 2),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 1),
                  SeatItem(status: 1),
                  indicatorName(name: '3'),
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 0),
                  SeatItem(status: 2),
                  indicatorName(name: '4'),
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                  indicatorName(name: '5'),
                  SeatItem(status: 2),
                  SeatItem(status: 0),
                ],
              ),
            ),

            // NOTE: YOUR SEAT
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your seat',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'A3, B3',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 16
                    ),
                  )
                ],
              ),
            ),

            // NOTE: TOTAL
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: greyTextStyle.copyWith(
                      fontWeight: light,
                    ),
                  ),
                  Text(
                    'IDR 540.000.000',
                    style: purpleTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 16
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget checkoutButton(){
      return CustomButton(
          title: 'Continue to Checkout',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage()));
          },
          margin: EdgeInsets.only(top: 30, bottom: 46),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          checkoutButton()
        ],
      ),
    );
  }


}