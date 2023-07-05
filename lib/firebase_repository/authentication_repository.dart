import 'package:biathlon_3/firebase_repository/exceptions/sign_in_with_email_and_password_failure.dart';
import 'package:biathlon_3/pages/beforLogedIn/welcomscrean.dart';
import 'package:biathlon_3/pages/home.dart';
import 'package:biathlon_3/pages/beforLogedIn/signIn.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  final userId = FirebaseAuth.instance.currentUser?.uid;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInisialScrean);
  }

  _setInisialScrean(User? user) {
    user == null
        ? Get.offAll(() => WelcomScrean())
        : Get.offAll(() => HomeScrean());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => HomeScrean())
          : Get.offAll(() => WelcomScrean());
    } on FirebaseAuthException catch (e) {
      final ex = SignInWithEmailAndPasswordFailure.code(e.code);
      print(ex.mesage);
      throw ex;
    } catch (_) {
      const ex = SignInWithEmailAndPasswordFailure();
      print(ex.mesage);
      throw ex;
    }
  }

  Future<void> loginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
