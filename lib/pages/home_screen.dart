import 'package:flutter/material.dart';
import 'package:responsive_ui/images.dart';
import 'package:responsive_ui/size_config.dart';
import 'package:responsive_ui/strings.dart';
import 'package:responsive_ui/styling.dart';

import '../responsive_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor,
      body: SafeArea(
        bottom: false,
        left: true,
        right: true,
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(3.0 * SizeConfig.heightMultiplier),
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FractionallySizedBox(
                      heightFactor: SizeConfig.isMobilePortrait ? 0.25 : 0.35,
                      alignment: Alignment.bottomCenter,
                      child: Tabs(),
                    ),
                    ResponsiveWidget(
                      portraitLayout: TopContainerPortrait(),
                      landscapeLayout: TopContainerLandscape(),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(
                    maxHeight: 100 * SizeConfig.heightMultiplier),
                decoration: BoxDecoration(
                  color: AppTheme.appBackgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 2.0 * SizeConfig.widthMultiplier,
                        vertical: 1 * SizeConfig.heightMultiplier,
                      ),
                      child: Text(
                        Strings.popular,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            PortraitCard(
                              imagePath: Images.graphicDesigner,
                              lessonName: Strings.graphicDesigner,
                              numberOfCourses: "234",
                            ),
                            PortraitCard(
                              imagePath: Images.swimming,
                              lessonName: Strings.swimming,
                              numberOfCourses: "34",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.0 * SizeConfig.widthMultiplier,
                          vertical: 1 * SizeConfig.heightMultiplier),
                      child: Text(
                        Strings.joinAWorkshop,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            PortraitCard(
                              imagePath: Images.graphicDesigner,
                              lessonName: Strings.graphicDesigner,
                              numberOfCourses: "234",
                            ),
                            PortraitCard(
                              imagePath: Images.swimming,
                              lessonName: Strings.swimming,
                              numberOfCourses: "34",
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PortraitCard extends StatelessWidget {
  final String imagePath, lessonName, numberOfCourses;
  const PortraitCard(
      {required this.imagePath,
      required this.lessonName,
      required this.numberOfCourses});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 3 * SizeConfig.widthMultiplier,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(3 * SizeConfig.heightMultiplier),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(3 * SizeConfig.heightMultiplier),
              ),
              child: AspectRatio(
                aspectRatio: 0.8,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(2.0 * SizeConfig.widthMultiplier),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lessonName,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "$numberOfCourses Courses",
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.selectedTabBackgroundColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(3.0 * SizeConfig.heightMultiplier),
              ),
            ),
            child: Align(
              alignment: Alignment(0, SizeConfig.isMobilePortrait ? 0.3 : 0.35),
              child: Text(
                Strings.lessons,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.unSelectedTabBackgroundColor,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(3.0 * SizeConfig.heightMultiplier),
              ),
            ),
            child: Align(
              alignment: Alignment(0, SizeConfig.isMobilePortrait ? 0.3 : 0.35),
              child: Text(
                Strings.myClasses,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),            
          ),
        )
      ],
    );
  }
}

class TopContainerPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.8,
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 2.0 * SizeConfig.heightMultiplier),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24.0),
          ),
          color: AppTheme.topBarBackgroundColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(2 * SizeConfig.heightMultiplier),
                width: double.maxFinite,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          ProfileImage(),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1 * SizeConfig.heightMultiplier,
                              ),
                              child: Text(
                                Strings.greetingMessage,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.blur_on,
                            size: 8 * SizeConfig.imageSizeMultiplier,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          Strings.whatLearnToday,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 2 * SizeConfig.heightMultiplier,
                bottom: 2.5 * SizeConfig.heightMultiplier,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 2 * SizeConfig.heightMultiplier),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 3 * SizeConfig.heightMultiplier,
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1 * SizeConfig.heightMultiplier,
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: Strings.searchHere,
                                ),
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1 * SizeConfig.heightMultiplier),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3.0 * SizeConfig.heightMultiplier),
                          bottomLeft: Radius.circular(3.0 * SizeConfig.heightMultiplier),
                        ),
                      ),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 6 * SizeConfig.imageSizeMultiplier,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TopContainerLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.75,
      alignment: Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24.0),
          ),
          color: AppTheme.topBarBackgroundColor,
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 2.0 * SizeConfig.heightMultiplier,
                  right: 2.0 * SizeConfig.heightMultiplier,
                  top: 1.0 * SizeConfig.heightMultiplier,
                ),
                child: Row(
                  children: [
                    ProfileImage(),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 1 * SizeConfig.heightMultiplier,
                        ),
                        child: Text(
                          Strings.greetingMessage,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 2 * SizeConfig.heightMultiplier),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              size: 3 * SizeConfig.heightMultiplier,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 1 * SizeConfig.heightMultiplier,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: Strings.searchHere,
                                  ),
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.blur_on,
                      size: 8 * SizeConfig.imageSizeMultiplier,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 2.0 * SizeConfig.heightMultiplier, bottom: 1.5 * SizeConfig.heightMultiplier),
                child: Row(
                  children: [
                    Text(
                      Strings.whatLearnToday,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Spacer(),
                    Container(
                      width: 10 * SizeConfig.heightMultiplier,
                      padding: EdgeInsets.symmetric(vertical: 1 * SizeConfig.heightMultiplier),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3.0 * SizeConfig.heightMultiplier),
                          bottomLeft: Radius.circular(3.0 * SizeConfig.heightMultiplier),
                        ),
                      ),
                      child: Icon(
                        Icons.settings,
                        color: Colors.white,
                        size: 6 * SizeConfig.imageSizeMultiplier,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
        color: Colors.pinkAccent.withOpacity(0.4),
      ),
      child: Image.asset(
        Images.profileImage,
        width: 10 * SizeConfig.imageSizeMultiplier,
        height: 10 * SizeConfig.imageSizeMultiplier,
      ),
    );
  }
}