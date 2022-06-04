part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const ROOT = _Paths.ROOT;
  static const INTRO = _Paths.INTRO;
  static const HOME = _Paths.HOME;
  static const AUTH = _Paths.AUTH;
  static const SIGNIN = _Paths.AUTH + _Paths.SIGNIN;
  static const SIGNUP = _Paths.AUTH + _Paths.SIGNUP;
  static const LOGIN = _Paths.LOGIN;
  static const SEARCH = _Paths.SEARCH;
  static const ADDNOVEL = _Paths.ADDNOVEL;
  static const PROFILE = _Paths.PROFILE;
  static const ADDSTORY = _Paths.ADDNEWNOVEL;
  static const WRITESTORY = _Paths.WRITECHAPTER;
  static const NOVELDETAIL = _Paths.NOVELDETAIL;
  static const NOVELREAD = _Paths.NOVELREAD;
}

abstract class _Paths {
  static const ROOT = '/';
  static const INTRO = '/intro';
  static const HOME = '/home';
  static const AUTH = '/auth';
  static const SIGNIN = '/signin';
  static const SIGNUP = '/signup';
  static const LOGIN = '/login';
  static const SEARCH = '/search';
  static const ADDNOVEL = '/addnovel';
  static const PROFILE = '/profile';
  static const ADDNEWNOVEL = '/addnewnovel';
  static const WRITECHAPTER = '/writechapter';
  static const NOVELDETAIL = '/noveldetail';
  static const NOVELREAD = '/novelread';
}
