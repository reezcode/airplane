import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/widgets/booking_details_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {

  final TransactionModel transactionModel;

  const TransactionCard(this.transactionModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: 30
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: DESTINATION TILE
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(
                    right: 16
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        transactionModel.destination.imageUrl,
                      )
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactionModel.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      transactionModel.destination.city,
                      style: greyTextStyle.copyWith(
                          fontWeight: light
                      ),
                    ),
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
                    transactionModel.destination.rating.toString(),
                    style: blackTextStyle.copyWith(
                        fontWeight: medium
                    ),
                  )
                ],
              ),
            ],
          ),
          // NOTE: BOOKING DETAILS
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              'Booking Details',
              style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold
              ),
            ),
          ),

          // ITEMS
          BookingDetailsItem(
            title: 'Traveler',
            valueText: '${transactionModel.amountOfTraveler} person',
            color: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Seat',
            valueText: transactionModel.selectedSeats,
            color: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Insurance',
            valueText: transactionModel.insurance ? 'YES' : 'NO',
            color: transactionModel.insurance ? kGreenColor : kRedColor,
          ),
          BookingDetailsItem(
            title: 'Refundable',
            valueText: transactionModel.refundable ? 'YES' : 'NO',
            color: transactionModel.refundable ? kGreenColor : kRedColor,
          ),
          BookingDetailsItem(
            title: 'VAT',
            valueText: '${(transactionModel.vat * 100).toStringAsFixed(0)}%',
            color: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Price',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transactionModel.price),
            color: kBlackColor,
          ),
          BookingDetailsItem(
            title: 'Grand Total',
            valueText: NumberFormat.currency(
              locale: 'id',
              symbol: 'IDR ',
              decimalDigits: 0,
            ).format(transactionModel.grandTotal),
            color: kPrimaryColor,
          ),
        ],
      ),
    );
  }
}
