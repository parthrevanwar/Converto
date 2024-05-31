import 'package:carousel_slider/carousel_slider.dart';
import 'package:converrto/globalfunctions.dart';
import 'package:converrto/imageloader.dart';
import 'package:converrto/webpage.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.jsonData, required this.homedata});

  final Map<String, dynamic> jsonData;
  final Map<String, dynamic> homedata;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 15,),
          widget.homedata['carousel']['active']
              ? CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 2,
                    viewportFraction: 1,
                    initialPage: currentIndex,
                    enableInfiniteScroll: false,
                    padEnds: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  items: List.generate(
                    widget.homedata['carousel']['carousel_count'],
                    (index) => GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebPage(
                                    jsonData: widget.jsonData,
                                    url: widget.homedata['carousel']
                                        ['carousel_array'][index]['url'],
                                    title: widget.homedata['carousel']
                                        ['carousel_array'][index]['title'],
                                  )),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  width: 1,
                                  color: hexToColor(widget.homedata['carousel']
                                      ['border_color'])),
                              color: Colors.blue,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: ImageLoader(
                                url: widget.homedata['carousel']
                                    ['carousel_array'][index]['bgimage']),
                          ),
                        ),
                      ),
                    ),
                  ))
              : Container(),
          SizedBox(height: 5,),
          widget.homedata['carousel']['active']
              ? DotsIndicator(
                  decorator: DotsDecorator(
                    size: Size.square(12),
                    activeSize: Size.square(12),
                    spacing: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    color: hexToColor(widget.homedata['carousel']['dot_color']),
                    activeColor: hexToColor(
                        widget.homedata['carousel']['active_dot_color']),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            widget.homedata['carousel']['squaredot']
                                ? 2.0
                                : 6.0)),
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            widget.homedata['carousel']['squaredot']
                                ? 2.0
                                : 6.0)),
                  ),
                  dotsCount: widget.homedata['carousel']['carousel_count'],
                  position: currentIndex,
                )
              : Container(),
          SizedBox(height: 10,),
          widget.homedata['tab']['active']
              ? GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25,
                      mainAxisExtent: 130),
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 20),
                  shrinkWrap: true,
                  itemCount: widget.homedata['tab']['tab_count'],
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebPage(
                                    jsonData: widget.jsonData,
                                    url: widget.homedata['tab']['tab_array']
                                        [index]['url'],
                                    title: widget.homedata['tab']['tab_array']
                                        [index]['title'],
                                  )),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                hexToColor(widget.homedata['tab']['tab_color']),
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                                width: 1,
                                color: hexToColor(widget.homedata['tab']
                                    ['tab_border_color']))),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Container(
                                    height: 70,
                                    child: ImageLoader(
                                      url: widget.homedata['tab']['tab_array']
                                          [index]['bgimage'],
                                    )),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.homedata['tab']['tab_array'][index]
                                    ['title'],
                                style:Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: hexToColor(widget.homedata['tab']['title_color']),
                                  fontSize: 16,
                                ),
                                // style: TextStyle(
                                //   color: hexToColor(
                                //       widget.homedata['tab']['title_color']),
                                //   fontSize: 14,
                                // ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Container(),
          widget.homedata['options']['active']
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                  child: Container(
                    height: 92.0 *
                            ((widget.homedata['options']['options_count'] / 4)
                                .ceil()) +
                        20,
                    decoration: BoxDecoration(
                        color:
                            hexToColor(widget.homedata['options']['bgcolor']),
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                            width: 1,
                            color: hexToColor(
                                widget.homedata['options']['border_color']))),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          mainAxisExtent: 90),
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                      itemCount: widget.homedata['options']['options_count'],
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WebPage(
                                        jsonData: widget.jsonData,
                                        url: widget.homedata['options']
                                            ['options_array'][index]['url'],
                                        title: widget.homedata['options']
                                            ['options_array'][index]['title'],
                                      )),
                            );
                          },
                          child: Column(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    child: ImageLoader(
                                      url: widget.homedata['options']
                                          ['options_array'][index]['bgimage'],
                                    ),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.homedata['options']['options_array']
                                    [index]['title'],
                                style:Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: hexToColor(widget.homedata['options']['title_color']),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
