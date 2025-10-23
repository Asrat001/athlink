import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWithFixedWidth extends StatefulWidget {
  final String text;
  final double fontSize;
  final int numOfCharacters;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  bool showReadMore;

  TextWithFixedWidth({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.textAlign = TextAlign.start, // Changed to start for better alignment
    this.numOfCharacters = 100,
    this.textColor = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.showReadMore = true,
  });

  @override
  State<TextWithFixedWidth> createState() => _TextWithFixedWidthState();
}

class _TextWithFixedWidthState extends State<TextWithFixedWidth> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final bool needsExpansion = widget.text.length > widget.numOfCharacters;
    String displayText = _isExpanded
        ? widget.text
        : (widget.text.length > widget.numOfCharacters
              ? '${widget.text.substring(0, widget.numOfCharacters)}...'
              : widget.text);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayText,
          style: GoogleFonts.poppins(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.textColor,
          ),
          // style: TextStyle(
          //   fontSize: widget.fontSize,
          //   fontWeight: widget.fontWeight,
          //   color: widget.textColor,
          //   fontFamily: "Poppins",
          // ),
          textAlign: widget.textAlign,
          softWrap: true, // Enable text wrapping
          maxLines: _isExpanded ? null : 3, // Limit to 3 lines when collapsed
          overflow: TextOverflow.ellipsis,
        ),
        // if (widget.showReadMore)
        //   if (needsExpansion) // Only show toggle if text is long enough
        //     GestureDetector(
        //       onTap: () {
        //         setState(() {
        //           _isExpanded = !_isExpanded;
        //         });
        //       },
        //       child: Padding(
        //         padding: const EdgeInsets.only(top: 4.0),
        //         child: Text(
        //           _isExpanded ? 'Read less' : 'Read more',
        //           style: TextStyle(
        //             color: Colors.blue,
        //             fontSize: widget.fontSize - 2,
        //             fontWeight: FontWeight.w500,
        //           ),
        //         ),
        //       ),
        //     ),
      ],
    );
  }
}
