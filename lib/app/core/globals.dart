library curUser;

import 'package:dio/dio.dart';
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import '/services/rest_connector.dart';
import 'package:get/get.dart' hide Response hide FormData hide MultipartFile;
import '../../constant.dart';
import 'dart:math';

bool isLoggedIn = false;

String role = "";

bool firstRun = false;
bool JWTvalidSessionRun = false;
bool SecureSavedLogin = false;

bool themeDark = false;

Map<String, dynamic> user = {};
String accessToken = "";
String refreshToken = "";

List<dynamic> myLessons = [];

Map<String, dynamic> curSlide = {};

Map<String, dynamic> teacherLessons = {};
/*
{"success":true,"message":{"issuccess":1,"aldaa":"","curlessons":[{"lessonid":1,"sem":0,"yr":2021,"id":1,"insertby":null,"inserttime":"2021-02-27T23:28:51.096","oschoolid":8,"lessoncode":"H10011","teachid":1908,"teacher_descr":null,"name":"Орос хэл","namee":null,"credit":4,"zorilgo":null,"prev_req":"1","descr":"Монгол Улсын Засгийн газрын дэмжлэг, Боловсрол, шинжлэх ухааны яамны захиалга, “КОВИД-19 цар тахлын хүрээнд боловсролын салбарын суурь үйлчилгээг дэмжих” НҮБ-ын нэгдсэн төсөл болон Япон Улсын Засгийн газрын санхүүжилтээр хэрэгжиж буй сургуулийн өмнөх болон ерөнхий боловсролын сургалтын хүрээнд","price":40000,"dis_price":0,"category":307,"type_active":0,"type_plan":121,"total_time":"2021-11-11T08:52:00","min_score":0,"grp_size":30,"img
*/
Future<void> reloadToken() async {
  final aTokenUrl = base_url + "api/user/refreshToken";
  String? rToken = GetStorage().read<String>('rtoken');
  Response responseToken = await RestConnector(
      url: aTokenUrl,
      requestType: "POST",
      clearCookies: true,
      dataType: "json",
      data: convert.jsonEncode({
        "refreshToken": rToken,
      })).postData();
  var result = jsonEncode((responseToken.data as Map<String, dynamic>));
  Map<String, dynamic> data = jsonDecode(result);
  GetStorage().write("atoken", data['accessToken']);
  accessToken = data['accessToken'];
  print('cur accesstoken --> ' + accessToken.toString());
}

/*
{"id":"1885","inserttime":"2021-06-21T11:53:19.566Z", "userid":null,
"mobile":"89785645","is_valid_mobile":0,"email":"student@gmail.com","is_valid_email":0,
"twitterid":null,"is_valid_twitter":0,"facebookid":null,"is_valid_facebook":0,
"name":"Сурагч","fname":"Хэрлэн","defaultid":"1","registern":null,"birthday":null,
"gender":1,"isurgumul":0,"isdagavar":0,"ismarried":0,"year_died":0,"descr":null,"phone":null,"work":null,
"email_confirm_key":null,"pwd_confirm_key":null,"mobile_confirm_key":null,"is_encoded":0,"keyver":1,"friendid":null,
"zoos":0,"is_uniface_user":0,"unifaceid":"A12365478","schoolid":null,"unischoolid":null,"friend_cnt":"0",
"friend_req_cnt":0,"xpassword":null,"x_email_key":null,"x_pwd_key":null,"is_xxk_user":0,"mpassword":null,
"last_login_ok":null,"last_login_err":null}
*/




/*
bool fbLogin = false;
bool vkLogin = false;
bool wechatLogin = false;
bool localLogin = false;

bool isFriendOvog = false;
bool isOvog = false;
bool isPage = false;

String newpid;
String join_ovog_result='';
String newovogname='';

String token;
String curOvogPid;
String treeTopID;

int curZip;
String friendId;

int uid;
int ssid;

int post_upload_scopeid=3;
int post_upload_purpose; // 0 - nutag, 1 - social, 2 - album, 3 - album from backup, 4 - Backup photos


Map<String, dynamic> ovog; // Current_OVOG
Map<String, dynamic> group; // Current Group
List<dynamic> topPeople; // Ovog top people
List<dynamic> guests; // Ovog top people

List<dynamic> ovogs;
List<dynamic> groups=[];
List<dynamic> friends;

bool canTreeEdit=false;
bool canTreeView=false;

List<dynamic> zipcodes = <dynamic>[];


*/
