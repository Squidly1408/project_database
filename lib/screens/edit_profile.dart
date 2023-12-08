import 'package:flutter/material.dart';

import '../models/user.dart';
import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/post.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  submit() {}
  var bioController = TextEditingController(text: Users().bio);
  var userNameController = TextEditingController(text: Users().username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8d818c),
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.0801),
        child: const Header(),
      ),
      bottomNavigationBar: Visibility(
        visible: MediaQuery.of(context).size.width < 1000,
        child: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          child: const Footer(),
        ),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff040f0f),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  maxRadius: 45,
                                  backgroundImage: AssetImage(Users().photoUrl),
                                ),
                              ),
                              Center(
                                child: SizedBox(
                                  width: 150,
                                  child: TextField(
                                    cursorColor: Colors.white,
                                    controller: userNameController,
                                    maxLength: 16,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff040f0f),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TextField(
                        maxLines: null,
                        cursorColor: Colors.white,
                        controller: bioController,
                        maxLength: 400,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                color: const Color(0xff040f0f),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: MaterialButton(
                      onPressed: () {
                        submit();
                      },
                      color: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Color(0xff040f0f),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: const [
                  Post(),
                  Post(),
                  Post(),
                  Post(),
                  Post(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
