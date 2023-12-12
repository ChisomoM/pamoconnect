import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD0Yc_u_VqFa2B3W1qc7UfPSV9-65pVPq4",
            authDomain: "festiv8-7f79d.firebaseapp.com",
            projectId: "festiv8-7f79d",
            storageBucket: "festiv8-7f79d.appspot.com",
            messagingSenderId: "1069732906571",
            appId: "1:1069732906571:web:58a958630a4913724b2fce",
            measurementId: "G-RC0DX3CWSV"));
  } else {
    await Firebase.initializeApp();
  }
}
