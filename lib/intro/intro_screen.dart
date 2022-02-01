
import 'package:flutter/material.dart';
import 'package:workport/app_data.dart';
import 'package:workport/welcome.dart';

import 'intro_model.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<SliderModel> mySlides = [];
  int slideIndex = 0;
  late PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? AppData.red : AppData.greyLight,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    mySlides = getSlides();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                });
              },
              children: <Widget>[
                SlideTile(
                  imagePath: mySlides[0].getImageAssetPath(),
                  title: mySlides[0].getTitle(),
                ),
                SlideTile(
                  imagePath: mySlides[1].getImageAssetPath(),
                  title: mySlides[1].getTitle(),
                ),
                SlideTile(
                  imagePath: mySlides[2].getImageAssetPath(),
                  title: mySlides[2].getTitle(),
                ),
                SlideTile(
                  imagePath: mySlides[3].getImageAssetPath(),
                  title: mySlides[3].getTitle(),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  i == slideIndex
                      ? _buildPageIndicator(true)
                      : _buildPageIndicator(false),
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
              height: 70,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Container(
                color: Colors.transparent,
                margin: EdgeInsets.symmetric(vertical: 16),
                child: TextButton(
                  child: Text(
                    'SKIP',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.5,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    controller.animateToPage(3,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.linear);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WelcomePage()));
                  },
                ),
              ))
        ],
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  final String imagePath, title;
  SlideTile({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey[50],
        // image: DecorationImage(
        //   image: AssetImage(Strings.bg2),
        // ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.25),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: themeFont,
              color: AppData.red,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 22,
            ),
          ),
          SizedBox(height: 40),
          Container(
            decoration: BoxDecoration(color: Colors.transparent),
            child: Center(
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(100),
                child: Image.asset(imagePath, height: 290, width: 300),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
