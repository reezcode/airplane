import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget{

  final DestinationModel destinationModel;

  const ChooseSeatPage(this.destinationModel, {Key? key}) : super(key: key);

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

      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
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
                      SeatItem(id: 'A1',),
                      SeatItem(id: 'B1'),
                      indicatorName(name: '1'),
                      SeatItem(id: 'C1'),
                      SeatItem(id: 'D1'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A2',isAvailable: false,),
                      SeatItem(id: 'B2'),
                      indicatorName(name: '2'),
                      SeatItem(id: 'C2'),
                      SeatItem(id: 'D2'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A3'),
                      SeatItem(id: 'B3', isAvailable: false,),
                      indicatorName(name: '3'),
                      SeatItem(id: 'C3'),
                      SeatItem(id: 'D3'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A4'),
                      SeatItem(id: 'B4'),
                      indicatorName(name: '4'),
                      SeatItem(id: 'C4'),
                      SeatItem(id: 'D4'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(id: 'A5'),
                      SeatItem(id: 'B5'),
                      indicatorName(name: '5'),
                      SeatItem(id: 'C5'),
                      SeatItem(id: 'D5'),
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
                        state.join(', '),
                        overflow: TextOverflow.ellipsis,
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
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(state.length * destinationModel.price),
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
      );
    }

    Widget checkoutButton(){
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
              title: 'Continue to Checkout',
              onPressed: () {

                int price = destinationModel.price * state.length;

                Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutPage(
                    TransactionModel(
                      destination: destinationModel,
                      amountOfTraveler: state.length,
                      selectedSeats: state.join(', '),
                      insurance: true,
                      refundable: false,
                      vat: 0.45,
                      price: price,
                      grandTotal: price + (price * 0.45).toInt()
                    ))
                ));
              },
              margin: EdgeInsets.only(top: 30, bottom: 46),
          );
        }
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