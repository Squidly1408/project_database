import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/profile.dart';
import '../screens/search.dart';
import '../screens/timeline.dart';
import '../screens/upload.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: const Color(0xff2ba84a),
      titleSpacing: 0,
      actions: [
        Row(
          children: [
            MediaQuery.of(context).size.width > 1000
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: IconButton(
                      onPressed: () {
                        if (mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
            MediaQuery.of(context).size.width > 1000
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: IconButton(
                      onPressed: () {
                        if (mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Timeline(),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.whatshot_outlined,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
            MediaQuery.of(context).size.width > 1000
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: IconButton(
                      onPressed: () {
                        if (mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Upload(),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
            MediaQuery.of(context).size.width > 1000
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: IconButton(
                      onPressed: () {
                        if (mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Search(
                                term: '',
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
            MediaQuery.of(context).size.width > 1000
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: IconButton(
                      onPressed: () {
                        if (mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Profile(),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.person_outline_rounded,
                        color: Colors.white,
                      ),
                    ),
                  )
                : const SizedBox(
                    width: 0,
                    height: 0,
                  ),
          ],
        ),
      ],
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xff040f0f),
      title: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: Image.asset('assets/images/Banner_right.png',
            fit: BoxFit.fitHeight),
      ),
    );
  }
}
