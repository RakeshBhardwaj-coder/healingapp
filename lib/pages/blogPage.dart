// ignore_for_file: unnecessary_import, avoid_unnecessary_containers, unnecessary_const, file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:healingapp/widgets/appButtonWidget.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Blogs"),
          backgroundColor: Colors.blue[800],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 20.0,
              width: double.infinity,
              child: const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.black)),
            ),
            Container(
              width: double.infinity,
              height: 270,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage("assets/images/homePage.png"),
                    fit: BoxFit.fill),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Row(children: [
                  FlatButton(
                    onPressed: () {},
                    child: AppButtonsWidget(
                      textColor: Colors.white,
                      backgroundColor: Colors.black,
                      borderColor: Colors.black,
                      text: "",
                      widthsize: 50,
                      heightsize: 40,
                      fontsize: 20,
                      isIcon: true,
                      icon: Icons.thumb_up,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: AppButtonsWidget(
                      textColor: Colors.white,
                      backgroundColor: Colors.black,
                      borderColor: Colors.black,
                      text: "",
                      widthsize: 50,
                      heightsize: 40,
                      fontsize: 20,
                      isIcon: true,
                      icon: Icons.thumb_down,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: AppButtonsWidget(
                      textColor: Colors.white,
                      backgroundColor: Colors.black,
                      borderColor: Colors.black,
                      text: "",
                      widthsize: 50,
                      heightsize: 40,
                      fontsize: 20,
                      isIcon: true,
                      icon: Icons.comment,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("more"),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 20.0,
              width: double.infinity,
              child:
                  DecoratedBox(decoration: BoxDecoration(color: Colors.black)),
            ),
            // Container(
            //   width: double.infinity,
            //   height: 270,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //         image: const AssetImage("assets/images/img2.png"),
            //         fit: BoxFit.fill),
            //   ),
            //   child: Align(
            //     alignment: Alignment.bottomLeft,
            //     child: Row(children: [
            //       FlatButton(
            //         onPressed: () {},
            //         child: AppButtonsWidget(
            //           textColor: Colors.white,
            //           backgroundColor: Colors.black,
            //           borderColor: Colors.black,
            //           text: "",
            //           widthsize: 50,
            //           heightsize: 40,
            //           fontsize: 20,
            //           isIcon: true,
            //           icon: Icons.thumb_up,
            //         ),
            //       ),
            //       FlatButton(
            //         onPressed: () {},
            //         child: AppButtonsWidget(
            //           textColor: Colors.white,
            //           backgroundColor: Colors.black,
            //           borderColor: Colors.black,
            //           text: "",
            //           widthsize: 50,
            //           heightsize: 40,
            //           fontsize: 20,
            //           isIcon: true,
            //           icon: Icons.thumb_down,
            //         ),
            //       ),
            //       FlatButton(
            //         onPressed: () {},
            //         child: AppButtonsWidget(
            //           textColor: Colors.white,
            //           backgroundColor: Colors.black,
            //           borderColor: Colors.black,
            //           text: "",
            //           widthsize: 50,
            //           heightsize: 40,
            //           fontsize: 20,
            //           isIcon: true,
            //           icon: Icons.comment,
            //         ),
            //       ),
            //       TextButton(
            //         onPressed: () {},
            //         child: const Text(
            //           'Read More',
            //           style: const TextStyle(
            //               color: Colors.black,
            //               fontSize: 20.0,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ]),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20.0,
            //   width: double.infinity,
            //   child:
            //       DecoratedBox(decoration: BoxDecoration(color: Colors.black)),
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 270,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //         image: const AssetImage("assets/images/img3.png"),
            //         fit: BoxFit.fill),
            //   ),
            //   child: Align(
            //     alignment: Alignment.bottomLeft,
            //     child: Row(children: [
            //       FlatButton(
            //         onPressed: () {},
            //         child: AppButtonsWidget(
            //           textColor: Colors.white,
            //           backgroundColor: Colors.black,
            //           borderColor: Colors.black,
            //           text: "",
            //           widthsize: 50,
            //           heightsize: 40,
            //           fontsize: 20,
            //           isIcon: true,
            //           icon: Icons.thumb_up,
            //         ),
            //       ),
            //       FlatButton(
            //         onPressed: () {},
            //         child: AppButtonsWidget(
            //           textColor: Colors.white,
            //           backgroundColor: Colors.black,
            //           borderColor: Colors.black,
            //           text: "",
            //           widthsize: 50,
            //           heightsize: 40,
            //           fontsize: 20,
            //           isIcon: true,
            //           icon: Icons.thumb_down,
            //         ),
            //       ),
            //       FlatButton(
            //         onPressed: () {},
            //         child: AppButtonsWidget(
            //           textColor: Colors.white,
            //           backgroundColor: Colors.black,
            //           borderColor: Colors.black,
            //           text: "",
            //           widthsize: 50,
            //           heightsize: 40,
            //           fontsize: 20,
            //           isIcon: true,
            //           icon: Icons.comment,
            //         ),
            //       ),
            //       TextButton(
            //         onPressed: () {},
            //         child: const Text(
            //           'Read More',
            //           style: const TextStyle(
            //               color: Colors.black,
            //               fontSize: 20.0,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ]),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20.0,
            //   width: double.infinity,
            //   child:
            //       DecoratedBox(decoration: BoxDecoration(color: Colors.black)),
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 270,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //         image: const AssetImage("assets/images/img4.png"),
            //         fit: BoxFit.fill),
            //   ),
            //   child: Align(
            //     alignment: Alignment.bottomLeft,
            //     child: Row(children: [
            //       FlatButton(
            //         onPressed: () {},
            //         child: AppButtonsWidget(
            //           textColor: Colors.white,
            //           backgroundColor: Colors.black,
            //           borderColor: Colors.black,
            //           text: "",
            //           widthsize: 50,
            //           heightsize: 40,
            //           fontsize: 20,
            //           isIcon: true,
            //           icon: Icons.thumb_up,
            //         ),
            //       ),
            //       FlatButton(
            //         onPressed: () {},
            //         child: AppButtonsWidget(
            //           textColor: Colors.white,
            //           backgroundColor: Colors.black,
            //           borderColor: Colors.black,
            //           text: "",
            //           widthsize: 50,
            //           heightsize: 40,
            //           fontsize: 20,
            //           isIcon: true,
            //           icon: Icons.thumb_down,
            //         ),
            //       ),
            //       FlatButton(
            //         onPressed: () {},
            //         child: AppButtonsWidget(
            //           textColor: Colors.white,
            //           backgroundColor: Colors.black,
            //           borderColor: Colors.black,
            //           text: "",
            //           widthsize: 50,
            //           heightsize: 40,
            //           fontsize: 20,
            //           isIcon: true,
            //           icon: Icons.comment,
            //         ),
            //       ),
            //       TextButton(
            //         onPressed: () {},
            //         child: const Text(
            //           'Read More',
            //           style: const TextStyle(
            //               color: Colors.black,
            //               fontSize: 20.0,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ]),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20.0,
            //   width: double.infinity,
            //   child:
            //       DecoratedBox(decoration: BoxDecoration(color: Colors.black)),
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 270,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //         image: const AssetImage("assets/images/img5.png"),
            //         fit: BoxFit.fill),
            //   ),
            //   child: Align(
            //     alignment: Alignment.bottomLeft,
            //     child: Row(children: [
            //       FlatButton(
            //         onPressed: () {},
            //         child: AppButtonsWidget(
            //           textColor: Colors.white,
            //           backgroundColor: Colors.black,
            //           borderColor: Colors.black,
            //           text: "",
            //           widthsize: 50,
            //           heightsize: 40,
            //           fontsize: 20,
            //           isIcon: true,
            //           icon: Icons.thumb_up,
            //         ),
            //       ),
            //       FlatButton(
            //         onPressed: () {},
            //         child: AppButtonsWidget(
            //           textColor: Colors.white,
            //           backgroundColor: Colors.black,
            //           borderColor: Colors.black,
            //           text: "",
            //           widthsize: 50,
            //           heightsize: 40,
            //           fontsize: 20,
            //           isIcon: true,
            //           icon: Icons.thumb_down,
            //         ),
            //       ),
            //       FlatButton(
            //         onPressed: () {},
            //         child: AppButtonsWidget(
            //           textColor: Colors.white,
            //           backgroundColor: Colors.black,
            //           borderColor: Colors.black,
            //           text: "",
            //           widthsize: 50,
            //           heightsize: 40,
            //           fontsize: 20,
            //           isIcon: true,
            //           icon: Icons.comment,
            //         ),
            //       ),
            //       TextButton(
            //         onPressed: () {},
            //         child: const Text(
            //           'Read More',
            //           style: const TextStyle(
            //               color: Colors.black,
            //               fontSize: 20.0,
            //               fontWeight: FontWeight.bold),
            //         ),
            //       ),
            //     ]),
            //   ),
            // ),
            // const SizedBox(
            //   height: 20.0,
            //   width: double.infinity,
            //   child: DecoratedBox(
            //       decoration: const BoxDecoration(color: Colors.black)),
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 270,
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //         image: const AssetImage("assets/images/img6.png"),
            //         fit: BoxFit.fill),
            //   ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(children: [
                FlatButton(
                  onPressed: () {},
                  child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.black,
                    borderColor: Colors.black,
                    text: "",
                    widthsize: 50,
                    heightsize: 40,
                    fontsize: 20,
                    isIcon: true,
                    icon: Icons.thumb_up,
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.black,
                    borderColor: Colors.black,
                    text: "",
                    widthsize: 50,
                    heightsize: 40,
                    fontsize: 20,
                    isIcon: true,
                    icon: Icons.thumb_down,
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: AppButtonsWidget(
                    textColor: Colors.white,
                    backgroundColor: Colors.black,
                    borderColor: Colors.black,
                    text: "",
                    widthsize: 50,
                    heightsize: 40,
                    fontsize: 20,
                    isIcon: true,
                    icon: Icons.comment,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Read More',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
            ),

            const SizedBox(
              height: 20.0,
              width: double.infinity,
              child:
                  DecoratedBox(decoration: BoxDecoration(color: Colors.black)),
            ),
          ],
        )),
      ),
    );
  }
}
