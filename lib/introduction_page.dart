
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import 'main.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => SecondScreen()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('windows/assets/images/$assetName', width: width);
  }

  @override

  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        globalHeader: Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
            ),
          ),
        ),
        globalFooter: SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            child: const Text(
              'Let\'s go right away!',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            onPressed: () => _onIntroEnd(context),
          ),
        ),
        scrollPhysics: const BouncingScrollPhysics(), //Default is BouncingScrollPhysics
        pages: [
          PageViewModel(
            title: "Welcome to Job Finder!",
            body:
            "Complete the following steps to find a job as fast as possible.",
            image: Image.asset('windows/assets/images/job_search_icon.png'), //_buildImage('job_search_icon.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Step 1:",
            body:
            "Fill in all of the requested information.  This information won't be shared outside of our service.",
            image: _buildImage('filling_information.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Step 2:",
            body:
            "Sit back and relax!  We have an incredibly skilled team that will do all of the applying for you.  Once we find a job match, we'll notify you!",
            image: _buildImage('relaxing.png'),
            decoration: pageDecoration,
          ),
        ],
        rawPages: [
          //If you don't want to use PageViewModel you can use this
        ],
        //If you provide both rawPages and pages parameter, pages will be used.
        onChange: (e){
          // When something changes
        },
        onDone: () {
          // When done button is press
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder:
                    (context) =>
                    SecondScreen()
            ),
          );
        },
        onSkip: () {
          // You can also override onSkip callback
        },
        showSkipButton: true, //Is the skip button should be display
        skip: const Icon(Icons.skip_next),
        next: const Icon(Icons.forward),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),

        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            //activeColor: Theme.of(context).progressIndicatorTheme.color!,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}