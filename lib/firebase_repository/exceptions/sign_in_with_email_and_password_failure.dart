class SignInWithEmailAndPasswordFailure {
  final String mesage;

  const SignInWithEmailAndPasswordFailure([this.mesage = "An error acurd"]);

  factory SignInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'week-password':
        return const SignInWithEmailAndPasswordFailure(
            'Please enter a storinger password');
      case 'invalid-e,ail':
        return const SignInWithEmailAndPasswordFailure(
            'Email is not valid or badly formatted');
      case 'email-already-in-use':
        return const SignInWithEmailAndPasswordFailure(
            'An accont already exsts for that email');
      case 'operation-not-allowed':
        return const SignInWithEmailAndPasswordFailure(
            'operation is not allowed. Please notact suport');
      case 'user-disabled':
        return const SignInWithEmailAndPasswordFailure(
            'This user has been disabled. Please contact suport for help');
      default:
        return const SignInWithEmailAndPasswordFailure();
    }
  }
}
