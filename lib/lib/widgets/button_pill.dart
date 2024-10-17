import 'package:flutter/material.dart';

class ButtonPill extends StatelessWidget {
  const ButtonPill({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC5F28C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  //side: BorderSide(color: Colors.grey.shade300),
                )),
            child: Text(
              text,
              style: TextStyle(
                color: const Color(0xFF595959),
                fontSize: 18,
              ),
            ),
            onPressed: onPressed),
      ),
    );
  }
}

class ButtonPillSecondary extends StatelessWidget {
  const ButtonPillSecondary(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey[300]!),
                )),
            child: Text(
              text,
              style: TextStyle(
                color: const Color(0xFF595959),
                fontSize: 18,
              ),
            ),
            onPressed: onPressed),
      ),
    );
  }
}


class TextoBoton extends StatelessWidget {
  const TextoBoton({
    super.key,
    required this.text,
    this.textColor,
  });

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600 //Semi-bold
          ),
    );
  }
}