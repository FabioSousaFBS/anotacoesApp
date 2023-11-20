


import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBarException(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(_trataMensagensExceptions(text)),
    backgroundColor: Colors.red.shade700,
  ));
}

String _trataMensagensExceptions(String value){

  if(value.contains('Exception:')){
    return value.replaceAll('Exception:', '');
  }

  if(value.contains('Exception')){
    return value.replaceAll('Exception', '');
  }
  
  return value;

}