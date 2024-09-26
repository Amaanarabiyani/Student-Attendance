// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCKh-vdPuUuMCWirryzHtUlt40IlUPXrlo',
    appId: '1:505474907985:web:1ca6cc56b7a8f2f06a1d70',
    messagingSenderId: '505474907985',
    projectId: 'student-attendance-23419',
    authDomain: 'student-attendance-23419.firebaseapp.com',
    storageBucket: 'student-attendance-23419.appspot.com',
    measurementId: 'G-F860JPNJLC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBEnp5xUGw0bRdVqmIp4GLkwUeRqp2phbc',
    appId: '1:505474907985:android:c0437dd7ea5d9b526a1d70',
    messagingSenderId: '505474907985',
    projectId: 'student-attendance-23419',
    storageBucket: 'student-attendance-23419.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDuNXzsFR6GvZKWAwganTpp5WvNk-j14JQ',
    appId: '1:505474907985:ios:c14b1e29048221af6a1d70',
    messagingSenderId: '505474907985',
    projectId: 'student-attendance-23419',
    storageBucket: 'student-attendance-23419.appspot.com',
    iosBundleId: 'com.example.studentAttendance',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDuNXzsFR6GvZKWAwganTpp5WvNk-j14JQ',
    appId: '1:505474907985:ios:c14b1e29048221af6a1d70',
    messagingSenderId: '505474907985',
    projectId: 'student-attendance-23419',
    storageBucket: 'student-attendance-23419.appspot.com',
    iosBundleId: 'com.example.studentAttendance',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCKh-vdPuUuMCWirryzHtUlt40IlUPXrlo',
    appId: '1:505474907985:web:caccdc76a701e84d6a1d70',
    messagingSenderId: '505474907985',
    projectId: 'student-attendance-23419',
    authDomain: 'student-attendance-23419.firebaseapp.com',
    storageBucket: 'student-attendance-23419.appspot.com',
    measurementId: 'G-33F1M9KHXF',
  );
}