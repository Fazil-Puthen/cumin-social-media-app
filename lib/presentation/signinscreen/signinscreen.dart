import 'package:cumin360/bloc/authbloc/auth_bloc.dart';
import 'package:cumin360/constants/constants.dart';
import 'package:cumin360/presentation/homescreen/homescreen.dart';
import 'package:cumin360/presentation/singupscreen/signupscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final emailcontroller=TextEditingController();
  final passwordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Center(
        child: SizedBox(
          width: screenwidth*0.8,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //brand logo
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/cuminsocial.png')
              ),
              box,

              //signin text
              Text('Sign in',style: submainfont,),
              box,

              //Email field
              TextFormField(
                style: subfont,
                controller: emailcontroller,
                decoration: InputDecoration(
                  
                  hintText: 'E-Mail',
                  hintStyle: subfont,

                ),
              ),
              box,

              //Password field
              TextFormField(
                obscureText: true,
                controller: passwordcontroller,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: subfont
                ),
              ),
              box,box,

              //login button
              GestureDetector(
                onTap: () {
                  context.read<AuthBloc>().add(SignIn(
                  email:emailcontroller.text.trim() ,
                  password:passwordcontroller.text.trim()));
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber
                  ),
                  child: Center(child: Text('Login',style: subfont,),),
                ),
              ),
              box,box,

              BlocListener<AuthBloc,AuthState>(listener: (context, state) {
                if(state is SigninSuccess
                ){
                  //    Navigator.pushAndRemoveUntil(
                  // context,MaterialPageRoute(builder: (ctx)=>const HomeSreen())
                  // ,(Route<dynamic> route) => false,);
                   Navigator.push(context,MaterialPageRoute(builder: (ctx)=>const HomeSreen()));
                }
              },child: 
              
              //the signin process
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if(state is SigninLoading){
                    return const CircularProgressIndicator(color: Colors.amber,);
                  }
                  else if(state is SigninError){
                    return Text(state.message,style:errorfont ,);
                  }
                return const SizedBox();
                },
              ),),
              box,box,
              

              //Register page navigate section
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a membe yet?',style:subfont),
                  const SizedBox(width: 10,),
                  InkWell(onTap:()=>Navigator.push(context,MaterialPageRoute(builder: (ctx)=>Signupscreen())),
                  child: Text('Register',style:submainlinkfont ,),)
                ],
              )
              
          
            ],
          ),
        ),
      ),
    );
  }
}