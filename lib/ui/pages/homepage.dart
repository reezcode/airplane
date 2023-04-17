import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/models/destination_model.dart';
import 'package:airplane/ui/widgets/destination_card.dart';
import 'package:airplane/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget header(){
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context,state) {
          if(state is AuthSuccess){
            return Container(
              margin: EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  top: 30
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Helow,\n${state.user.name}!',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Where to fly today?',
                          style: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: light
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/image_profile.png'
                          )
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text(
                'Mohon maaf halaman tidak dapat dimuat\nMohon untuk membuka ulang aplikasi'
              ),
            );
          }
        }
      );
    }

    Widget popularDestination(List<DestinationModel> destinations){
      return Container(
        margin: EdgeInsets.only(
          top: 30
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations.map((DestinationModel destinationModel){
              return DestinationCard(destinationModel);
            }).toList(),
          ),
        ),
      );
    }

    Widget newDestination(List<DestinationModel> destination){
      return Container(
        margin: EdgeInsets.only(
          top:30,
          left: defaultMargin,
          right: defaultMargin,
          bottom: 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Column(
              children: destination.map((DestinationModel destinationModel){
                return DestinationTile(destinationModel);
              }).toList(),
            )
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state){
        if(state is DestinationFailed){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text('Homepage Gagal Dimuat'),
            )
          );
        }
      },
      builder: (context, state) {

        if(state is DestinationSuccess){
          return ListView(
            children: [
              header(),
              popularDestination(state.destinations),
              newDestination(state.destinations),
            ],
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}