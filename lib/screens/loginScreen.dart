import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/loginPage";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  bool isLogin = true;
  String frstPw = "";
  bool isLoading = false;
  FocusNode _myNode;
  FocusNode _secondNode;
  bool isBeingVerified = false;
  var _controller;
  var animation;
  bool isFinished = false;
  User user1;
  bool frstChck = false;
  GlobalKey<ScaffoldState> _scaffoldState;

  String email = "";
  String password = "";

  Timer _timer;
  Timer _isFinishedTimer;

  @override
  void initState() {
    super.initState();
    _myNode = FocusNode();
    _secondNode = FocusNode();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
    _myNode.dispose();
    _secondNode.dispose();
    if (_timer != null) {
      _timer.cancel();
    }

    _isFinishedTimer.cancel();
  }

  void checkAuth(String email, String password, bool isLogin, User user) async {
    if (this.isLogin) {
      var isValid = formKey.currentState.validate();
      if (isValid) {
        try {
          isLoading = true;
          await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: email.trim(), password: password.trim());
          isLoading = false;
          Navigator.of(context).pop();
        } on FirebaseAuthException catch (e) {
          if (e.code == "user-not-found") {
            print("Account not found");
          } else if (e.code == "wrong-password") {
            print("Incorrect Password");

            _scaffoldState.currentState.showSnackBar(SnackBar(
              content: Text(
                "Pogrešna Lozinka !",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Color(0xff990000),
            ));
          }
        } catch (e) {
          print(e.toString());
        }
      }
    }

    var isValid = formKey.currentState.validate();
    if (isValid) {
      if (this.isLogin == false) {
        formKey.currentState.validate();
        print(this.password + this.email);

        try {
          isLoading = true;
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(email: email, password: password);

          user = FirebaseAuth.instance.currentUser;
          if (!user.emailVerified) {
            await user.sendEmailVerification();
            isLoading = false;

            isBeingVerified = true;
            user.getIdToken(true);
            setState(() {});
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == "email-already-in-use") {
            print("Email already in use");
          }
        } catch (e) {
          print(e.toString());
        }
      }
    }
  }

  Widget buildBtn(String title, Function func, Icon icon) {
    return SizedBox(
      height: 60,
      width: 300,
      child: FlatButton.icon(
          onPressed: func,
          icon: icon,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: BorderSide(color: Colors.white, width: 2)),
          color: Colors.transparent,
          label: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          )),
    );
  }

  void animaT() async {
    if (isBeingVerified == true) {
      animation = Tween(begin: 0.3, end: 0.8).animate(_controller);
      while (isBeingVerified == true) {
        await _controller.forward();
        await _controller.reverse();
        setState(() {});
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    _scaffoldState = GlobalKey<ScaffoldState>();
    if (isBeingVerified == true) {
      animaT();
      user1 = FirebaseAuth.instance.currentUser;
      user1.reload();
      if (user1.emailVerified) {
        print("joi");
        setState(() {
          isBeingVerified = false;
          isFinished = true;
          frstChck = true;
        });
      }

      if (isFinished == true) {
        _isFinishedTimer = new Timer(Duration(seconds: 2), () {
          Navigator.of(context).pop();
        });
      }
    }

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        key: _scaffoldState,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "images/autoshop.jpg",
            ),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.70), BlendMode.multiply),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 50,
                  margin: EdgeInsets.all(15),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 3, color: Colors.white)),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10)),
                  height: 400,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.only(top: 60, left: 20, right: 20),
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                        child: isBeingVerified == false && frstChck == false
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 2.5),
                                    child: TextFormField(
                                        autofocus: false,
                                        onFieldSubmitted: (value) =>
                                            _myNode.requestFocus(),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        onSaved: (value) {
                                          email = value;
                                        },
                                        validator: (value) {
                                          if (!value.contains("@") ||
                                              value.isEmpty) {
                                            return "Molimo Unesite Važeću E-Mail Adresu!";
                                          }
                                          return null;
                                        },
                                        cursorColor:
                                            Theme.of(context).highlightColor,
                                        decoration: InputDecoration(
                                            labelText: "E-Mail",
                                            hintText: "Unesite Vaš E-Mail",
                                            labelStyle:
                                                TextStyle(color: Colors.black),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xff990000),
                                                    width: 2)),
                                            border: OutlineInputBorder(
                                                borderSide:
                                                    BorderSide(width: 2)))),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    autofocus: false,
                                    focusNode: _myNode,
                                    onFieldSubmitted: (value) =>
                                        _secondNode.requestFocus(),
                                    onSaved: (value) {
                                      password = value;
                                    },
                                    onChanged: (value) {
                                      frstPw = value;
                                    },
                                    validator: (value) {
                                      if (value.length < 6) {
                                        return "Vaša lozinka mora imati 6 ili više slova!";
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                                    cursorColor:
                                        Theme.of(context).highlightColor,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff990000),
                                                width: 2)),
                                        labelText: "Password",
                                        hintText: "Unesite Vaš Password",
                                        labelStyle:
                                            TextStyle(color: Colors.black),
                                        alignLabelWithHint: true,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(width: 2),
                                        ),
                                        fillColor: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  if (!isLogin)
                                    TextFormField(
                                      autofocus: false,
                                      focusNode: _secondNode,
                                      onSaved: (value) {
                                        password = value;
                                      },
                                      validator: (value) {
                                        if (value != frstPw) {
                                          return "Lozinke se ne podudaraju!";
                                        }
                                        return null;
                                      },
                                      obscureText: true,
                                      cursorColor:
                                          Theme.of(context).highlightColor,
                                      decoration: InputDecoration(
                                          hintText: "Potvrdite Vaš Password",
                                          labelText: "Confirm Password",
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xff990000),
                                                width: 2),
                                          ),
                                          alignLabelWithHint: true,
                                          labelStyle:
                                              TextStyle(color: Colors.black),
                                          fillColor: Colors.black,
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(width: 2),
                                          )),
                                    ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  FlatButton(
                                    child: Text(
                                      isLogin
                                          ? "Prijavite Se"
                                          : "Registrujte se ",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      FocusScope.of(context).unfocus();
                                      formKey.currentState.save();
                                      checkAuth(
                                          email, password, isLogin, user1);
                                    },
                                    color: Color(0xff990000),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  FlatButton(
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      setState(() {
                                        isLogin = !isLogin;
                                      });
                                    },
                                    child: Text(
                                      isLogin
                                          ? "Nemate Račun? Kliknite ovdje za Registraciju."
                                          : "Imate Račun ? Kliknite ovdje za Prijavu.",
                                      style: TextStyle(
                                          color: Color(0xff990000),
                                          fontSize: 13),
                                    ),
                                  )
                                ],
                              )
                            : Column(
                                children: <Widget>[
                                  Text(
                                    isBeingVerified == true
                                        ? "Za potvrdu registracije"
                                        : "Uspješno ste registrovani",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  isBeingVerified == true
                                      ? FadeTransition(
                                          opacity: animation,
                                          child: Icon(
                                            Icons.mail,
                                            color: Color(0xff990000),
                                            size: 190,
                                          ),
                                        )
                                      : Icon(
                                          Icons.tag_faces,
                                          color: Color(0xff990000),
                                          size: 190,
                                        ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    isBeingVerified == true
                                        ? "Provjerite Vašu E-mail adresu"
                                        : "Uživajte u kupovini ! ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
