import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_app/Utils/color.dart';

class RestInvestTitle extends StatelessWidget {
  const RestInvestTitle({
    Key? key,
    this.text,
    this.textColor = Colors.black,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.isAsterisk = false,
    this.textAlign = TextAlign.left,
    this.margin = const EdgeInsets.only(left: 0),
  }) : super(key: key);
  final String? text;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextAlign? textAlign;

  final EdgeInsetsGeometry margin;
  final bool isAsterisk;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        fontWeight: fontWeight,
        color: textColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign!,
    );
  }
}

class DialogBox extends StatelessWidget {
  const DialogBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: AlertDialog(
        // title: const Text('AlertDialog Title'),
        content: Row(
          children: const [
            CircularProgressIndicator(),
            SizedBox(
              width: 20,
            ),
            Text(
              "Please wait....",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

class NoInternetWgt extends StatelessWidget {
  static const _sizeImg = 200.0;
  final void Function() onTryAgain;

  const NoInternetWgt({
    required this.onTryAgain,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/images/no_internet.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
         Text(
          Strings.noInternetConnection,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 225,
          child: AppButton(
            text: 'Try Again',
            buttonColor: AppColor.blueColor,
            textColor: AppColor.whiteColor,
            onPress: onTryAgain,
          ),
        ),
      ],
    );
  }
}

class Strings {
  static String userId = "-0456";
  static const String noInternetConnection = "No Internet Connection";
  static const String tryAgain = 'Try Again';
}
class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.text,
    required this.onPress,
    this.height = 48,

    this.width = double.infinity,
    this.textSize = 18.0,
    this.buttonColor = AppColor.blueColor,
    this.isSquare = false,
    this.textColor = AppColor.whiteColor,
  }) : super(key: key);
  final String text;

  final VoidCallback? onPress;
  final double textSize;
  final Color buttonColor;

  final Color textColor;

  final double width;
  final double height;
  final bool isSquare;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          onPrimary: textColor,
          textStyle: TextStyle(
            fontSize: textSize,
            // fontWeight: FontWeight.w800
          ),
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: isSquare
                ? BorderRadius.circular(0

            )
                : BorderRadius.circular(30.0),
          ),
        ),
        child: Text(text,));
  }
}

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {Key? key,
        this.label,
        this.hintColor,
        this.hint,
        this.textAlign = TextAlign.start,
        this.textInputType = TextInputType.emailAddress,
        this.validations,
        this.onChange,
        this.obscureText = false,
        this.fieldType = 2,
        this.controller,
        this.enable = true,
        this.length,
        this.icon,
        this.color = AppColor.dimblack,
        this.isRounded = true,
        this.hasIcon = true,this.inputFormator =const [],})
      : super(key: key);
  final String? label;
  final String? hint;
  final hintColor;
  final TextAlign textAlign;
  final TextInputType textInputType;
  final Function(String)? validations;
  final Function(String)? onChange;
  bool obscureText;
  final int fieldType;
  final IconData? icon;
  final bool enable;
  final int? length;
  final bool hasIcon;
  final TextEditingController? controller;
  final bool isRounded;
  final Color color;
  final List<TextInputFormatter> inputFormator;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      cursorColor: AppColor.blueColor,
      maxLength: widget.length,
      cursorHeight: 20,
      enabled: widget.enable,

      inputFormatters: widget.inputFormator,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        isDense: true, // Added this
        contentPadding: EdgeInsets.all(9),
        border: _inputBorder(widget.isRounded),
        disabledBorder: _inputBorder(widget.isRounded),
        enabledBorder: widget.isRounded ? _inputBorder(widget.isRounded) : null,
        errorBorder: _inputBorder(widget.isRounded),
        focusedBorder: _inputBorder(widget.isRounded),
        focusedErrorBorder: _inputBorder(widget.isRounded),
        filled: true,
        labelText: widget.label,
        hintText: widget.hint,hintStyle: TextStyle(color:widget.hintColor,fontSize: 12,),
        fillColor: AppColor.whiteColor,
      ),
      keyboardType: widget.textInputType,
      textAlign: widget.textAlign,
      obscureText: widget.obscureText,
      validator: (val) {
        widget.validations!(val!);
      },
      onChanged: widget.onChange,
      onSaved: (val) {},
    );
  }

  InputBorder _inputBorder(isRounded) {
    return OutlineInputBorder(
      borderSide: BorderSide(width: isRounded ? 1 : 2, color: AppColor.black),
      borderRadius: BorderRadius.circular(
        isRounded ? 0 : 0,
      ),
    );
  }
}
class CustomRowButton extends StatelessWidget {
  const CustomRowButton(
      {Key? key,
        this.color1 = true,
        this.color2 = false,
        required this.text,
        required this.onPress,
        this.height = 35,
        this.width = double.infinity,
        this.textSize = 18.0,
        this.buttonColor = AppColor.blueColor,
        this.textColor = AppColor.whiteColor,
        this.borderColor = AppColor.blueColor})
      : super(key: key);
  final String text;
  final VoidCallback? onPress;
  final double textSize;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final double width;
  final double height;

  final color1;
  final color2;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(

          primary: buttonColor,
          onPrimary: textColor,
          textStyle: TextStyle(
            fontSize: textSize,
          ),
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),

          side:const BorderSide(color: AppColor.black,),


        ),
        child: Text(text));
  }
}