import 'package:flutter/material.dart';
import 'package:flutter1_a_l/features/app/home/widgets/home_button_widget.dart';
import 'package:flutter1_a_l/features/app/manger/color_manger.dart';

import '../app_const/page_const.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OPEN AI '),
        centerTitle: true,
        backgroundColor: Mycolor.mgrey,
        elevation: 0,
      ),
      body: Container(
        color: Mycolor.mwhite,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HomeButtonWidget(
                      textData: "Image Generation - OpenAI",
                      iconData: Icons.image_outlined,
                      onTap: () {
                        Navigator.pushNamed(
                            context, PageConst.ImageGenerationPage);
                      },
                    ),
                    HomeButtonWidget(
                      textData: "Text Completion - OpenAI",
                      iconData: Icons.text_fields_outlined,
                      onTap: () {
                        Navigator.pushNamed(
                            context, PageConst.textCompletionPage);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
