import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var password1 = TextEditingController();
  var password2 = TextEditingController();
  submit() {
    if (password1 != password2 && password1.text.length < 6) {
      return;
    } else {
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
              MaterialButton(
                onPressed: () {
                  submit();
                },
                color: const Color(0xff248232),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 75),
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
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
