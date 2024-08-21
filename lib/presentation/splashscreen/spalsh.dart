import 'package:cumin360/bloc/authbloc/auth_bloc.dart';
import 'package:cumin360/constants/constants.dart';
import 'package:cumin360/presentation/signinscreen/signinscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final user=FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final logged=user.currentUser;
    bool islogged=logged!=null;
    String userid=islogged?user.currentUser!.email!:'no';
   context.read<AuthBloc>().add(Addemail(email: userid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterSplashScreen.fadeIn(
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 5),
          childWidget: SizedBox(
            width: 300,
            height: 300,
            child: Column(
              children: [
                SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/cuminsocial.png')),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Konnect',
                  style: mainfont,
                ),
                const SizedBox(height: 10,),
                const CircularProgressIndicator(
                  semanticsLabel: 'loading',
                  color: Colors.amber,
                  strokeWidth: 2,
                )
              ],
            ),
          ),
          nextScreen:SigninScreen(),
        ),
      ),
    );
  }
}