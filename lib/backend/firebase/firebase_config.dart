import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAK05XQPPDaE69Oi8iIu8z_md1XxMzQcR8",
            authDomain: "qrguardian-7c8c3.firebaseapp.com",
            projectId: "qrguardian-7c8c3",
            storageBucket: "qrguardian-7c8c3.appspot.com",
            messagingSenderId: "1033956762255",
            appId: "1:1033956762255:web:9cb97e2b462f664ff646fa",
            measurementId: "G-5DQ2BJDSLC"));
  } else {
    await Firebase.initializeApp();
  }
}
