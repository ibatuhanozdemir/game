import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:flutter/material.dart';
import 'package:game/buildings/real_industry_building/real_industry_buildings.dart';
import 'package:game/buildings/stroragebuildings/storage_buildings.dart';
import 'package:game/daycircle.dart';
import 'package:game/kalip_widgetlar/exhibition_appbar_sheet.dart';
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
              ElevatedButton(
                VoidCallback: () async {
                  dynamic result2 = await SaveSystem().getResources();
                  context.read(asd3).startTimer();
                  if (result2 == null) {
                    print('error');
                  } else {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyApp2()));
                  }
                },
                key: Key(
                  "Tab bar tamam ama altındaki widgetlar yordu biraz. Onları da bir tek liste haline getiricem",
                  ),
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
final real_industry_buildings_provider =
    ChangeNotifierProvider((ref) => RealIndustryBuildings());
final town = ChangeNotifierProvider((ref) => TownServiceBuilding());
final food_building_provider = ChangeNotifierProvider((ref) => FoodBuilding());
final int calisma_yasi = 15;
final storage_building_provider =
    ChangeNotifierProvider((ref) => StorageBuilding());

class MyApp2 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final navWatch = watch(nav);
    watch(asd3);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF99997A),
        body: Stack(
          children: <Widget>[
            Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                bottom: MediaQuery.of(context).size.height * 0.078,
                Widget: navWatch.navigation()),
            Menu2(),
            ExhibitionBottomSheet(),
            CustomAppBar(),
            ExhibitionAppbarSheet(),
          ],
        ),
      ),
    );
  }
}
