import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
              children: [ 
                Container(
                  margin: EdgeInsets.only(top: 180),
                  height: 500.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter,
                      stops: [
                        0.1,0.3,0.9,1.1,
                      ],
                      colors: [
                        Colors.blue,
                        Colors.blueAccent,
                        Colors.blue[900].withOpacity(0.9),
                        Color.fromRGBO(236, 226, 198, 1.0),
                      ]
                      )
                  ),
                ),                
                ClipPath(
                  clipper: MyClipperStyleOne(),
                  child: Container(
                    height: 220,
                    color: Colors.lightBlue[100],                    
                  )
                ),
                ClipPath(
                  clipper: MyClipperStyleOne(),
                  child: Container(
                    //margin: EdgeInsets.only(top: 480),
                    height: 210,
                    color: Colors.blueGrey[300],   
                    child: Center(
                      child: Text('ClipPath', 
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, 
                                      fontSize: 30.0,
                                      color: Colors.white),
                                  ),
                    ),               
                  )
                ),
                
              ]
      ),
    );
  }
  
          
}


class MyClipperStyleOne extends CustomClipper<Path> {
  
  bool reverse;

  MyClipperStyleOne({this.reverse = false});

  final int _coefficient = 4;
  double get _minStep => 1 / _coefficient;
  double get _preCenter => _minStep * (_coefficient / 2 - 1);
  double get _postCenter => _minStep * (_coefficient / 2 + 1);
  double get _preEnd => _minStep * (_coefficient - 2);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0.0, 0.0);
    if(!reverse) {
      path.lineTo(0.0, size.height - 30.0);
      path.lineTo(size.width * _preCenter, size.height - 20.0);
      path.cubicTo(size.width/2, size.height - 20.0, size.width/2, size.height - 40.0, size.width * _postCenter, size.height - 40.0);
      path.lineTo(size.width * _preEnd, size.height - 40.0);
      path.quadraticBezierTo(size.width, size.height - 40.0, size.width, size.height - 32.0);
      path.lineTo(size.width, 0.0);
      path.close();
    }else{
      path.lineTo(0.0, 20);
      path.lineTo(size.width * _preCenter, 20.0);
      path.cubicTo(size.width/2, 20.0, size.width/2, 40.0, size.width * _postCenter, 40.0);
      path.lineTo(size.width * _preEnd, 40.0);
      path.quadraticBezierTo(size.width, 40, size.width, 20.0);
      path.lineTo(size.width, 0.0);
      path.close();
    }

    return path;

  }
  
    @override
    bool shouldReclip(CustomClipper oldClipper) {    
      return true;
  }



}
