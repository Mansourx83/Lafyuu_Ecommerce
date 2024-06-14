import 'package:ecommerce_trining/cubit/cubit_states.dart';
import 'package:ecommerce_trining/modules/home/homepage.dart';
import 'package:ecommerce_trining/modules/screens/accountpage.dart';
import 'package:ecommerce_trining/modules/screens/cartpage.dart';
import 'package:ecommerce_trining/modules/screens/explore.dart';
import 'package:ecommerce_trining/modules/screens/offerpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(initialState());


  //متغير هياخد رقم الانديكس الخاص بالايتم بوتم بار
  int currentIndex = 0;

  //هعمل ليست للصفحات اللي هتنقل فيها علشان امررها للبوتن بار
  List<Widget> screens = [
    HomePage(),
    ExplorePage(),
    CartPage(),
    OfferPage(),
    AccountPage(),
  ];

  void selectPaga (int index){
    currentIndex = index;
    emit(BottomNavBarState());
  }

  //sign in with google
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

}