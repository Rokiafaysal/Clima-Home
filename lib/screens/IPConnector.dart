import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:smart_home_app/screens/Controls_UI/Backend/IP.dart";
import "package:smart_home_app/widgets/CoustomWidget.dart";


class Ipconnector extends StatefulWidget{
  const Ipconnector({super.key});

  @override
  State<Ipconnector> createState() => _Ipconnector();

}


class _Ipconnector extends State<Ipconnector>{

  final TextEditingController FanlightipText = TextEditingController();
  final TextEditingController CurtainipText = TextEditingController();
  final TextEditingController GarageipText = TextEditingController();



  @override
  Widget build(BuildContext context) {

    AppBar PageAppbar = AppBar(title: Text("IP Connector"),centerTitle: true,titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Color(0xff0E0E1B),letterSpacing: -0.6,),);
    
    TextField FanLightIP = TextField(controller: FanlightipText,keyboardType: TextInputType.number,decoration:TextfeildDecor(LabelText: "fanLight IP",HintText: Provider.of<CurrentIP>(context).fanlightip));
    TextField CurtainIP = TextField(controller: CurtainipText,keyboardType: TextInputType.number,decoration: TextfeildDecor(LabelText: 'Curtain IP',HintText: Provider.of<CurrentIP>(context).curtainip));
    TextField GarageIP = TextField(controller: GarageipText ,keyboardType: TextInputType.number,decoration: TextfeildDecor(LabelText: 'Garage IP',HintText: Provider.of<CurrentIP>(context).garageip));

   Consumer<CurrentIP> savebutton =  Consumer<CurrentIP>(builder: (context, provider, _) 
   => FilledButton(onPressed: (){

    provider.ChangeIP(fanlightIP: FanlightipText.text, curtainIP: CurtainipText.text, garageIP: GarageipText.text);
    Customwidgets.showCustomSnackBar(context: context, message: "IP Changed Succefully");
  
    }, child: Text("save",style: TextStyle(fontWeight: FontWeight.bold),))  ,);


    Column Controls = Column(children: [FanLightIP,CurtainIP,GarageIP,savebutton],spacing: 15,);
    Container mainapp_body = Container(child: Controls,padding: EdgeInsets.all(10),); 
    return Scaffold(appBar: PageAppbar,body: mainapp_body,);
  }



  InputDecoration TextfeildDecor({required String LabelText,required String HintText}){

    return InputDecoration(labelText: LabelText,hintText:HintText ,
      labelStyle: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.w600),
      border: OutlineInputBorder()
    
    );




  }




}