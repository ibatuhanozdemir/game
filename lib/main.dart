import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter/material.dart';
import 'package:game/buildings/real_industry_building/real_industry_buildings.dart';
import 'package:game/daycircle.dart';
import 'package:game/kalip_widgetlar/custom_dropdown.dart';
import 'package:game/menu2.dart';
import 'package:game/navigation.dart';
import 'package:game/savesystem/save_system.dart';
import 'package:game/town_services/town_service_building.dart';
import 'package:rive/rive.dart';
import 'buildings/foodbuildings/food_buildings.dart';
import 'buildings/industrybuildings/industy_buildings.dart';
import 'kalip_widgetlar/exhibition_bottom_sheet.dart';
import 'kalip_widgetlar/custom_app_bar.dart';


void main() {
  runApp(ProviderScope(child: MaterialApp(title: 'river', home: MyApp())));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool get isPlaying => _controller?.isActive ?? false;
  Artboard _riveArtboard;
  RiveAnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rootBundle.load('images/new_file.riv').then(
      (data) async {
        final file = RiveFile();
        if (file.import(data)) {
          final artboard = file.mainArtboard;
          artboard.addController(_controller = SimpleAnimation('Untitled 1'));
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Giriş'),
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                width: 300,
                height: 300,
                child: _riveArtboard == null
                    ? const SizedBox()
                    : Rive(
                        artboard: _riveArtboard,
                        fit: BoxFit.contain,
                      ),
              ),
              RaisedButton(
                child: Text(
                  "Tab bar tamam ama altındaki widgetlar yordu biraz. Onları da bir tek liste haline getiricem",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: "Alike"),
                ),
                onPressed: () async {
                  dynamic result2 = await SaveSystem().getResources();
                  context.read(asd3).startTimer();
                  if (result2 == null) {
                    print('error');
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyApp2()));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
final nav = ChangeNotifierProvider((ref) => Navigation());
final asd3 = ChangeNotifierProvider((ref) => Daycircle());
final aa = ChangeNotifierProvider((ref) => IndustryBuilding());
final real_industry_buildings_provider= ChangeNotifierProvider((ref) => RealIndustryBuildings());
final town = ChangeNotifierProvider((ref)=> TownServiceBuilding());
final food_building_provider = ChangeNotifierProvider((ref) => FoodBuilding());
class MyApp2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final greeting5 = watch(asd3);
    final navWatch = watch(nav);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF99997A),
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.22),
          child: AppBar(
            flexibleSpace: CustomAppBar(),
          ),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
              top: MediaQuery.of(context).size.height * 0.005,
              width: MediaQuery.of(context).size.width,
              bottom: MediaQuery.of(context).size.height *0.078,
              child: navWatch.navigation()
            ),
            Menu2(),
            ExhibitionBottomSheet(),
          ],
        ),
      ),
    );
  }



}


