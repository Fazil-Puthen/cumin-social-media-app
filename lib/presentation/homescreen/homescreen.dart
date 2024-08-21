
import 'package:cumin360/bloc/profilebloc/profile_bloc.dart';
import 'package:cumin360/constants/constants.dart';
import 'package:cumin360/presentation/signinscreen/signinscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({super.key});

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchDetails());
  }

  int seletedindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appbar
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: SizedBox(
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, left: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                            backgroundColor: Colors.amber,
                            backgroundImage: AssetImage('assets/person.jpg')),
                       const  SizedBox(
                          width: 5,
                        ),
                        BlocBuilder<ProfileBloc, ProfileState>(
                          builder: (context, state) {
                            if(state is DetailsFetched){
                            return Text(
                              state.name,
                              style: subfont,
                            );}
                            else if(state is DetailLoading){
                              return const Text('Getting name...');
                            }
                            else{
                              return const SizedBox();
                            }
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => SigninScreen()),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: const Icon(Icons.logout_rounded)),
                    ),
                  ],
                ),
              ),
            )),

        body: body[seletedindex],

        //bottom navigation bar
        bottomNavigationBar: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                seletedindex = value;
              });
            },
            currentIndex: seletedindex,
            iconSize: 20,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.black,
            selectedLabelStyle: subfont,
            unselectedLabelStyle: subfont,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.feed),
                label: 'Feeds',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              )
            ]),
      ),
    );
  }
}
