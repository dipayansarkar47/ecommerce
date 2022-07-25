// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'ProductView.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

import 'ProductView.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rentify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
          body: SingleChildScrollView(
            child: Column(
                  children: <Widget>[
            const Header(),
            const Body(),
            const Footer(),
                  ],
                ),
          )),
          
    );
  }
}

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Logo(),
          ),
          const Text(
            "Rentify",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          SearchBar(
            textController: TextEditingController(),
            hintText: 'Search',
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 5, 25, 5),
            child: IconButton(
              icon: const Icon(
                Icons.person_pin,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        
        children: <Widget>[
          Center(
            child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  key: const Key('carousel'),
                  title: 'Rentify',
                )),
          ),
          const Center(
            child: CardListView(
              key: Key('cardListView'),
            ),
          ),
          const Center(
            child: CardListView(
              key: Key('cardListView'),
            ),
          ),
          // const Popular()
          // const Recent(),
        ],
      ),
    );
  }
}

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: const Color.fromARGB(255, 108, 108, 108),
        child: Column(
          
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(child: Container(child: const Text("Copyright @2022 All Rights Reserved...All Pictures are taken from amazon.in and flipkart.com",style: const TextStyle(color: Colors.white,fontSize: 12),))),
            )
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: Image.asset('logo.png', scale: 2),
    );
  }
}

class SearchBar extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  const SearchBar(
      {required this.textController, required this.hintText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width * 0.6,
      decoration: const BoxDecoration(boxShadow: []),
      child: TextField(
        controller: textController,
        onChanged: (value) {
          //Do something wi
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Color(0xff4338CA),
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 67, 1, 117)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
      ),
    );
  }
}

class Carousel extends StatefulWidget {
  final String title;

  Carousel({required Key key, required this.title}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final List<Color> colors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  final List<String> letters = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
  ];

  bool _isPlaying = false;

  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              unlimitedMode: true,
              controller: _sliderController,
              slideBuilder: (index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  color: colors[index],
                  child: Image.asset(
                    'carousel/${index + 1}.jpg',
                    fit: BoxFit.cover,
                  ),
                );
              },
              slideTransform: const CubeTransform(),
              slideIndicator: CircularSlideIndicator(
                padding: const EdgeInsets.only(bottom: 32),
                indicatorBorderColor: Colors.black,
              ),
              itemCount: colors.length,
              initialPage: 0,
              enableAutoSlider: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Align(
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 240, maxWidth: 600),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      iconSize: 48,
                      icon: const Icon(Icons.skip_previous),
                      onPressed: () {
                        _sliderController.previousPage();
                      },
                    ),
                    IconButton(
                      iconSize: 64,
                      icon: Icon(
                        _isPlaying
                            ? Icons.pause_circle_outline
                            : Icons.play_circle_outline,
                      ),
                      onPressed: () {
                        setState(
                          () {
                            _isPlaying = !_isPlaying;
                            _sliderController.setAutoSliderEnabled(_isPlaying);
                          },
                        );
                      },
                    ),
                    IconButton(
                      iconSize: 48,
                      icon: const Icon(Icons.skip_next),
                      onPressed: () {
                        _sliderController.nextPage();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardListView extends StatelessWidget {
  const CardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 25.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductView(
                      productName: 'Nothing Phone (1)',
                      productPrice: '\$399',
                      productInfo: 'This is a phone that does nothing',
                      productImage: AssetImage("ProuductImages/Nothing.jpg"),
                    ),
                  ),
                );
              },
              child: Categories(
                  "Smartphones",
                  "https://rukminim1.flixcart.com/image/416/416/l5h2xe80/mobile/5/x/r/-original-imagg4xza5rehdqv.jpeg?q=70",
                  "Under 30k"),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductView(
                      productName: 'Asus VivoBook 14',
                      productPrice: '\$599',
                      productInfo: 'This is a laptop that does a exciting Job',
                      productImage: AssetImage("ProuductImages/Asus.jpg"),
                    ),
                  ),
                );
              },
              child: Categories(
                  "Laptops",
                  "https://rukminim1.flixcart.com/image/416/416/l41n2q80/computer/m/m/p/-original-imagff786wj4kamc.jpeg?q=70",
                  "Under 50k"),
            ),
            Categories(
                "Earphones",
                "https://rukminim1.flixcart.com/image/416/416/kura1e80/headphone/4/q/c/eti81-eti82-oppo-original-imag7szsu66kqugv.jpeg?q=70",
                "Under 2k"),
            Categories(
                "Clothes",
                "https://rukminim1.flixcart.com/image/880/1056/kb89ea80/t-shirt/4/g/d/m-465-466-blue-mustard-london-hills-original-imafshrzdyrmvgzb.jpeg?q=50",
                "Premium"),
            Categories(
                "Monitors",
                "https://rukminim1.flixcart.com/image/416/416/kkh6zrk0/monitor/i/9/r/pd2700u-27-pd2700u-benq-original-imafzsp3xfndrp79.jpeg?q=70",
                "Under 15k"),
            Categories(
                "Watches",
                "https://rukminim1.flixcart.com/image/416/416/kz1lle80/smartwatch/t/t/p/-original-imagb54swp4xn4na.jpeg?q=70",
                "Under 2k"),
            Categories(
                "Gaming",
                "https://rukminim1.flixcart.com/image/416/416/k7ksvww0/headphone/v/n/h/cosmic-byte-gs430-original-imafprpfzyx2tzru.jpeg?q=70",
                "Headset"),
            Categories(
                "Appliances",
                "https://rukminim1.flixcart.com/image/416/416/l2qhjm80/sofa-sectional/l/h/f/-original-imageygzbfmaz2qj.jpeg?q=70",
                "Premium"),
            Categories(
                "Tablets",
                "https://rukminim1.flixcart.com/image/416/416/kt1u3rk0/tablet/t/j/t/rmp2103-realme-original-imag6h83yvtku7ec.jpeg?q=70",
                "Best One"),
            
          ],
        ),
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;

  Categories(this.text, this.imageUrl, this.subtitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 15),
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: const Color.fromARGB(255, 142, 141, 141).withOpacity(.05)),
          ],
        ),
        child: Column(
          children: [
            Image.network(imageUrl, height: 70, fit: BoxFit.cover),
            const Spacer(),
            Text(text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                )),
            const SizedBox(
              height: 5,
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

