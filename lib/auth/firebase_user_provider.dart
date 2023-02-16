import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ToistotTalteenFirebaseUser {
  ToistotTalteenFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

ToistotTalteenFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ToistotTalteenFirebaseUser> toistotTalteenFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ToistotTalteenFirebaseUser>(
      (user) {
        currentUser = ToistotTalteenFirebaseUser(user);
        return currentUser!;
      },
    );
