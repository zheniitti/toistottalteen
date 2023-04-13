import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAVXMdfQu6RegURnSjRrvYEUqTJRZwdb1Q",
            authDomain: "toistot-talteen.firebaseapp.com",
            projectId: "toistot-talteen",
            storageBucket: "toistot-talteen.appspot.com",
            messagingSenderId: "869597166249",
            appId: "1:869597166249:web:4037506aaf2ca040f447b8",
            measurementId: "G-GX32VJ3CBT"));
  } else {
    await Firebase.initializeApp();
  }
}
