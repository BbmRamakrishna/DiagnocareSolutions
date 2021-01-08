import 'package:getx/resource/constants/app_constants.dart';
import 'package:getx/resource/values/app_colors.dart';
import 'package:getx/resource/values/app_dimens.dart';
import 'package:getx/widget/cp_underliner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CPTextField extends StatefulWidget {
  String hintText;
  String titleText;
  String leftImage;
  TextEditingController controller;
  final ValueChanged<String> onEdit;
  TextInputType keyboardType;
  bool isSecure;
  int maxLength;
  bool showTitle, cursor, enable, isPhone, isError;
  String prefixImage;
  String selectedSuffixImage;
  String unSelectedSuffixImage;
  TextAlign align;
  ValueChanged<String> onChanged;
  bool enableSelection;
  FontWeight hintFontWeight;
  FontWeight textFontWeight;
  double textFontsize;
  Color textColor;
  String validationRegex;
  List<TextInputFormatter> formatters;
  double topMargin;
  Key keyId;

  CPTextField({
    this.hintText,
    this.titleText,
    this.leftImage,
    this.controller,
    @optionalTypeArgs this.isSecure = false,
    this.onEdit,
    this.keyboardType,
    this.maxLength,
    @optionalTypeArgs this.showTitle = true,
    @optionalTypeArgs this.prefixImage,
    @optionalTypeArgs this.selectedSuffixImage,
    @optionalTypeArgs this.unSelectedSuffixImage,
    @optionalTypeArgs this.align,
    @optionalTypeArgs this.cursor,
    @optionalTypeArgs this.enable,
    @optionalTypeArgs this.isPhone = false,
    @optionalTypeArgs this.onChanged,
    @optionalTypeArgs this.isError = false,
    @optionalTypeArgs this.enableSelection = true,
    @optionalTypeArgs this.hintFontWeight = CPFont.w400,
    @optionalTypeArgs this.textFontWeight = CPFont.w500,
    @optionalTypeArgs this.textColor,
    @optionalTypeArgs this.textFontsize,
    @optionalTypeArgs this.formatters,
    @optionalTypeArgs this.topMargin,
    @optionalTypeArgs this.keyId,
  });

  @override
  _CPTextFieldState createState() => _CPTextFieldState();
}

class _CPTextFieldState extends State<CPTextField> {
  handler() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.topMargin ?? 15),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.showTitle)
            Text(
              widget.titleText,
              style: TextStyle(fontSize: AppDimens.NUM_14.toDouble()),
            ),
          SizedBox(
            height: 0,
          ),
          TextField(
            key: widget.keyId ?? Key(""),
            inputFormatters: widget.formatters != null ? widget.formatters : List<TextInputFormatter>(),
            maxLengthEnforced: true,
            enabled: widget.enable ?? true,
            showCursor: widget.cursor ?? true,
            textAlign: widget.align != null ? widget.align : TextAlign.start,
            maxLength: widget.maxLength,
            onChanged: widget.onChanged,
            enableInteractiveSelection: widget.enableSelection,
            style: TextStyle(
              color: widget.textColor == null
                  ? widget.isError
                      ? AppColors.error
                      : AppColors.LIGHT_BLACK
                  : widget.textColor,
              fontWeight: widget.textFontWeight,
              fontSize: widget.textFontsize == null ? 14 : widget.textFontsize,
            ),
            decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.symmetric(
                vertical: -5,
              ),
              hintText: widget.hintText,
              border: InputBorder.none,
              prefixIcon: (widget.prefixImage != null)
                  ? Image(
                      image: AssetImage(widget.prefixImage),
                      width: 22.0,
                      height: 15.0,
                    )
                  : null,
              suffixIcon: (widget.unSelectedSuffixImage != null)
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.isSecure = !widget.isSecure;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 25,
                          top: 0,
                        ),
                        child: Image(
                          image: AssetImage(
                            widget.isSecure ? Icons.remove_red_eye : widget.selectedSuffixImage,
                          ),
                          width: 10.0,
                          height: 7.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : null,
            ),
            obscureText: widget.isSecure,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9]{3,15}$')),
            // ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 1,
            child: CustomPaint(
              painter: CPUnderliner(
                lineColor: widget.isError ? AppColors.error : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
