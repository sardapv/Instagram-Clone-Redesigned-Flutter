import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  final Color borderColor;
  final Color fillColor;
  final String buttonText;
  final Color buttonTextColor;
  final bool showIcon;
  final Widget icon;

  LargeButton({
    Key key,
    this.borderColor,
    this.fillColor,
    this.buttonText,
    this.buttonTextColor,
    this.showIcon,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Container(
        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              showIcon ? icon : Text(''),
              showIcon
                  ? SizedBox(
                      width: 10,
                    )
                  : Text(''),
              Text(
                buttonText,
                style: TextStyle(
                  color: buttonTextColor,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        height: 70,
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
