import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class SignUpPage extends StatelessWidget{
  SignUpPage( {Key? key} ) : super(key: key);

  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController hobbyController = TextEditingController(text: '');

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
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state){
            if(state is AuthSuccess){
              Navigator.pushNamedAndRemoveUntil(context, '/bonus', (route) => false);
            } else if (state is AuthFailed){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      backgroundColor: kRedColor,
                      content: Text(state.error)
                  )
              );
            }
          },
          builder: (context, state) {

            if(state is AuthLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return CustomButton(
              title: 'Get Started',
              onPressed: () {
                context.read<AuthCubit>().signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    name: nameController.text,
                    hobby: hobbyController.text);
              },
            );
          }
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
              controller: nameController,
            ),
            CustomTextFormField(
              title: 'Email Address',
              hint: 'Your email address',
              controller: emailController,
            ),
            CustomTextFormField(
              title: 'Password',
              hint: 'Your password',
              obscureText: true,
              controller: passwordController,
            ),
            CustomTextFormField(
              title: 'Hobby',
              hint: 'Your hobby',
              controller: hobbyController,
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