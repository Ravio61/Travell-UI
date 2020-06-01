import 'package:flutter/material.dart';
import 'package:shopping_app/animated_widgets/animated_bottom_nav.dart';

class BottomNavBar extends StatefulWidget{
  @override
  _BottomNavBarState createState() {
    return _BottomNavBarState();
  }
}

class _BottomNavBarState extends State<BottomNavBar> with SingleTickerProviderStateMixin {

  Animation _animation;
  AnimationController _controller;
  int _currentNavIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 1));
    _animation = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: _controller,curve: Curves.elasticOut));
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0,bottom: 5.0,top: 10.0,right: 16.0),
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _buildNav('Home', Icons.home, 0),
          _buildNav('Alert', Icons.room_service, 1),
          _buildNav('Saved', Icons.bookmark, 2),
          _buildNav('Profile', Icons.person, 3),
        ],
      ),
    );
  }

  Widget _buildNav(String text, IconData icon,int index){
    return _currentNavIndex == index? BottomNavActive(
      key: Key(text),
      animation: _animation,
      text: text,
      icon: icon,
    ):Material(
      child: InkWell(
        onTap: (){
          setState(() {
            _currentNavIndex = index;
            _controller.reset();
            _controller.forward();
          });
        },
        child: Icon(
          icon,
          size: 25,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}