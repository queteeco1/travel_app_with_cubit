import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/app_cubits.dart';
import '../../templates_texts_and_buttons/app_large_text.dart';
import '../../templates_texts_and_buttons/app_text.dart';
import '../../templates_texts_and_buttons/main_button.dart';




class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List pictures = [
    'https://i.pinimg.com/236x/77/92/4a/77924acee5bbfaa8658d1e49f7541ec5.jpg',
    'https://c8.alamy.com/comp/HWWY69/a-tall-black-and-white-cartoon-mountain-rises-above-a-small-range-HWWY69.jpg',
    'https://as2.ftcdn.net/v2/jpg/01/09/12/81/1000_F_109128138_AfTBRC1A7KFEwOzVenlDwBWZKNFNfl9g.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: pictures.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(pictures[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 120, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLargeTextWidget(text: 'Trips'),
                      const AppTextWidget(text: 'Mountain', size: 25),
                      const SizedBox(height: 10),
                      const SizedBox(
                        width: 250,
                        child: AppTextWidget(
                            text:
                            'Mountain hikes give you an incredible sense of freedom along with endurance tests',
                            color: Colors.black45),
                      ),
                      const SizedBox(height: 25),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: const SizedBox(
                          width: 200,
                          child:  MainButtonWidget(
                            width: 120,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(
                      3,
                          (indexSlider) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          height: index == indexSlider ? 25 : 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: index == indexSlider
                                ? Colors.blue[700]
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(7.5),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
