import 'package:flutter/material.dart';

import '../widgets/footer.dart';
import '../widgets/header.dart';
import '../widgets/post.dart';

class ActivityFeed extends StatefulWidget {
  const ActivityFeed({super.key});

  @override
  State<ActivityFeed> createState() => _ActivityFeedState();
}

class _ActivityFeedState extends State<ActivityFeed> {
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
      body: const SizedBox(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Post(),
              Post(),
              Post(),
              Post(),
              Post(),
              Post(),
              Post(),
              Post(),
              Post(),
              Post(),
              Post(),
            ],
          ),
        ),
      ),
    );
  }
}
