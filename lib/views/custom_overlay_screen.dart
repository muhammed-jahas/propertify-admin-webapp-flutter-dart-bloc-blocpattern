import 'package:flutter/material.dart';
import 'package:propertify_webapp/constants/paddings.dart';
import 'package:propertify_webapp/resources/components/custom_buttons.dart';


class CustomOverlayScreen extends StatelessWidget {
  CustomOverlayScreen();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Transparent container to capture taps outside the drawer
        GestureDetector(
          onTap: () {
            Navigator.pop(context); // Close the overlay when tapping outside
          },
          child: Container(
            color: Colors.transparent,
          ),
        ),
        // Drawer content
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.30,
            child: Drawer(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.amber,
                    ),
                  ),
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: customPaddings.horizontalpadding20,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: PrimaryButton(
                                buttonText: 'Add',
                                buttonFunction: () async {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}