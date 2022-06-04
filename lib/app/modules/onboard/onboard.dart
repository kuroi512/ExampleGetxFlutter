import 'package:exampleapp/app/modules/home/home_view.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../app/modules/login/screens/login_screen.dart';
import '../../../../app/modules/login/screens/signup_screen.dart';
import '../../../../constant.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();

    super.dispose();
  }

  bool isLastPage = false;

  List<Map<String, dynamic>> sliderList = [
    {
      "icon": 'images/onboard1.png',
      "title": 'Өөрийн дуртай төрлийн ямар ч зохиол бичих боломж',
      "description":
          'Платформ ашиглагч хүн бүхэн өөрсдийн дуртай зохиолоо бичиж олонд хүргэх боломжтой',
    },
    {
      "icon": 'images/onboard2.png',
      "title": 'Бусад хүмүүсийн бичсэн бүхий л төрл ийн зохиолыг унших боломж',
      "description":
          'Хүссэн төрлөөрөө хайгаад тухайн төрлийн бүх зохиолыг унших боломжтой. Мэдээж та өөрөө ч зохиол бичих боломжтой',
    },
    {
      "icon": 'images/onboard3.png',
      "title": 'Зохиосон зохиолоороо орлого олох боломж',
      "description":
          'Хамгийн их уншигчтай зохиолын зохиолчид өөрсдийн зохиолоор орлого олох боломж',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: height * 0.3, top: height * 0.1),
        child: PageView(
          controller: pageController,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            PageView.builder(
              itemCount: sliderList.length,
              controller: pageController,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    Container(
                      height: height * 0.4,
                      width: width,
                      child: Image.asset(
                        sliderList[index]['icon'],
                        fit: BoxFit.fitWidth,
                        width: context.width() - 150,
                        // height: 340,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 10.0, top: 15.0, bottom: 15.0),
                      child: Text(
                        sliderList[index]['title'].toString(),
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      // ignore: sized_box_for_whitespace
                      child: Container(
                        width: context.width(),
                        child: Text(
                          sliderList[index]['description'].toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: GoogleFonts.roboto(
                            fontSize: 14.0,
                            color: kGreyTextColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.only(top: 20),
        height: height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const SwapEffect(
                  spacing: 16,
                  dotColor: kGreyTextColor,
                  activeDotColor: kMainColor,
                ),
                // onDotClicked: (index) => pageController.animateToPage(
                //   index,
                //   duration: const Duration(milliseconds: 500),
                //   curve: Curves.easeIn,
                // ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 40),
                  primary: Colors.purple,
                  onPrimary: Colors.purple.shade800,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Нэвтрэх',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 40),
                  primary: Colors.purple,
                  onPrimary: Colors.purple.shade800,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Бүртгүүлэх',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(),
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
