import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/widgets/card_home.dart';
import 'package:smart_home_app/widgets/circle_card.dart';
import 'package:smart_home_app/screens/Controls_UI/Backend/Provider.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffEEE8F0),
      appBar: AppBar(
        backgroundColor: Color(0xffF7F7FB),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.wifi,color:Color(0xfff7f7fb) ,)),
        elevation: 0,
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
                        horizontal: width * (30 / 390),
                        vertical: height * (30 / 871),
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
                          value: '22°C',
                          title: 'Temperature',
                        ),
                        SizedBox(width: width * (16 / 390)),
                        CardHome(
                          imageName: 'assets/images/humidity.png',
                          value: '45%',
                          title: 'humidity',
                        ),
                      ],
                    ),
        
                    SizedBox(height: height * (16 / 871)),
        
                    Row(
                      children: [
                        CardHome(
                          imageName: 'assets/images/rain.png',
                          value: 'No Rain',
                          title: 'Rain',
                        ),
                        SizedBox(width: width * 0.04),
                        CardHome(
                          imageName: 'assets/images/sun.png',
                          value: 'Bright',
                          title: 'Light',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        
              Padding(
                padding:  EdgeInsets.only(top: height*(28/871) ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleCard(image: 'assets/images/Fan.png', name: 'Fan',color:Provider.of<CurrentState>(context).autoFanState? Color(0xffBABAF7):Color(0xfff7f7fb)),
                    CircleCard(image: 'assets/images/light.png', name: 'Light' ,color:Provider.of<CurrentState>(context).autoLightState? Color(0xffBABAF7):Color(0xfff7f7fb),),
                    CircleCard(image: 'assets/images/Curtain.png', name: 'Curtain',color:Provider.of<CurrentState>(context).autoCurtainState? Color(0xffBABAF7):Color(0xfff7f7fb)),
                    CircleCard(image: 'assets/images/Garage.png', name: 'Garage',color:Provider.of<CurrentState>(context).autoGarageState? Color(0xffBABAF7):Color(0xfff7f7fb))
                  ],
                ),
              ),
        
              Padding(
                padding:  EdgeInsets.only(top: height*(31/871) ),
                child: Text('Smart Tip',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.27,
                  color: Color(0xff0E0E1B)),),
              ),
        
        
        
               Padding(
                 padding:  EdgeInsets.only(top:height*(8/871)),
                 child: Container(
                  width: width * (358 / 390),
                  height: height * (92 / 871),
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
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width*(16/390), vertical: height*(16/871)),
                    child: Text(
                            
                      'No motion detected — save energy by keeping the light off.',
                      overflow: TextOverflow.visible,
                            softWrap: true,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff0E0E1B)
                      ),
                    ),
                  ),
                         ),
               ),
          ])),
      )  );
  }
}
