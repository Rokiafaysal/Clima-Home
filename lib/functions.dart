import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_home_app/widgets/CoustomWidget.dart';


class PublicFunctions{

  
  static Future<Map<String, dynamic>> getPrediction({required BuildContext context}) async {
      final weatherUrl = "https://api.open-meteo.com/v1/forecast?latitude=31.0167&longitude=31.3026&hourly=shortwave_radiation,temperature_2m,relative_humidity_2m,wind_speed_80m,rain&forecast_days=1";

      final weatherResponse = await http.get(Uri.parse(weatherUrl));

      if (weatherResponse.statusCode != 200) {Customwidgets.showCustomSnackBar(context: context, message: "Internet Connection is Unstable",isError: true);}

      final weatherJson = jsonDecode(weatherResponse.body);

      final payload = {"TempColumn": weatherJson["hourly"]["temperature_2m"],"HumColumn": weatherJson["hourly"]["relative_humidity_2m"],
        "LightColumn": weatherJson["hourly"]["shortwave_radiation"],"WindColumn": weatherJson["hourly"]["wind_speed_80m"]};

      final modelUrl = "https://awadallayossef-lstm-model.hf.space/predictNonScaled";
      final modelResponse = await http.post(Uri.parse(modelUrl),headers: {"Content-Type": "application/json"},body: jsonEncode(payload),);

      if (modelResponse.statusCode != 200) {Customwidgets.showCustomSnackBar(context: context, message: "Internet Connection is Unstable",isError: true);}
      

      return jsonDecode(modelResponse.body);
    }



}





// void main() async{

  // List<List<double>> data = [
  //     [0.45, 0.52, 0.49, 0.95],
  //     [0.15, 0.95, 0.57, 0.49],
  //     [0.37, 0.93, 0.05, 0.07],
  //     [0.42, 0.13, 0.48, 0.59],
  //     [0.31, 0.12, 0.68, 0.58],
  //     [0.15, 0.49, 0.36, 0.97],
  //     [0.85, 0.97, 0.23, 0.06],
  //     [0.53, 0.83, 0.09, 0.48],
  //     [0.99, 0.42, 0.51, 0.98],
  //     [0.48, 0.91, 0.71, 0.89],
  //     [0.70, 0.29, 0.05, 0.95],
  //     [0.98, 0.76, 0.70, 0.67],
  //     [0.99, 0.58, 0.91, 0.33],
  //     [0.84, 0.17, 0.50, 0.68],
  //     [0.79, 0.52, 0.41, 0.37],
  //     [0.99, 0.73, 0.13, 0.97],
  //     [0.14, 0.06, 0.59, 0.93],
  //     [0.49, 0.26, 0.25, 0.68],
  //     [0.58, 0.95, 0.56, 0.88],
  //     [0.30, 0.78, 0.58, 0.67],
  //     [0.86, 0.88, 0.30, 0.75],
  //     [0.76, 0.94, 0.15, 0.85],
  //     [0.71, 0.05, 0.10, 0.34],
  //     [0.86, 0.00, 0.16, 0.31],
  //   ];



  //   PublicFunctions.sendPredictionRequest(data: data);


  // try {
  //   final prediction = await PublicFunctions.getPrediction();
  //   print("Prediction from API: $prediction");
  // } catch (e) {
  //   print("Error: $e");
  // }





// }


