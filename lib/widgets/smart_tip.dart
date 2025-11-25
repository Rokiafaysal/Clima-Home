import 'package:flutter/material.dart';


class SmartTip extends StatefulWidget {
  final double temp;
  final double Light;
  const SmartTip({super.key, required this.temp, required this.Light});

  @override
  State<SmartTip> createState() => _SmartTip();
}

class _SmartTip extends State<SmartTip> {
  int _selectedIndex = 0;
  String tip = ''; 

  final List<Map<String, String>> _devices = [
    {'name': 'Fan', 'image': 'assets/images/Fan.png'},
    {'name': 'Light', 'image': 'assets/images/light.png'},
    {'name': 'Curtain', 'image': 'assets/images/Curtain.png'},
    {'name': 'Garage', 'image': 'assets/images/Garage.png'},
  ];


  @override
  void initState() {
    super.initState();
    Selectedtip(0);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [

        Padding(
          padding: EdgeInsets.only(top: height * (28 / 871)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_devices.length, (index) {
            
              bool isSelected = _selectedIndex == index;
              return InkWell(
                splashColor: Colors.transparent, 
                highlightColor: Colors.transparent, 
                onTap: ()=> Selectedtip(index),  
                child: CircleCard(image: _devices[index]['image']!,name: _devices[index]['name']!,color: isSelected ? const Color(0xffBABAF7) : const Color(0xfff7f7fb), ),
              );
            }),
          ),
        ),

        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * (31 / 871)),
              child: const Text(
                'Smart Tip',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.27,
                  color: Color(0xff0E0E1B),
                ),
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.only(top: height * (8 / 871)),
          child: Container(
            width: width * (358 / 390),
            height: height * (92 / 871), 
            decoration: BoxDecoration(
              color: const Color(0xffE4DFF1),
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  offset: const Offset(-4, -4),
                  blurRadius: 8,
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(8, 4),
                  blurRadius: 8,
                ),
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  offset: const Offset(4, 6),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Center(
                child: Text(tip,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0E0E1B),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }



  void Selectedtip(int index){
    if (index == 0){
      double temp = widget.temp; 
      if (temp < 20) {setState(() => tip = "It’s a bit cold — you might not need the fan right now." );} 
      else if (temp >= 20 && temp <= 28) {setState(() =>tip ="Temperature feels comfortable — the fan is optional.");} 
      else if (temp > 30) {setState(() =>tip ="It’s getting hot — turning on the fan can help you stay cool.");} 
    } 

    else if(index == 1) {  
      double ldrValue = widget.Light;
      if (ldrValue > 600) {setState(() => tip = "It’s already bright — you don’t need to turn the light on.");} 
      else if (ldrValue <= 600) {setState(() => tip = "It’s getting dark — turning on the light will make it cozier.");}
    }


    else if(index == 2){
      double ldrValue = widget.Light;
      if (ldrValue < 200) {setState(() => tip = "It’s a bit dark — opening the curtain can help brighten the room.");} 
      else if (ldrValue > 600) {setState(() => tip = "It’s very bright — closing the curtain might help reduce glare.");} 
      else {setState(() => tip = "Light level is moderate — you can open or close the curtain as you like.");}
    }

    else{setState(() => tip = "Ensure the garage is properly lit and secure.");}
    setState(() => _selectedIndex = index);

  }
}





class CircleCard extends StatelessWidget {


  final Color? color; 
  final String image ;
  final String name;



  const CircleCard({super.key, this.color, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
                  width: width * (80 / 390),
                  height: height * (80 / 781),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:color ?? Color(0xffF7F7FB)  ,

                                    boxShadow: [
                                        BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    offset: const Offset(4, 4),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Colors.white.withOpacity(0.8),
                    offset: const Offset(-4, -4),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                
                  
                ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 24,
                        height: 21,
                        child: Image.asset( image),
                      ),

                      Text(
                        name,
                        style: TextStyle(
                          color: Color(0xff0E0E1B),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
  }
}