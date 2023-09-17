import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/fti_logo.png', width: 100, height: 100),
          SizedBox(height: 20.0),
          Text(
            'Nama: ALVIN NICOLAS GUNADI',
            style: TextStyle(fontSize: 24.0),
          ),
          Text(
            'NPM: 825210015',
            style: TextStyle(fontSize: 24.0),
          ),
        ],
      ),
    );
  }
}
