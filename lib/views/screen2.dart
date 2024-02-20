import 'package:flutter/material.dart';


class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          // Open the new screen as an overlay
          Navigator.of(context).push(
            _buildOverlayPageRoute(context, NewScreen()),
          );
        },
        child: Text('Screen 2 Content'),
      ),
    );
  }

  PageRouteBuilder _buildOverlayPageRoute(BuildContext context, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}

class NewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Screen'),
      ),
      body: Stack(
        children: [
          // Your existing screen content
          Screen2(),
          // Overlayed content
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5), // Adjust the overlay color and opacity
              child: Center(
                child: Text(
                  'Overlay Content',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
