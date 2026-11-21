import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  AuthServices.internal();

  static final AuthServices _instance = AuthServices.internal();

  factory AuthServices() {
    return _instance;
  }

  // akses firebase auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Memantau perubahan fungsi login
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Mendaftarkan akun baru
  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Error during sign up: ${e.code} - ${e.message}');
      return null;
    }
  }

  // Login akun yang sudah ada
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Error during sign in: ${e.code} - ${e.message}');
      return null;
    }
  }

  // Logout akun
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
