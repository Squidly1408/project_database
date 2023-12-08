import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var _firebase = FirebaseAuth.instance;
final userRef = FirebaseFirestore.instance.collection('/user');

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  var email = TextEditingController();
  var isAdmin = false;
  var isTeacher = false;
  var password1 = TextEditingController();
  var password2 = TextEditingController();

  createUserInFirestore() {
    userRef
        .doc(
      email.text.toLowerCase(),
    )
        .set({
      'id': email.text.toLowerCase(),
      'username': 'Enter UserName',
      'bio': 'Enter Bio',
      'photo_url': 'assets/images/transparent_colour_logo.png',
      'is_admin': isAdmin,
      'is_teacher': isTeacher,
      'follower_count': 0,
      'posts': 0,
    });
  }

  submit() {
    if (password1 != password2 &&
        password1.text.length < 6 &&
        (email.text.endsWith('@education.nsw.gov.au') ||
            email.text.endsWith('@det.nsw.edu.au'))) {
      return;
    } else {
      // try {
      //   _firebase.createUserWithEmailAndPassword(
      //     email: email.text,
      //     password: password1.text,
      //   );
      // } on FirebaseAuthException catch (error) {
      //   // if (error.code == 'email-already-in-use') {
      //   //   // ...
      //   // }
      //   ScaffoldMessenger.of(context).clearSnackBars();
      //   ScaffoldMessenger.of(context).showSnackBar(
      //     SnackBar(
      //       content: Text(error.message ?? 'Account creation failed.'),
      //     ),
      //   );
      // }
      createUserInFirestore();
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff040f0f),
      appBar: AppBar(
        shadowColor: const Color(0xff2ba84a),
        titleSpacing: 0,
        actions: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Image.asset('assets/images/banner_left.png',
                fit: BoxFit.fitHeight),
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff040f0f),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: IconButton(
            onPressed: () {
              if (mounted) {
                Navigator.pop(context, true);
              }
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Image.asset(
                  'assets/images/transparent_colour_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: const TextStyle(
                    color: Color(0xff248232),
                  ),
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: const Color(0xff248232),
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff248232),
                        width: 3,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff248232),
                      ),
                    ),
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                      color: Color(0xff248232),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: const TextStyle(
                    color: Color(0xff248232),
                  ),
                  controller: password1,
                  obscureText: true,
                  cursorColor: const Color(0xff248232),
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff248232),
                        width: 3,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff248232),
                      ),
                    ),
                    hintText: 'Password...',
                    hintStyle: const TextStyle(
                      color: Color(0xff248232),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  style: const TextStyle(
                    color: Color(0xff248232),
                  ),
                  controller: password2,
                  obscureText: true,
                  cursorColor: const Color(0xff248232),
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff248232),
                        width: 3,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff248232),
                      ),
                    ),
                    hintText: 'Re-enter Password...',
                    hintStyle: const TextStyle(
                      color: Color(0xff248232),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Admin',
                        style: TextStyle(
                          color: Color(0xff248232),
                        ),
                      ),
                      Switch(
                        thumbColor: const MaterialStatePropertyAll(
                          Color(0xff248232),
                        ),
                        trackOutlineColor: const MaterialStatePropertyAll(
                          Color(0xff248232),
                        ),
                        inactiveTrackColor: const Color(0xff040f0f),
                        activeTrackColor: Colors.white,
                        value: isAdmin,
                        onChanged: (bool state) {
                          setState(() {
                            isAdmin = state;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Teacher',
                        style: TextStyle(
                          color: Color(0xff248232),
                        ),
                      ),
                      Switch(
                        thumbColor: const MaterialStatePropertyAll(
                          Color(0xff248232),
                        ),
                        trackOutlineColor: const MaterialStatePropertyAll(
                          Color(0xff248232),
                        ),
                        inactiveTrackColor: const Color(0xff040f0f),
                        activeTrackColor: Colors.white,
                        value: isTeacher,
                        onChanged: (bool state) {
                          setState(() {
                            isTeacher = state;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              MaterialButton(
                onPressed: () {
                  submit();
                },
                color: const Color(0xff248232),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const Text(
                    'Create Account',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
