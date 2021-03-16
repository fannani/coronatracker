import 'package:coronatracker/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    http.Response response = await http.get("https://covid19.mathdro.id/api/");
    http.Response responseIndonesia =
        await http.get("https://covid19.mathdro.id/api/countries/Indonesia");
    http.Response responseChina =
        await http.get("https://covid19.mathdro.id/api/countries/china");
    http.Response responseSing =
        await http.get("https://covid19.mathdro.id/api/countries/singapore");
    http.Response responseItaly =
        await http.get("https://covid19.mathdro.id/api/countries/Italy");
    if (response.statusCode == 200) {
      print(response.body);
      dynamic apiData = jsonDecode(response.body);
      dynamic apiDataIndonesia = jsonDecode(responseIndonesia.body);
      dynamic apiDataChina = jsonDecode(responseChina.body);
      dynamic apiDataSing = jsonDecode(responseSing.body);
      dynamic apiDataItaly = jsonDecode(responseItaly.body);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ResultScreen(
          resultData: apiData,
          title: 'Covid19 Tracker',
          indonesiaData: apiDataIndonesia,
          chinaData: apiDataChina,
          singData: apiDataSing,
          italyData: apiDataItaly,
        );
      }));
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
