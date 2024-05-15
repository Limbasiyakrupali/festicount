import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:clipboard/clipboard.dart';
import 'package:festival_app/utils/quote.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

class editpage extends StatefulWidget {
  const editpage({super.key});

  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {
  Color selBackGroundColor = Colors.black87;
  Color selFontColor = Colors.white;
  List<String> fontFamilies = GoogleFonts.asMap().keys.toList();

  double textSize = 18;
  FontWeight fontWeight = FontWeight.w500;
  double font = 5;
  late String selFont;
  String? selImage;
  String? ima;

  double dx = 0;
  double dy = 0;

  GlobalKey repaintKey = GlobalKey();

  get images => null;

  @override
  void initState() {
    super.initState();
    selFont = fontFamilies[0];
  }

  Future<void> shareImage() async {
    RenderRepaintBoundary renderRepaintBoundary =
        repaintKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    var image = await renderRepaintBoundary.toImage(pixelRatio: 5);

    ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);

    Uint8List fetchImage = byteData!.buffer.asUint8List();

    Directory directory = await getApplicationCacheDirectory();

    String path = directory.path;

    File file = File('$path.png');

    file.writeAsBytes(fetchImage);

    ShareExtend.share(file.path, "Image");
  }

  Widget build(BuildContext context) {
    Quotes quote = ModalRoute.of(context)!.settings.arguments as Quotes;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Festicount",
            style: GoogleFonts.getFont("Dancing Script",
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w900)),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  selBackGroundColor = Colors.black87;
                  selFontColor = Colors.white;
                  textSize = 18;
                  fontWeight = FontWeight.w500;
                  font = 5;
                  selFont = fontFamilies[0];
                  selImage = null;
                });
              },
              icon: const Icon(Icons.restart_alt),
            ),
            IconButton(
              onPressed: () async {
                await FlutterClipboard.copy(quote.quote).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.grey,
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        "Copied Success!!!",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                });
              },
              icon: const Icon(Icons.copy_all),
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     await shareImage();
        //   },
        //   child: const Icon(Icons.share),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await shareImage();
          },
          child: const Icon(Icons.share),
        ),
        body: Container(
            padding: const EdgeInsets.only(top: 2, left: 16, right: 16),
            alignment: Alignment.center,
            child: Column(children: [
              Expanded(
                child: Column(
                  children: [
                    Slider(
                      value: textSize,
                      min: 15,
                      max: 22,
                      onChanged: (val) {
                        setState(() {
                          textSize = val;
                        });
                      },
                    ),
                    RepaintBoundary(
                      key: repaintKey,
                      child: Stack(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 300,
                                width: 360,
                                decoration: BoxDecoration(
                                  image: (selImage != null)
                                      ? DecorationImage(
                                          image: NetworkImage(selImage!),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Container(
                                height: 300,
                                width: 360,
                                alignment: Alignment(dx, dy),
                                decoration: BoxDecoration(
                                    color: (selImage == null)
                                        ? selBackGroundColor
                                        : null,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        opacity: 0.5,
                                        colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.6),
                                          BlendMode.colorDodge,
                                        ),
                                        image: NetworkImage(quote.Thumbnail)),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.grey.shade100,
                                        spreadRadius: 10,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            quote.quote,
                                            style: GoogleFonts.getFont(selFont,
                                                textStyle: TextStyle(
                                                    color: selFontColor,
                                                    fontSize: textSize,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(children: [
                  // Slider(
                  //   value: font,
                  //   min: 1,
                  //   max: 9,
                  //   divisions: 9,
                  //   onChanged: (val) {
                  //     setState(() {
                  //       if (val == 1) {
                  //         font = val;
                  //         fontWeight = FontWeight.w100;
                  //       } else if (val <= 2) {
                  //         font = val;
                  //         fontWeight = FontWeight.w200;
                  //       } else if (val <= 3) {
                  //         font = val;
                  //         fontWeight = FontWeight.w300;
                  //       } else if (val <= 4) {
                  //         font = val;
                  //         fontWeight = FontWeight.w400;
                  //       } else if (val <= 5) {
                  //         font = val;
                  //         fontWeight = FontWeight.w500;
                  //       } else if (val <= 6) {
                  //         font = val;
                  //         fontWeight = FontWeight.w600;
                  //       } else if (val <= 7) {
                  //         font = val;
                  //         fontWeight = FontWeight.w700;
                  //       } else if (val <= 8) {
                  //         font = val;
                  //         fontWeight = FontWeight.w800;
                  //       } else if (val == 9) {
                  //         font = val;
                  //         fontWeight = FontWeight.w900;
                  //       }
                  //     });
                  //   },
                  // ),
                  //

                  Slider(
                    value: dy,
                    min: -0.95,
                    max: 0.95,
                    onChanged: (val) {
                      setState(() {
                        dy = val;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Change Font Color",
                              style: GoogleFonts.getFont("Mulish",
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 5, right: 15),
                          child: Row(
                            children: Colors.accents
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selFontColor = e;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: 10, top: 10),
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          color: e,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: Colors.black87,
                                            width: 3,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Change BackGround Color",
                                  style: GoogleFonts.getFont("Mulish",
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 5),
                              child: Row(
                                children: Colors.primaries
                                    .map((e) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selImage = null;
                                              selBackGroundColor = e;
                                            });
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 10, top: 10),
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: e,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: Colors.black87,
                                                width: 3,
                                              ),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Text(
                                  "Change Font",
                                  style: GoogleFonts.getFont("Mulish",
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 5),
                              child: Row(
                                children: fontFamilies
                                    .map((e) => (fontFamilies.indexOf(e) <= 20)
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selFont = e;
                                                print(e);
                                                print(selFont);
                                              });
                                            },
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  right: 10,
                                                  top: 10,
                                                  bottom: 20),
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.black87,
                                                  width: 3,
                                                ),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Aa",
                                                style: GoogleFonts.getFont(
                                                  e,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container())
                                    .toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              )
            ])));
  }
}
