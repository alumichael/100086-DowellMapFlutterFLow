import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAxLAc6DqZKXf2lo71F34XaDN0KuhdAiy0",
            authDomain: "dowell-maps.firebaseapp.com",
            projectId: "dowell-maps",
            storageBucket: "dowell-maps.appspot.com",
            messagingSenderId: "332318742979",
            appId: "1:332318742979:web:5c156146661188da84c576",
            measurementId: "G-3HEXZCS9K1"));
  } else {
    await Firebase.initializeApp();
  }
}
