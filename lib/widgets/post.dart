import 'package:flutter/material.dart';

import 'package:project_database/screens/others_profile.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  IconData thumbsUp = Icons.thumb_up_alt_outlined;
  IconData thumbsDown = Icons.thumb_down_alt_outlined;
  var postUserPic = 'assets/images/transparent_colour_logo.png';
  var likeAmount = 4;
  var dislikeAmount = 1;
  var likesDislikes = true;
  var commentsOn = true;
  var commentsOpen = false;

  comments() {
    setState(() {
      commentsOpen = !commentsOpen;
    });
  }

  addLike() {
    setState(() {
      if (thumbsUp == Icons.thumb_up_alt_outlined) {
        thumbsUp = Icons.thumb_up_alt;
        thumbsDown = Icons.thumb_down_alt_outlined;
        likeAmount++;
      } else {
        thumbsUp = Icons.thumb_up_alt_outlined;
        likeAmount--;
      }
    });
  }

  addDisLike() {
    setState(() {
      if (thumbsDown == Icons.thumb_down_alt_outlined) {
        thumbsDown = Icons.thumb_down_alt;
        thumbsUp = Icons.thumb_up_alt_outlined;
        dislikeAmount++;
      } else {
        thumbsDown = Icons.thumb_down_alt_outlined;
        dislikeAmount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1.0),
                        child: MaterialButton(
                          onPressed: () {
                            if (mounted) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OthersProfile(),
                                ),
                              );
                            }
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(postUserPic),
                          ),
                        ),
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '(.........Title.........)',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '(...UserName...)',
                            style: TextStyle(
                                color: Color(0xff8d818c),
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  Visibility(
                    visible: MediaQuery.of(context).size.width > 500,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          '(..Time Stamp..)',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Image.asset(
                'assets/images/banner_dark.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '(....................................UserText.......................................)',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Visibility(
                  visible: likesDislikes,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: IconButton(
                                onPressed: () {
                                  addLike();
                                },
                                icon: Icon(thumbsUp, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                likeAmount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: IconButton(
                                onPressed: () {
                                  addDisLike();
                                },
                                icon: Icon(thumbsDown, color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                dislikeAmount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: commentsOn,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          child: const Text(
                            'Comments',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          onPressed: () {
                            comments();
                          },
                        ),
                      ),
                      Visibility(
                        visible: commentsOpen,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: ((context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1.0),
                                      child: MaterialButton(
                                        onPressed: () {
                                          if (mounted) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const OthersProfile(),
                                              ),
                                            );
                                          }
                                        },
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage:
                                              AssetImage(postUserPic),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '(...UserName...)',
                                            style: TextStyle(
                                                color: Color(0xff8d818c),
                                                fontSize: 8,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '(......................Comment.......................)',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
