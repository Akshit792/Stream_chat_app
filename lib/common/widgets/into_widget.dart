import 'package:booksella/common/constants.dart';
import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {
  final Widget dyanmicWidget;
  const IntroWidget({required this.dyanmicWidget, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLogoWidget(context),
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              'WELCOME TO',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              'PARADISE',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          _buildLine(color: Colors.blue[800]!),
          _buildLine(color: Colors.blue[300]!),
          _buildLine(
            color: Colors.blue[300]!.withOpacity(0.4),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              'A new way to connect with your friends!',
              style: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          dyanmicWidget,
        ],
      ),
    );
  }

  Widget _buildLogoWidget(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.blue[300]!.withOpacity(0.4), width: 1.8),
        shape: BoxShape.circle,
      ),
      child: Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent, width: 1.8),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(70),
          ),
          shadowColor: Colors.blue[300],
          child: Container(
            height: 100,
            width: 100,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue[800]),
            alignment: Alignment.center,
            child: const SizedBox(
              width: 40,
              height: 40,
              child: Image(
                height: 5,
                image: AssetImage(Constants.chaticonImage),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLine({required Color color}) {
    return Container(
      height: 2,
      width: 60,
      margin: const EdgeInsets.only(top: 5),
      color: color,
    );
  }
}
