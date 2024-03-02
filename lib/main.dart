import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:propertify_webapp/blocs/bloc/agent_bloc.dart';
import 'package:propertify_webapp/blocs/property_bloc/property_bloc.dart';
import 'package:propertify_webapp/resources/colors/app_colors.dart';
import 'package:propertify_webapp/responsive/responsive_layout.dart';
import 'package:propertify_webapp/views/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PropertyBloc(),),
        BlocProvider(create: (context) => AgentBloc(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ResponsiveLayout(desktopScaffold: DesktopDashboard()),
        theme: ThemeData(
          useMaterial3: false,
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: AppColors.primaryColor.shade100,
            circularTrackColor: AppColors.primaryColor,
          ),
          brightness: Brightness.light, // Use the dark theme
          fontFamily: 'gilroy', // Set your custom font here
          primaryColor: AppColors.primaryColor,
          primaryColorDark: AppColors.primaryColor,
          primaryColorLight: AppColors.primaryColor,
          hintColor: AppColors.primaryColor,
        ),
      ),
    );
  }
}
