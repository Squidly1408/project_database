import 'package:flutter/material.dart';
import 'package:project_database/widgets/post.dart';

import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../models/default _searchs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var skillsScrollController = ScrollController();

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
                height: 80,
                color: const Color(0xff040f0f),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: RawScrollbar(
                    isAlwaysShown: true,
                    thumbColor: const Color(0xff2ba84a),
                    controller: skillsScrollController,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: skillsScrollController,
                      itemCount: 19,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: SizedBox(
                            width: 120,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(defaultSearchs[index].toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: ((context, index) {
                  return const Post();
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
