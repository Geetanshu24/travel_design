import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Corrected import statement

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

double initialChildSize = 0.2; // Initial size (half screen)
double maxChildSize = 0.9;
bool bottomsheetopen = false;
bool isButtonExpanded = true;

class _HomeScreenState extends State<HomeScreen> {
  void toggleButton() {
    setState(() {
      isButtonExpanded = !isButtonExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/eifel_tower.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      "assets/down.svg",
                      width: 30,
                      height: 30,
                    ),
                    SvgPicture.asset(
                      "assets/favourite.svg",
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned.fill(
            top: 350,
            left: 10,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('ON SALE'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Eiffel Tower",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.place,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Paris, France",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomSheetWidget(),
        ],
      ),
      floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: isButtonExpanded
              ? FloatingActionButton(
                  backgroundColor: Color(0xff1C1854),
                  onPressed: () {
                    setState(() {
                      if (initialChildSize == 0.2) {
                        initialChildSize = maxChildSize;
                        isButtonExpanded = !isButtonExpanded;
                      } else {
                        initialChildSize = 0.2;
                        isButtonExpanded = !isButtonExpanded;
                      }
                    });
                  },
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: SvgPicture.asset(
                      'assets/airplane.svg',
                      color: Colors.white,
                      width: 35,
                      key: ValueKey<bool>(
                          isButtonExpanded), // Key for the airplane icon
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(left: 30),
                  child: Container(
                    height: 60,
                    width: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        color: Color(0xff1C1854),
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.asset(
                              'assets/airplane.svg',
                              color: Colors.white,
                              width: 35,
                            ),
                            Text(
                              'Search Flights',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('ON SALE'),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
    );
  }
}

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  // Corrected variable name
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialChildSize, // Initial size (half screen)
      minChildSize: 0.2, // Minimum size (20% of the screen)
      maxChildSize: maxChildSize, // Maximum size (full screen)
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          height: MediaQuery.of(context)
              .size
              .height, // Changed height to adapt to the screen size
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                SizedBox(
                  height: 115,
                  child: ListView.builder(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 6,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            _getImagePath(index),
                            width: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    "Traveling is a thrilling adventure that opens up a world of possibilities."
                    "It's a chance to explore new cultures, savor exotic cuisines, and make unforgettable memories."
                    "Whether it's wandering through historic cities, relaxing on sun-kissed beaches, or embarking on epic journeys,"
                    "travel enriches our lives and broadens our horizons. So pack your bags, embrace the unknown, and let the journey of a lifetime begin.",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.withOpacity(1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Read More",
                  style: TextStyle(
                    // Corrected style placement
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        20), // Adjust the radius as needed
                    child: Container(
                      color: Colors.black,
                      height: 200,
                      child: Stack(
                        children: [
                          Center(
                            child: Image.asset(
                              'assets/four.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons
                                  .play_circle_fill, // Replace with your video play icon
                              color: Colors.white,
                              size: 30, // Adjust the size of the icon as needed
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Card(
                            margin: EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 6,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                _getImagePath(index),
                                width: 130,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(child: Text(_getText(index))),
                        ],
                      );
                    },
                  ),
                ),
                isButtonExpanded
                    ? Container(
                        height: 60,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            color: Color(0xff1C1854),
                            padding: EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SvgPicture.asset(
                                  'assets/airplane.svg',
                                  color: Colors.white,
                                  width: 35,
                                ),
                                Text(
                                  'Search Flights',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('ON SALE'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getImagePath(int index) {
    switch (index) {
      case 0:
        return 'assets/one.jpg';
      case 1:
        return 'assets/two.jpg';
      case 2:
        return 'assets/three.jpg';
      case 3:
        return 'assets/four.jpg';
      default:
        return 'assets/placeholder.jpg'; // Add a default image path here
    }
  }

  String _getText(int index) {
    switch (index) {
      case 0:
        return 'Travel opens up a world of discovery and adventure. ';
      case 1:
        return 'Its a journey through vibrant cultures, flavors, and landscapes.';
      case 2:
        return 'From historic cities to breathtaking beaches, every destination tells a story.';
      case 3:
        return 'So pack your bags, create memories, and let the adventure begin!';
      default:
        return 'wash'; // Add a default image path here
    }
  }
}
