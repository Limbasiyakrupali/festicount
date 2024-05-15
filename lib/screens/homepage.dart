import 'package:festival_app/utils/alldata.dart';
import 'package:festival_app/utils/global.dart';
import 'package:festival_app/utils/quote.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();
    Global.quote = QuoteData.allQuoteData
        .map(
          (e) => Quotes.frommap(data: e),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
              children: Global.quote
                  .map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                opacity: 0.8,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.6),
                                  BlendMode.colorDodge,
                                ),
                                image: NetworkImage(e.Thumbnail),
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.grey.shade100,
                                  spreadRadius: 10,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ]),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed("detailpage", arguments: e);
                            },
                          ),
                        ),
                      ))
                  .toList()),
        ),
      ),
    );
  }
}
