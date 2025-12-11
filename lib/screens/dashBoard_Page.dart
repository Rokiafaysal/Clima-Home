import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/Provider/Sensors.dart';
import 'package:smart_home_app/functions.dart';
import 'package:smart_home_app/screens/IPConnector.dart';
import 'package:smart_home_app/widgets/CoustomWidget.dart';
import 'package:smart_home_app/widgets/card_home.dart';
import 'package:smart_home_app/widgets/smart_tip.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  


  @override
  void initState() {
    super.initState();
    returnPrediction();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    


    return Scaffold(
      backgroundColor: Color(0xffEEE8F0),
      appBar: AppBar(
        backgroundColor: Color(0xffF7F7FB),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Ipconnector(),)), icon: Icon(Icons.wifi,color:Color(0xfff7f7fb) ,)),
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
          ),
        ),
        title: SizedBox(
          width: width * (90 / 390),
          height: height * (42 / 871),

          child: Image.asset('assets/images/logo4.png'),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.04,
            vertical: height * (16 / 871),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width * (358 / 390),
                height: height * (112 / 871),
                decoration: BoxDecoration(
                  color: Color(0xffE4DFF1),
        
                  borderRadius: BorderRadius.all(Radius.circular(24)),
        
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      offset: const Offset(-4, -4),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(8, 4),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                    BoxShadow(
                      color: Colors.white.withOpacity(0.8),
                      offset: const Offset(4, 6),
                      blurRadius: 8,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * (28 / 390),
                        vertical: height * (28 / 871),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Comfortable',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
        
                          Text(
                            'Current Home Status',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
        
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 22.0),
                      child: Image.asset(
                        'assets/images/Gemini.png',
                        width: 110,
                        height: 71,
                      ),
                    ),
                  ],
                ),
              ),
        
              Padding(
                padding: EdgeInsets.only(top: height * (20 / 871)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CardHome(
                          imageName: 'assets/images/temp.png',
                          value: '${Provider.of<Sensors>(context).Temperature.toInt()}°C',
                          title: 'Temperature',
                        ),
                        SizedBox(width: width * (16 / 390)),
                        CardHome(
                          imageName: 'assets/images/humidity.png',
                          value: '${Provider.of<Sensors>(context).humuidity.toInt()}%',
                          title: 'humidity',
                        ),
                      ],
                    ),
        
                    SizedBox(height: height * (16 / 871)),
        
                    Row(
                      children: [
                        CardHome(
                          imageName: 'assets/images/rain.png',
                          value: rainMapping(),
                          title: 'Rain',
                        ),
                        SizedBox(width: width * 0.04),
                        CardHome(
                          imageName: 'assets/images/sun.png',
                          value: LightMapping(),
                          title: 'Light',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        
              SmartTip(temp: Provider.of<Sensors>(context).Temperature,Light: Provider.of<Sensors>(context).Light,)
          ])),
      )  );
  }


  void returnPrediction()async{
    Map prediction =  await PublicFunctions.getPrediction(context: context);

    Provider.of<Sensors>(context,listen: false).updatetemp(newTemp:prediction["prediction"][0] );
    Provider.of<Sensors>(context,listen: false).updatehum(newHumuidity:prediction["prediction"][1] );
    Provider.of<Sensors>(context,listen: false).updatelight(newLight:prediction["prediction"][2] );

  }

  String LightMapping() {
    double light = Provider.of<Sensors>(context, listen: false).Light;

    if (light < 200) {
      return "Low light";
    } else if (light <= 600) {
      return "Moderate light";
    } else {
      return "Strong sun";
    }
  }

  String rainMapping() {
    double rain = Provider.of<Sensors>(context, listen: false).rain;

    if (rain == 0) {
      return "No Rain!";
    } 
    else {
      Customwidgets.showCustomSnackBar(context: context, message: "Check Your Internet Connection!",isError: true);

      return "is Raining Now!";
    }
  }

}
