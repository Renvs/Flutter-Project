import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'model/car.dart';

void main() {
  runApp(const MyApp());
}

var currCar = carList.cars[0];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Container(
            margin: const EdgeInsets.only(left: 25),
            child: const Icon(Icons.arrow_back, color: Colors.white)),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 25),
            child: Icon(Icons.favorite_border,
                color: Colors.white.withOpacity(0.6)),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: const LayoutStart(),
    );
  }
}

class LayoutStart extends StatelessWidget {
  const LayoutStart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: <Widget>[
        CarDetailAnimation(),
        CustomBottomSheet(),
      ],
    );
  }
}

class CarDetailAnimation extends StatefulWidget {
  const CarDetailAnimation({super.key});

  @override
  State<CarDetailAnimation> createState() => _CarDetailAnimationState();
}

class _CarDetailAnimationState extends State<CarDetailAnimation> {
  @override
  Widget build(BuildContext context) {
    return const CarDetails();
  }
}

class CarDetails extends StatelessWidget {
  const CarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 30),
            child: _carTitle(),
          ),
          SizedBox(
            width: double.infinity,
            child: const CarCarousel(),
          )
        ]));
  }

  _carTitle() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.white, fontSize: 38),
                  children: [
                TextSpan(text: "${currCar.namaPerusahaan}\n"),
                TextSpan(
                    text: currCar.namaMobil,
                    style: const TextStyle(fontWeight: FontWeight.w700)),
              ])),
          const SizedBox(height: 10),
          RichText(
              text: TextSpan(style: const TextStyle(fontSize: 16), children: [
            TextSpan(
                text: currCar.harga.toString(),
                style: TextStyle(color: Colors.grey[20])),
            const TextSpan(text: " / hari", style: TextStyle(color: Colors.grey)),
          ])),
        ]);
  }
}

class CarCarousel extends StatefulWidget {
  const CarCarousel({super.key});

  @override
  State<CarCarousel> createState() => _CarCarouselState();
}

class _CarCarouselState extends State<CarCarousel> {
  static final List<String> imgList = currCar.images;

  final List<Widget> child = _map<Widget>(imgList, (index, String assetName) {
    return Container(
        child: Image.asset("assets/$assetName", fit: BoxFit.fitWidth));
  }).toList();

  static List<T> _map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        CarouselSlider(
            items: child,
            options: CarouselOptions(
              height: 250,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            )),
        Container(
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _map<Widget>(imgList, (index, assetName) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: 50,
                    height: 2,
                    decoration: BoxDecoration(
                      color: _current == index
                          ? Colors.grey[100]
                          : Colors.grey[600],
                    ),
                  );
                })))
      ],
    ));
  }
}

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  // Move `sheetTop` and `isExpanded` to the class level
  double sheetTop = 400;
  final double minSheetTop = 30;
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: sheetTop,
      left: 0,
      child: GestureDetector(
        onTap: () {
          setState(() {
            // Toggle the expanded state and adjust `sheetTop` accordingly
            if (isExpanded) {
              sheetTop = 400;
            } else {
              sheetTop = minSheetTop;
            }
            isExpanded = !isExpanded;
          });
        },
        child: const SheetContainer(),
      ),
    );
  }
}

class SheetContainer extends StatelessWidget {
  const SheetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double sheetItemHeight = 110;

    return Container(
        padding: const EdgeInsets.only(top: 25),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          color: Color(0xfff1f1f1),
        ),
        child: Column(
          children: <Widget>[
            drawerHandle(),
            Expanded(
                flex: 1,
                child: ListView(children: <Widget>[
                  penawaran(sheetItemHeight),
                  spesifikasi(sheetItemHeight),
                  fitur(sheetItemHeight),
                  const SizedBox(height: 220),
                ]))
          ],
        ));
  }

  drawerHandle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      width: 65,
      height: 3,
      decoration: BoxDecoration(
        color: const Color(0xffd9dbdb),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }

  fitur(double sheetItemHeight) {
    return Container(
        padding: const EdgeInsets.only(left: 25, top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Spesifikasi Mobil",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 15),
                height: sheetItemHeight,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: currCar.penawaran.length,
                    itemBuilder: (context, index) {
                      return ListItem(
                        sheetItemHeight: sheetItemHeight,
                        mapVal: currCar.spesifikasi[index],
                      );
                    }))
          ],
        ));
  }

  spesifikasi(double sheetItemHeight) {
    return Container(
        padding: const EdgeInsets.only(left: 25, top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Fitur Mobil",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 15),
                height: sheetItemHeight,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: currCar.penawaran.length,
                    itemBuilder: (context, index) {
                      return ListItem(
                        sheetItemHeight: sheetItemHeight,
                        mapVal: currCar.fitur[index],
                      );
                    }))
          ],
        ));
  }

  penawaran(double sheetItemHeight) {
    return Container(
        padding: const EdgeInsets.only(left: 25, top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Detail Mobil",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 15),
                height: sheetItemHeight,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: currCar.penawaran.length,
                    itemBuilder: (context, index) {
                      return ListItem(
                        sheetItemHeight: sheetItemHeight,
                        mapVal: currCar.penawaran[index],
                      );
                    }))
          ],
        ));
  }
}

class ListItem extends StatelessWidget {
  final double sheetItemHeight;
  final Map mapVal;

  const ListItem({
    super.key,
    required this.sheetItemHeight,
    required this.mapVal,
  });

  @override
  Widget build(BuildContext context) {
    var innerMap;
    bool isMap;

    if (mapVal.values.elementAt(0) is Map) {
      innerMap = mapVal.values.elementAt(0);
      isMap = true;
    } else {
      innerMap = mapVal;
      isMap = false;
    }

    return Container(
      margin: const EdgeInsets.only(right: 20),
      width: sheetItemHeight,
      constraints: BoxConstraints(maxHeight: sheetItemHeight * 2),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
              child: Center(child: mapVal.keys.elementAt(0) as Widget),
            ),
            const SizedBox(height: 10),
            if (isMap)
              Text(
                innerMap.keys.elementAt(0).toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            const SizedBox(height: 8),
            Text(
              isMap
                  ? innerMap.values.elementAt(0).toString()
                  : mapVal.values.elementAt(0).toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

