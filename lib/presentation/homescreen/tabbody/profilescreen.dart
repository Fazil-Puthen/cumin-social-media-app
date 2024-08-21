import 'package:cumin360/bloc/profilebloc/profile_bloc.dart';
import 'package:cumin360/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchDetails());
  }

  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screewidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screewidth,
      height: screenheight,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if(state is DetailLoading){
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber,),
            );
          }
          else if(state is ErrorFetching){
            return Center(
              child: Text(state.message,style: errorfont,),
            );
          }
          else if(state is DetailsFetched){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/person.jpg'),
              ),
              box,
              box,
              Text(
                state.name,
                style: submainfont,
              ),
              box,
              Text(
                state.email,
                style: submainfont,
              )
            ],
          );
          }
          else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}
