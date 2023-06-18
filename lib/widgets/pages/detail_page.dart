import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/cubit/app_cubit_states.dart';
import 'package:untitled/cubit/app_cubits.dart';

import '../../templates_texts_and_buttons/app_large_text.dart';
import '../../templates_texts_and_buttons/app_text.dart';
import '../../templates_texts_and_buttons/main_button.dart';
import '../button_people.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectedIndex = -1;
  int selectIcon = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.maxFinite,
                    height: 340,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/${detail.place.img}"),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 25,
                  right: 25,
                  top: 45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.keyboard_backspace_rounded),
                        color: Colors.white,
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.keyboard_control),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 320,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    height: MediaQuery.of(context).size.height,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeTextWidget(
                              text: detail.place.name,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppLargeTextWidget(
                              text: '\$ ${detail.place.price}',
                              size: 23,
                              color: Colors.indigoAccent.withOpacity(0.9),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                color: Colors.indigoAccent, size: 18),
                            const SizedBox(width: 8),
                            AppTextWidget(
                              text: detail.place.location,
                              color: Colors.indigoAccent.withOpacity(0.8),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < detail.place.stars
                                        ? Colors.yellow
                                        : Colors.yellow.withOpacity(0.3),
                                  );
                                  // if (index >= 4) {
                                  //   return const Icon(Icons.star_border_outlined,
                                  //       color: Colors.yellow, size: 22);
                                  // } else {
                                  //   return const Icon(Icons.star,
                                  //       color: Colors.yellow, size: 22);
                                  // }
                                },
                              ),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              margin: const EdgeInsets.only(bottom: 2),
                              child: const AppTextWidget(
                                text: '(5.0)',
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        AppLargeTextWidget(
                          text: 'People',
                          color: Colors.black.withOpacity(0.7),
                          size: 20,
                        ),
                        const SizedBox(height: 3),
                        const AppTextWidget(
                          text: 'Number people of your group',
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 9),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => InkWell(
                                  onTap: () {
                                    selectedIndex = index;
                                    setState(() {});
                                  },
                                  child: ButtonPeople(
                                    text: (index + 1).toString(),
                                    isIcon: false,
                                    size: 45,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black.withOpacity(0.9)
                                        : Colors.grey.withOpacity(0.3),
                                    borderColor: selectedIndex == index
                                        ? Colors.black.withOpacity(0.9)
                                        : Colors.grey.withOpacity(0.3),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const AppLargeTextWidget(text: 'Description', size: 20),
                        const SizedBox(height: 7),
                        AppTextWidget(
                          text: detail.place.description,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const ButtonPeople(
                                icon: Icons.favorite_border,
                                isIcon: true,
                                color: Colors.indigoAccent,
                                backgroundColor: Colors.white,
                                borderColor: Colors.indigoAccent,
                                size: 55),
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              width: 250,
                              child: Row(
                                children: const [
                                  Expanded(
                                    child: MainButtonWidget(
                                      isResponsive: true,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
