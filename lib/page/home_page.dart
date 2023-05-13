import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fistagram/custom_icons_icons.dart';
import 'package:fistagram/page/search_page.dart';
import 'package:fistagram/widgets/post_box.dart';
import 'package:flutter/material.dart';
import 'package:fistagram/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //demo data
  List<String> instaStories = [
    "assets/img/insta_stories/01.png",
    "assets/img/insta_stories/02.png",
    "assets/img/insta_stories/03.png",
    "assets/img/insta_stories/04.png",
    "assets/img/insta_stories/01.png",
    "assets/img/insta_stories/02.png",
    "assets/img/insta_stories/03.png",
    "assets/img/insta_stories/04.png",
  ];
  //demo Data
  List<String> postPics = [
    "assets/img/post/01.jpg",
    "assets/img/post/02.jpg",
    "assets/img/post/03.jpg",
    "assets/img/post/04.jpg",
    "assets/img/post/05.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          centerTitle: true,
          leadingWidth: 30,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              icon: const Icon(CustomIcons.clarity_search_line,
                  size: 30, color: primaryColor)),
          title: const Text(
            'Fistagram',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: CircleAvatar(
                  child: Image.asset("assets/img/profile_pic.png"),
                  radius: 30,
                ))
          ],
          elevation: 0,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 60,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const SizedBox(width: 6),
                    //--------------------Upload status button-------------------------
                    CircleAvatar(
                        backgroundColor: secondaryBackgroundColor,
                        radius: 28,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            CustomIcons.akar_icons_plus,
                            size: 32,
                            color: primaryColor,
                          ),
                          onPressed: () {},
                          iconSize: 28,
                        )),
                    //---------------------Stories Icon Builder------------------
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: instaStories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              const SizedBox(width: 15),
                              CircleAvatar(
                                  child: Image.asset(instaStories[index]),
                                  radius: 28)
                            ],
                          );
                        }),
                  ]),
            ),
            //-----------------------------Post Feed---------------------------
            const SizedBox(
              height: 20,
            ),
            // ListView.builder(
            //     physics: const NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     itemCount: postPics.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return PostBox(
            //         userId: 'spxd_insta',
            //         imagePath: postPics[index],
            //         likes: 2,
            //         numberOfComments: 1,
            //       );
            //     }),
            Expanded(
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("posts").snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 1.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const SizedBox(height: 300),
                          );
                        },
                      ),
                    );
                  }

                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PostBox(
                          userId: snapshot.data!.docs[index]['username'],
                          imagePath: snapshot.data!.docs[index]['postUrl'],
                          profileImage: snapshot.data!.docs[index]['profImage'],
                          likes: 2,
                          numberOfComments: 1,
                        );
                      });
                },
              ),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
