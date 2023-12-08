import 'package:flutter/material.dart';

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  var feedback = true;
  var comments = true;

  var title = TextEditingController();
  var descriptionText = TextEditingController();
  post() {
    if (title.text.isEmpty &&
        descriptionText.text.isEmpty &&
        title.text.length < 25 &&
        descriptionText.text.length < 90) {
      return;
    } else {
      // upload post
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8d818c),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                ),
                color: const Color(0xff040f0f),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: AppBar(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                        ),
                        automaticallyImplyLeading: false,
                        shadowColor: const Color(0xff2ba84a),
                        backgroundColor: const Color(0xff040f0f),
                        titleSpacing: 0,
                        title: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 1.0),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      'assets/images/transparent_colour_logo.png'),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: TextField(
                                        buildCounter: null,
                                        style: const TextStyle(
                                          color: Color(0xff248232),
                                        ),
                                        controller: title,
                                        maxLength: 25,
                                        cursorColor: const Color(0xff248232),
                                        decoration: InputDecoration(
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xff248232),
                                              width: 3,
                                            ),
                                          ),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0xff248232),
                                            ),
                                          ),
                                          hintText: 'Title',
                                          hintStyle: const TextStyle(
                                            color: Color(0xff248232),
                                          ),
                                          border: UnderlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: 250,
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              side: MaterialStateProperty.all(
                                const BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.image_outlined,
                                color: Colors.white,
                                size: 100,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          style: const TextStyle(
                            color: Color(0xff248232),
                          ),
                          controller: descriptionText,
                          maxLength: 90,
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
                            hintText: 'Desciption',
                            hintStyle: const TextStyle(
                              color: Color(0xff248232),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                'Likes & Dislikes',
                                style: TextStyle(
                                  color: Color(0xff248232),
                                ),
                              ),
                              Switch(
                                thumbColor: const MaterialStatePropertyAll(
                                  Color(0xff248232),
                                ),
                                trackOutlineColor:
                                    const MaterialStatePropertyAll(
                                  Color(0xff248232),
                                ),
                                inactiveTrackColor: const Color(0xff040f0f),
                                activeTrackColor: Colors.white,
                                value: feedback,
                                onChanged: (bool state) {
                                  setState(() {
                                    feedback = state;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                'Comments',
                                style: TextStyle(
                                  color: Color(0xff248232),
                                ),
                              ),
                              Switch(
                                thumbColor: const MaterialStatePropertyAll(
                                  Color(0xff248232),
                                ),
                                trackOutlineColor:
                                    const MaterialStatePropertyAll(
                                  Color(0xff248232),
                                ),
                                inactiveTrackColor: const Color(0xff040f0f),
                                activeTrackColor: Colors.white,
                                value: comments,
                                onChanged: (bool state) {
                                  setState(() {
                                    comments = state;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                post();
              },
              color: const Color(0xff248232),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: const Text(
                  'Post',
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
    );
  }
}
