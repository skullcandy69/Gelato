import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:market_place/scr/helpers/commons.dart';
import 'package:market_place/scr/helpers/screen_navigation.dart';
import 'package:market_place/scr/provider/auth.dart';
import 'package:market_place/scr/screens/home.dart';
import 'package:market_place/scr/screens/signup.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
//   keywords: <String>[
//     'eating',
//     'food',
//     'chicken',
//     'momos',
//     'shopping',
//     'cloths'
//   ],
//   contentUrl: 'https://zomato.com',
//   childDirected: false,
//   testDevices: <String>[], // Android emulators are considered test devices
// );
// String appunitid = 'ca-app-pub-9800396717606741/7529455055';
// BannerAd myBanner = BannerAd(
//   adUnitId: appunitid,
//   size: AdSize.banner,
//   targetingInfo: targetingInfo,
//   listener: (MobileAdEvent event) {
//     print("BannerAd event is $event");
//   },
// );

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // UserRepo userRepo = new UserRepo();
  // TextEditingController _email = TextEditingController();
  // TextEditingController _password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
   final GoogleSignIn googleSignIn = GoogleSignIn();
  // bool loading = false;
  // bool islogedin = false;
  // SharedPreferences preferences;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   isSignedIn();
  //   myBanner
  //     // typically this happens well before the ad is shown
  //     ..load()
  //     ..show(
  //       // Positions the banner ad 60 pixels from the bottom of the screen
  //       anchorOffset: 0.0,
  //       // Positions the banner ad 10 pixels from the center of the screen to the right
  //       horizontalCenterOffset: 00.0,
  //       // Banner Position
  //       anchorType: AnchorType.bottom,
  //     );
  // }

  // void isSignedIn() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   preferences = await SharedPreferences.getInstance();
  //   islogedin = await googleSignIn.isSignedIn();
  //   if (islogedin) {
  //     changeScreenRepacement(context, Home());
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  // }

  // Future handleSignIn() async {
  //   preferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     loading = true;
  //   });
  // }

  // @override
  // void dispose() {
  //   myBanner.dispose();
  //   myBanner = null;
  //   super.dispose();
  // }

  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: white,
      key: _key,
      body: authprovider.status == Status.Authenticating
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      'images/logo.png',
                      scale: 4,
                    ),
                    Center(
                      child: Text(
                        'WELCOME TO GELATO',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .8,
                        decoration: BoxDecoration(
                            border: Border.all(color: grey),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: authprovider.email,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                icon: Icon(Icons.email)),
                            validator: (String _email) {
                              if (_email == null) {
                                return 'can not be empty';
                              } else {
                                return '';
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .8,
                          decoration: BoxDecoration(
                              border: Border.all(color: grey),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: TextFormField(
                              controller: authprovider.password,
                              obscureText: true,
                              autovalidate: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  icon: Icon(Icons.lock)),
                            ),
                          ),
                        )),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('New User? Signup'),
                      ),
                      onTap: () {
                        //myBanner.dispose();
                        changeScreen(context, SignupScreen());
                      },
                    ),
                    RaisedButton(
                      onPressed: () async {
                        // dispose();

                        // userRepo
                        //     .signIn(_email.text, _password.text)
                        //     .then((FirebaseUser user) async {
                          // SharedPreferences prefs =
                          //     await SharedPreferences.getInstance();
                        //   prefs.setString('issignedin', 'true');
                          // prefs.setString('email', _email.text);
                        //   print("success");
                        //   Navigator.pushReplacement(
                        //       context,
                        //       new MaterialPageRoute(
                        //           builder: (context) => new Home()));
                        // }).catchError((e) => print(e));
                        if (!await authprovider.signIn()) {
                          _key.currentState.showSnackBar(SnackBar(
                            content: Text('Login failed'),
                          ));
                          return;
                        }
                        authprovider.clearController();
                        changeScreenRepacement(context, Home());
                      },
                      color: red,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(color: white),
                      ),
                    ),
                    _signInButton()
                  ],
                ),
              ),
            ),
    );
  }

  Future<String> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult = await _auth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    return 'signInWithGoogle succeeded: $user';
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Sign Out");
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.white,
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          changeScreenRepacement(context, Home());
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/google.jpg"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
