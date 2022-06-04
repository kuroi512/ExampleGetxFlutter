class AppUrl {
  static const String baseUrl =
      // 'https://meetsocket.oyuntan.mn';
      'http://127.0.0.1:3000';

  static const String login = baseUrl + '/api/user/pg/login';
  static const String mongoUser = baseUrl + '/api/user/new';
  static const String currentLessonsStudent =
      baseUrl + '/api/pg/myLessons/student';
  static const String currentLessonsTeacher =
      baseUrl + '/api/pg/myLessons/teacher';
  static const String yourPost = baseUrl + '/api/lessonMessage/yourPost';
}
