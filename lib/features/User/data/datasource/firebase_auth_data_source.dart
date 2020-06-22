import 'package:clean_architecture_example/core/const/twitter_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseAuthDataSource {
//Google signIn
  Future<FirebaseUser> signIn();

//Facebook signIn
  Future<FirebaseUser> signInFacebook();

//Twitter signIn
  Future<FirebaseUser> signInTwitter();

//Google signOut
  signOut();

//Facebook signOut
  signOutFacebook();

//Twitter signOut
  signOutTwitter();
}

class FirebaseAuthDataSourceImpl implements FirebaseAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FacebookLogin facebookSignIn = FacebookLogin();
  final TwitterLogin twitterSignIn = TwitterLogin(
      consumerKey: TwitterConst.TWITTER_API,
      consumerSecret: TwitterConst.TWITTER_SECRET);

  @override
  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final user = (await _auth
        .signInWithCredential(credential)
        .catchError((error) => error));
    return user.user;
  }

  @override
  Future<FirebaseUser> signInFacebook() async {
    final fabookSignInAuthentication = await facebookSignIn.logIn(['email']);
    if (fabookSignInAuthentication.status != FacebookLoginStatus.loggedIn) {
      return null;
    }
    final AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: fabookSignInAuthentication.accessToken.token);
    final user = (await _auth.signInWithCredential(credential));
    return user.user;
  }

  @override
  Future<FirebaseUser> signInTwitter() async {
    final twitterSignInAuthentication = await twitterSignIn.authorize();
    if (twitterSignInAuthentication.status != TwitterLoginStatus.loggedIn) {
      return null;
    }
    final session = twitterSignInAuthentication.session;
    final AuthCredential credential = TwitterAuthProvider.getCredential(
        authToken: session.token, authTokenSecret: session.secret);

    final user = (await _auth.signInWithCredential(credential));

    return user.user;
  }

  @override
  signOut() async {
    await _auth.signOut();
    googleSignIn.signOut();
    print("Sesiones cerradas");
  }

  @override
  signOutFacebook() async {
    await _auth.signOut();
    facebookSignIn.logOut();
  }

  @override
  signOutTwitter() async {
    await _auth.signOut();
    twitterSignIn.logOut();
  }
}
