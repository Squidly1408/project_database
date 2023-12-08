class OtherUser {
  String userId = 'TEST021408';
  String username = '(.........Username.........)';
  String bio =
      '(.................................................................................Insert Bio.................................................................................)';
  String profilePic = 'assets/images/transparent_colour_logo.png';
  bool isTeacher = true;
  bool isAdmin = true;
  double followerCount = 4;
  double projectCount = 7;

  updateUser(newUserId, newUserName, newBio, newIsTeacher, newIsAdmin,
      newFollowerCount, newProjectCount) {
    userId = newUserId;
    username = newUserName;
    bio = newBio;
    isTeacher = newIsTeacher;
    isAdmin = newIsAdmin;
    followerCount = newFollowerCount;
    projectCount = newProjectCount;
  }
}
