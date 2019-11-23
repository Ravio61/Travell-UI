import 'package:flutter/material.dart';

typedef Operation = Function(Function(bool));
typedef CanExecuteOperation = bool Function();

class CustomProgressButton extends StatefulWidget{

  final String title;
  final Operation operation;
  final CanExecuteOperation canExecuteOperation;

  CustomProgressButton({this.title,this.operation,this.canExecuteOperation});

  @override
  _CustomProgressButtonState createState() {
    return _CustomProgressButtonState();
  }
}

class _CustomProgressButtonState extends State<CustomProgressButton> with TickerProviderStateMixin{

  int _state = 0;
  Animation _animation;
  AnimationController _animationController;
  GlobalKey _globalKey = GlobalKey();
  double _width = double.maxFinite;

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.center,
        child: PhysicalModel(
          elevation: 8,
          shadowColor: _state == 3? Colors.redAccent:Colors.greenAccent,
          color: _state == 3? Colors.red:Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          child: Container(
            key: _globalKey,
            height: 50,
            width: _width,
            child: RaisedButton(
              animationDuration: Duration(milliseconds: 500),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))
              ),
              padding: EdgeInsets.all(0.0),
              elevation: 4,
              color: _state == 3? Colors.red:Colors.green,
              child: _buildChild(),
              onPressed: (){
                if(widget.canExecuteOperation()){
                  setState(() {
                    if(_state==0){
                      _animate();
                    }
                  });
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChild(){
    if(_state == 0){
      return Hero(
        tag: 'icon',
        child: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      );
    }else if(_state == 1){
      return Hero(
        tag: 'icon',
        child: SizedBox(
          height: 36,
          width: 36,
          child: CircularProgressIndicator(
            value: null,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      );
    }else if(_state == 2){
      return Hero(
        tag: 'icon',
        child: IconButton(
          icon: Icon(
            Icons.check,
            color: Colors.white,
          ),
          onPressed: (){
            _animationController.reset();
            setState(() {
              _state = 0;
            });
          },
        ),
      );
    }else{
      return Hero(
        tag: 'icon',
        child: IconButton(
          icon: Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          onPressed: (){
            _animationController.reset();
            setState(() {
              _state = 0;
            });
          },
        ),
      );
    }
  }

  void _animate() async {

    double width = _globalKey.currentContext.size.width;

    _animationController = AnimationController(duration: Duration(milliseconds: 300),vsync: this);
    
    _animation = Tween(begin: 0.0,end: 1.0).animate(_animationController)..addListener((){
      setState(() {
        _width = width - ((width - 50) * _animation.value);
      });
    });
    _animationController.forward();

    setState(() {
      _state = 1;
    });

    await widget.operation((success) {
      if(success){
        setState(() {
          _state = 2;
        });
      }else{
        setState(() {
          _state = 3;
        });
      }
    });

  }
}