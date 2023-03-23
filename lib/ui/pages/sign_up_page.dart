import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class SignUpPage extends StatelessWidget{
  const SignUpPage( {Key? key} ) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget title(){
      return Container(
        margin: EdgeInsets.only(
          top: 30
        ),
        child: Text(
          'Join us and get\nyour next journey',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection(){

      Widget submitButton(){
        return CustomButton(
            title: 'Get Started',
            onPressed: () {
              Navigator.pushNamed(context, '/bonus-page');
            },
        );
      }

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
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          children: [
            CustomTextFormField(
              title: 'Full Name',
              hint: 'Your full name',
            ),
            CustomTextFormField(
              title: 'Email Address',
              hint: 'Your email address',
            ),
            CustomTextFormField(
              title: 'Password',
              hint: 'Your password',
              obscureText: true,
            ),
            CustomTextFormField(
              title: 'Hobby',
              hint: 'Your hobby',
            ),
            SizedBox(
              height: 10,
            ),
            submitButton(),
          ],
        ),
      );
    }


    Widget tacButton(){
      return Center(
        child: Container(
          margin: EdgeInsets.only(
            top: 50,
            bottom: 73,
          ),
          child: Text(
            'Terms and Conditions',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            title(),
            inputSection(),
            tacButton(),
          ],
        ),
      ),
    );
  }
  
  
}