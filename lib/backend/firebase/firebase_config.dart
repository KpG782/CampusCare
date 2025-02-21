import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCdBsY4F-cToNlXHYeDDOQ2jqEB80qiBso",
            authDomain: "campus-care-izsd1a.firebaseapp.com",
            projectId: "campus-care-izsd1a",
            storageBucket: "campus-care-izsd1a.appspot.com",
            messagingSenderId: "91424880060",
            appId: "1:91424880060:web:d20b48e717304c20e2e7b9"));
  } else {
    await Firebase.initializeApp();
  }
}
