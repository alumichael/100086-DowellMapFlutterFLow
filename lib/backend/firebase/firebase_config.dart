import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAsH8omDk8y0lSGLTW9YtZiiQ2MkmsF-uQ",
            authDomain: "livinglabmaps-98809.firebaseapp.com",
            projectId: "livinglabmaps-98809",
            storageBucket: "livinglabmaps-98809.appspot.com",
            messagingSenderId: "15839972586",
            appId: "1:15839972586:web:b863d970bc461731139b93",
            measurementId: "G-XR46HPE6Q4"));
  } else {
    await Firebase.initializeApp();
  }
}
