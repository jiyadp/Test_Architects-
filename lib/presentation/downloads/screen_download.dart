import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/application/downloads/downloads_bloc.dart';
import 'package:flutter_application_2/core/contans.dart';
import 'package:flutter_application_2/presentation/widgets/app_bar_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/colors/colors.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});

  final _widgetList = [
    const SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: AppBarWidget(
                title: 'Download',
              ),
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(height: 20),
            itemCount: _widgetList.length));
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kwidth,
        Icon(
          Icons.settings,
          color: kwhitecolor,
        ),
        kwidth,
        Padding(
          padding: EdgeInsets.all(13.0),
          child: Text('Smart Downloads'),
        ),
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
 final List imageList = [
    "https://www.themoviedb.org/t/p/w220_and_h330_face/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/5TYgKxYhnhRNNwqnRAKHkgfqi2G.jpg",
    "https://www.themoviedb.org/t/p/w220_and_h330_face/xjsx6rGEgHl2tUqkimo6Bz2KzVo.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //    BlocProvider.of<DownloadsBloc>(context)
    //     .add(const DownloadsEvent.getDownloadsImages());
    // });
      BlocProvider.of<DownloadsBloc>(context)
        .add(const DownloadsEvent.getDownloadsImages());
    final Size size = MediaQuery.of(context).size;
   
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Indtroducing Downlods for you',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          'We will Download a Personaised selectio of\n movies and shoes for you , so there is \n always somthing watch on your \n decive',
          textAlign: TextAlign.center,
          style: TextStyle(color: kgreycolor),
        ),
        SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(alignment: Alignment.center, children: [
            CircleAvatar(
              radius: size.width * .4,
              backgroundColor: kgreycolor.withOpacity(0.5),
            ),
            DownloadsImageWidgets(
              imageList: imageList[0],
              margin: const EdgeInsets.only(left: 170, top: 70),
              angle: 25,
              size: Size(size.width * 0.35, size.width * 0.55),
            ),
            DownloadsImageWidgets(
              imageList: imageList[1],
              margin: const EdgeInsets.only(right: 130, top: 50),
              angle: -20,
              size: Size(size.width * 0.35, size.width * 0.55),
            ),
            DownloadsImageWidgets(
              imageList: imageList[2],
              margin: const EdgeInsets.only(bottom: 20, top: 60),
              size: Size(size.width * 0.4, size.width * 0.60),
            )
          ]),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
              color: kButtonColorBlue,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Set up",
                  style: TextStyle(
                      color: kwhitecolor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
        kHeight,
        MaterialButton(
            color: kButtonColorWhite,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "See what you can download",
                style: TextStyle(
                    color: kBlackcolor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ))
      ],
    );
  }
}

class DownloadsImageWidgets extends StatelessWidget {
  const DownloadsImageWidgets({
    Key? key,
    this.angle = 0,
    required this.imageList,
    required this.margin,
    required this.size,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        // borderRadius: BorderRadius.circular(radius),
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                imageList,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
