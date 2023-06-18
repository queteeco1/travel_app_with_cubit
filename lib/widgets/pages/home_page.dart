import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/app_cubit_states.dart';
import 'package:untitled/cubit/app_cubits.dart';

import '../../app_style/colors_app.dart';
import '../../templates_texts_and_buttons/app_large_text.dart';
import '../../templates_texts_and_buttons/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final places = [
    'https://images.pexels.com/photos/2724664/pexels-photo-2724664.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.pexels.com/photos/4215113/pexels-photo-4215113.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/2458396/pexels-photo-2458396.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    'https://images.pexels.com/photos/1647972/pexels-photo-1647972.jpeg?auto=compress&cs=tinysrgb&w=1600',
    'https://images.pexels.com/photos/1643113/pexels-photo-1643113.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
  ];

  var image = {
    'https://previews.123rf.com/images/rastudio/rastudio1505/rastudio150502553/40451551-hiking-exercise-icon-thin-line-for-web-and-mobile-modern-minimalistic-flat-design-vector-dark-grey.jpg':
        'Hiking',
    'https://previews.123rf.com/images/rastudio/rastudio1505/rastudio150501857/40279414-downhill-skiing-icon-thin-line-for-web-and-mobile-modern-minimalistic-flat-design-vector-dark-grey.jpg':
        'Ski',
    'https://st2.depositphotos.com/1001599/9154/v/950/depositphotos_91542086-stock-illustration-kayak-with-paddle-line-icon.jpg':
        'Kayaking',
    'https://previews.123rf.com/images/rastudio/rastudio1508/rastudio150800617/42980613-mask-and-snorkel-for-snorkelling-sketch-icon-for-web-and-mobile-hand-drawn-vector-dark-grey-icon-on.jpg':
        'Snorkeling',
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.places;
            return Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // menu text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: IconButton(
                            onPressed: (){
                              BlocProvider.of<AppCubits>(context).goBack();
                            },
                            icon:const Icon(Icons.arrow_back), color: Colors.black),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 15.0),
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                  // discover text
                  const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: AppLargeTextWidget(text: 'Discover'),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: kBlack,
                      unselectedLabelColor: kGrey,
                      isScrollable: true,
                      indicator:
                          const CircleTabIndicator(color: kIndigo, radius: 4),
                      controller: tabController,
                      tabs: const [
                        Tab(text: 'Places'),
                        Tab(text: 'Inspiration'),
                        Tab(text: 'Emotions'),
                      ],
                    ),
                  ),
                  // tab bar
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        ListView.builder(
                          itemCount: info.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 20),
                                width: 200,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage("http://mark.bslmeiyu.com/uploads/${info[index].img}"),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        const Text('There'),
                        const Text('Bye'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        AppLargeTextWidget(
                          text: 'Explore more',
                          size: 20,
                        ),
                        AppTextWidget(
                          text: 'See all',
                          size: 15,
                          color: kIndigo,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: 120,
                    width: double.maxFinite,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {

                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: kGrey,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          image.keys.elementAt(index)),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                AppTextWidget(
                                  text: image.values.elementAt(index),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  _CirclePainter({required this.color, required this.radius});

  final Color color;
  double radius;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2, configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
