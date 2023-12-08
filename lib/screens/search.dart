import 'package:flutter/material.dart';

import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/post.dart';

class Search extends StatefulWidget {
  const Search({super.key, required this.term});

  final String term;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var searchController = TextEditingController();

  search(String term) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff8d818c),
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
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
                height: 70,
                color: const Color(0xff040f0f),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextFormField(
                    onSaved: (term) {
                      search(term.toString());
                    },
                    controller: searchController,
                    style: const TextStyle(
                      color: Color(0xff248232),
                    ),
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
                      hintText: 'Search by Catagory...',
                      hintStyle: const TextStyle(
                        color: Color(0xff248232),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              const Post(),
              const Post(),
              const Post(),
              const Post(),
              const Post(),
              const Post(),
              const Post(),
              const Post(),
              const Post(),
              const Post(),
              const Post(),
            ],
          ),
        ),
      ),
    );
  }
}
