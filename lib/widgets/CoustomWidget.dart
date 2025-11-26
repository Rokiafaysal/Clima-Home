import 'package:flutter/material.dart';


class Customwidgets {


  static void showCustomSnackBar({required BuildContext context,required String message,bool isError = false}) {

    Text SnackbarText = Text(message,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white, fontFamily: "inter", fontSize: 16),);

    Icon SnackbarIcon = Icon(isError ? Icons.error_outline : Icons.check_circle_outline,color: isError ? Colors.redAccent[200] : Colors.greenAccent[400],);
    Row SnackbarContent = Row(children: [SnackbarIcon,Expanded(child: SnackbarText)],mainAxisAlignment: MainAxisAlignment.center,spacing: 12,);

    final snackBar = SnackBar(content: SnackbarContent,backgroundColor: Color(0xff151c22).withValues(alpha: 0.85),behavior: SnackBarBehavior.floating,elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0),),
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      duration: const Duration(seconds: 3)
    );

    if (context.mounted) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
  }


}











