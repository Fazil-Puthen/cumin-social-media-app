import 'package:cumin360/bloc/authbloc/auth_bloc.dart';
import 'package:cumin360/constants/constants.dart';
import 'package:cumin360/presentation/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Signupscreen extends StatelessWidget {
  Signupscreen({super.key});

  final namecontroller=TextEditingController();
  final emailcontroller=TextEditingController();
  final passworcontroller=TextEditingController();

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

              //sign in text
              Text('Create an Account',style: submainfont,),
               box,

               //name field
              TextFormField(
                style: subfont,
                controller: namecontroller,
                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: subfont,

                ),
              ),
              box,

              //email field
              TextFormField(
                style: subfont,
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: 'E-Mail',
                  hintStyle: subfont,

                ),
              ),
              box,

              //password field
              TextFormField(
                style: subfont,
                controller: passworcontroller,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: subfont
                ),
              ),
              box,box,

              //register button
              InkWell(
                onTap: ()async {
                context.read<AuthBloc>().add(Addemail(email: emailcontroller.text.trim()));
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('name',namecontroller
                .text.trim());
                context.read<AuthBloc>().add(Signup(
                name: namecontroller.text.trim(),
                email: emailcontroller.text.trim(),
                password: passworcontroller.text.trim()));},
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.amber
                  ),
                  child: Center(child: Text('Register',style: subfont,),),
                ),
              ),
              box,box,

              //state handling section
               BlocListener<AuthBloc,AuthState>(listener: (context, state) {
                if(state is SignupSuccess
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
                  if(state is SignupLoading){
                    return const CircularProgressIndicator(color: Colors.amber,);
                  }
                  else if(state is SignupError){
                    return Text(state.message,style:errorfont,);
                  }
                return const SizedBox();
                },
              ),),
              box,box,

              //login page navigate text
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already a member',style:subfont),
                  const SizedBox(width: 10,),
                  InkWell(onTap:(){
                    Navigator.pop(context);
                  },
                  child: Text('Sign-in',style:submainlinkfont ,),)
                ],
              )
              
          
            ],
          ),
        ),
      ),
    );
  }
}