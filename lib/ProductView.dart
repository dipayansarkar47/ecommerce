import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final String productName;
  final AssetImage productImage;
  final String productInfo;
  final String productPrice;

  const ProductView(
      {Key? key,
      required this.productName,
      required this.productImage,
      required this.productInfo,
      required this.productPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.courseCardColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: MyTheme.catalogueButtonColor),
      ),
      body: Stack(
        children: [
          Column(children: [
            Expanded(
              flex: 35,
              child: Center(
                child: Image(
                  image: productImage,
                  height: 800,
                  width: MediaQuery.of(context).size.width * 0.6,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Spacer(
              flex: 65,
            )
          ]),
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(32.0))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              color: MyTheme.grey.withOpacity(0.5),
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(1.0))),
                          height: 4,
                          width: 48,
                        ),
                      ),
                      MyTheme.mediumVerticalPadding,
                      Text(productName,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      Text(productInfo,
                          style: TextStyle(fontSize: 16, color: MyTheme.grey)),
                      MyTheme.largeVerticalPadding,
                      Row(
                        children: [
                          Text(productPrice,
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          
                        ],
                      ),
                      MyTheme.mediumVerticalPadding,
                      const Text(
                        "The Nothing Phone (1) boasts an elegant style that comes to life with beautiful symbols to enable an enriched connection between you and your device. Moreover, its simplistic design ensures that you are never out of the limelight wherever you go.\nYou can experience exceptional ruggedness and carry your phone with you on all of your excursions owing to the Dual-side Gorilla Glass featured in this smartphone. Furthermore, the sophisticated vibration motors included in this phone make touch reactions lifelike and provide an exceptional user experience. Moreover, this smartphone's proportional bezel and aluminium frame enhance beauty, portability, and longevity.\nThe innovative Glyph Interface of the Nothing smartphone lays the path for a one-of-a-kind sort of communication. Furthermore, distinct light patterns alert you to incoming calls, app alerts, charging status, and other information.",
                        style: TextStyle(fontSize: 16),
                      ),
                      MyTheme.mediumVerticalPadding,
                      Row(
                        children: [
                          const Spacer(
                            flex: 2,
                          ),
                          Expanded(
                            flex: 6,
                            child: ElevatedButton(
                              
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => GraduationScreen(
                                  //             courseName: courseName,
                                  //           )),
                                  // );
                                },
                                child: const Text(
                                  "Rent Now",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                )),
                          ),
                          const Spacer(
                            flex: 2,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class MyTheme {
  static Color get backgroundColor => const Color(0xFFF7F7F7);
  static Color get grey => const Color(0xFF999999);
  static Color get catalogueCardColor =>
      const Color(0xFFBAE5D4).withOpacity(0.5);
  static Color get catalogueButtonColor => const Color(0xFF29335C);
  static Color get courseCardColor => const Color(0xFFEDF1F1);
  static Color get progressColor => const Color(0xFF36F1CD);

  static Padding get largeVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 32.0));

  static Padding get mediumVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 16.0));

  static Padding get smallVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 8.0));

  static ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blueGrey,
      ).copyWith(
        cardTheme: const CardTheme(
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
                catalogueButtonColor), // Button color
            foregroundColor: MaterialStateProperty.all<Color>(
                Colors.white), // Text and icon color
          ),
        ),
      );
}
