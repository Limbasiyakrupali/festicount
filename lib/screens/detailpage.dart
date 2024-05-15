import 'package:festival_app/utils/quote.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class detailpage extends StatefulWidget {
  const detailpage({super.key});

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {
  bool istapped = true;
  @override
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
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed("editpage", arguments: quote);
              },
              icon: Icon(
                Icons.navigate_next_sharp,
                size: 30,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 300,
                        width: 360,
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            image: DecorationImage(
                                fit: BoxFit.cover,
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
                      ),
                    ]),
              )
            ],
          ),
          SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, left: 60, right: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            istapped = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.pink
                                    .withOpacity((istapped) ? 0.75 : 0),
                                width: 3,
                              ),
                            ),
                          ),
                          child: Text(
                            "About",
                            style: GoogleFonts.getFont("Mulish",
                                textStyle: const TextStyle(
                                    color: Colors.pink,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            istapped = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.pink
                                    .withOpacity((istapped) ? 0 : 0.75),
                                width: 3,
                              ),
                            ),
                          ),
                          child: Text(
                            "Culture",
                            style: GoogleFonts.getFont("Mulish",
                                textStyle: const TextStyle(
                                    color: Colors.pink,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
          (istapped)
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        quote.AuthorName,
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Color(0xff11009E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        quote.About,
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                // Divider(
                                //   indent: 15,
                                //   endIndent: 45,
                                //   color: Colors.black,
                                // ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "History",
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Color(0xff11009E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        "${quote.History}",
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Significance",
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Color(0xff11009E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        quote.Significance,
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        quote.AuthorName,
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Color(0xff11009E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        quote.Culture,
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Traditions",
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Color(0xff11009E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        quote.Traditions,
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Location",
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Color(0xff11009E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        quote.Location,
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Date",
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Color(0xff11009E),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, bottom: 15),
                                  child: Column(
                                    children: [
                                      Text(
                                        quote.Date,
                                        style: GoogleFonts.getFont("Mulish",
                                            textStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
        ]),
      ),
    );
  }
}
