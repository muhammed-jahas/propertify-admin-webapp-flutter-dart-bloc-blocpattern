import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify_webapp/blocs/bloc/agent_bloc.dart';
import 'package:propertify_webapp/blocs/property_bloc/property_bloc.dart';
import 'package:propertify_webapp/constants/app_fonts.dart';
import 'package:propertify_webapp/constants/paddings.dart';
import 'package:propertify_webapp/constants/spaces.dart';
import 'package:propertify_webapp/models/agent_model.dart';
import 'package:propertify_webapp/models/property_model.dart';
import 'package:propertify_webapp/resources/colors/app_colors.dart';
import 'package:propertify_webapp/resources/components/custom_buttons.dart';
import 'package:propertify_webapp/views/property_details_screen.dart';
import 'package:propertify_webapp/views/screen1.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 236, 236, 236),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return CustomOverlayScreen();
                },
                transitionsBuilder: (___, animation, ____, child) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            customSpaces.verticalspace20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Container(
                      width: 400,
                      child: TabBar(
                        labelPadding: EdgeInsets.all(0),
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: ShapeDecoration(
                          shape: Border(
                            bottom: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                        ),
                        labelStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                        unselectedLabelStyle:
                            TextStyle(fontSize: 14, color: Colors.grey),
                        dividerColor: Colors.transparent,
                        tabs: [
                          Tab(
                            text: 'All Agents',
                          ),
                          Tab(text: 'Tab 2'),
                          Tab(text: 'Tab 3'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Content of Tab 1
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              // Add your content for Tab 1 here

                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: BlocBuilder<AgentBloc, AgentState>(
                                  builder: (context, state) {
                                    if (state is AgentLoadingState) {
                                      return Container(
                                        height: 500,
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      );
                                    } else if (state is AgentLoadSuccessState) {
                                      return ListView.separated(
                                        padding: EdgeInsets.all(0),
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) {
                                          return Divider(
                                            height: 0,
                                            thickness: .5,
                                          );
                                        },
                                        itemBuilder: (context, index) {
                                          AgentModel agent =
                                              state.agents![index];
                                          return AgentItem(
                                            index: index + 1,
                                            agent: agent,
                                          );
                                        },
                                        itemCount: state.agents!.length,
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Content of Tab 2
                  Column(
                    children: [
                      // Add your content for Tab 2 here
                    ],
                  ),
                  // Content of Tab 3
                  Column(
                    children: [
                      // Add your content for Tab 3 here
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AgentItem extends StatelessWidget {
  final dynamic? index;
  final AgentModel agent;
  // late ValueNotifier<Map<String, bool>> valueStatus;
  AgentItem({
    required this.index,
    required this.agent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // valueStatus = ValueNotifier(checkStatus());
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            opaque: false,
            pageBuilder: (BuildContext context, _, __) {
              return CustomOverlayScreen();
            },
            transitionsBuilder: (___, animation, ____, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border(
          //     left: BorderSide(
          //   // color: Colors.green,
          //   width: 4,
          // ))
        ),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 20,
                  child: Text(
                    '${index}',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(4),
                //   child: Image.network(
                //     property!.propertyCoverPicture!.path,
                //     height: 40,
                //     width: 50,
                //     fit: BoxFit.cover,
                //   ),
                // ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 50,
                  child: Text(
                    agent.fullname,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Icon(
                  Icons.location_on_rounded,
                  size: 15,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 2,
                ),
                Text(
                  'Malappuram',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  '₹ 10,000',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  width: 60,
                ),
                CircleAvatar(
                  radius: 15,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Michael Angelo',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            // BlocListener<PropertyBloc, PropertyState>(
            //   listener: (context, state) {
            //     print(state);
            //     if (state is PropertyApprovedSuccessState) {
            //       valueStatus.value['isApproved'] = true;
            //       valueStatus.notifyListeners();
            //       print(valueStatus.value);
            //     }
            //   },
            //   child: ValueListenableBuilder(
            //     valueListenable: valueStatus,
            //     builder: (context, value, child) {
            //       print(value);
            //       if (!value['isApproved']! && !value['isRejected']!) {
            //         return Row(
            //           children: [
            //             statusButton(
            //               bgColor: Colors.red.shade200,
            //               labelColor: Colors.red.shade900,
            //               label: 'Reject',
            //               onPressed: () {},
            //             ),
            //             SizedBox(
            //               width: 10,
            //             ),
            //             // statusButton(
            //             //   bgColor: Colors.green.shade200,
            //             //   label: 'Approve',
            //             //   labelColor: Colors.green.shade900,
            //             //   onPressed: () {
            //             //     context.read<PropertyBloc>().add(
            //             //         ApprovePropertyEvent(PropertyId: property.id!));
            //             //   },
            //             // ),
            //           ],
            //         );
            //       } else if (value['isSold']!) {
            //         return statusButton(
            //             label: 'Sold',
            //             bgColor: AppColors.primaryColor,
            //             labelColor: Colors.white);
            //       } else if (value['isApproved']!) {
            //         return statusButton(
            //           bgColor: Colors.green.shade700,
            //           label: 'Approved',
            //           labelColor: Colors.white,
            //         );
            //       } else {
            //         return SizedBox();
            //       }
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // checkStatus() {
  //   Map<String, bool> status = {
  //     'isApproved': age.isApproved!,
  //     'isRejected': property.isRejected!,
  //     'isSold': property.isSold!,
  //   };
  //   return status;
  // }
}

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
