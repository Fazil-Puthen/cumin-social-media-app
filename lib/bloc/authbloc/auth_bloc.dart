import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignIn>(signinevent);
    on<Signup>(signupevennt);
    on<Signout>(signoutevent);
    on<Addemail>(addemail);
  }

  FutureOr<void> signinevent(SignIn event, Emitter<AuthState> emit)async {
    emit(SigninLoading());
    try{
      final fire= FirebaseAuth.instance;
      await fire.signInWithEmailAndPassword(email: event.email, password:event.password);
      emit(SigninSuccess());
    }
    on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    emit(SigninError(message: e.code));
  } else if (e.code == 'wrong-password') {
    emit(SigninError(message: e.code));
  }
  else{
    emit(SigninError(message: 'incorrect username or password'));
  }
  }
}

  FutureOr<void> signupevennt(Signup event, Emitter<AuthState> emit)async {
    emit(SignupLoading());
    try {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: event.email,
    password: event.password,
  );
  emit(SignupSuccess());
} on FirebaseAuthException catch (e) {
  // emit(SignupError(message: 'not a valid input'));
  if (e.code == 'weak-password') {
    emit(SignupError(message:'The password provided is too weak.' ) );
  } else if (e.code == 'email-already-in-use') {
    emit(SignupError(message: 'The account already exists for that email.'));
  }
  else{
    emit(SignupError(message: 'Not a valid email'));
  }
} catch (e) {
  throw Exception(e);
}
  }

  FutureOr<void> signoutevent(Signout event, Emitter<AuthState> emit) async{
    try{
    await FirebaseAuth.instance.signOut();
    emit(SignoutSuccess());
    }
    on FirebaseAuthException catch (e){
      emit(SignoutError(message: 
      e.toString()));
    }

  }

  FutureOr<void> addemail(Addemail event, Emitter<AuthState> emit) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setString('email', event.email);
  }
}

