import 'package:flutter/material.dart';
import 'package:flutter_assessment_test_rony/utils/diamentions.dart';
import 'package:flutter_assessment_test_rony/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double tetxHeight = Diamentions.screenHeight / 5.63;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > tetxHeight) {
      firstHalf = widget.text.substring(0, tetxHeight.toInt());
      secondHalf =
          widget.text.substring(tetxHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
        ? SmallText(
          text: firstHalf, 
          size: Diamentions.font16, 
          color: Colors.cyan,
          height: 1.6,
        )
        : Column(
          children: [
            SmallText(
              text: hiddenText
                ? ("$firstHalf...")
                : (firstHalf + secondHalf),
              size: Diamentions.font16,
              color: Colors.black,
              height: 1.6,
            ),
            InkWell(
              onTap: () {
                setState(() {
                  hiddenText =! hiddenText;
                });
              },
              child: Row(
                children: [
                  SmallText(text: hiddenText? "Show more" : "Show less", color: Colors.teal, size: Diamentions.font16,),
                  Icon(hiddenText? Icons.arrow_drop_down : Icons.arrow_drop_up , color: Colors.teal,),
                ],
              ),
            )
          ],
        ),
    );
  }
}
