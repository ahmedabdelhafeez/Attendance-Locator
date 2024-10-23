

import 'package:flutter/material.dart';
import 'package:attendance_and_departure/core/constants/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';


openDialogMapsSheet(double lat,double long) async {
  try {
    final coords = Coords(lat, long);
    const title = "Order Address";
    final availableMaps = await MapLauncher.installedMaps;

    showModalBottomSheet(
      context: Constants.globalContext(),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            child: Wrap(
              children: <Widget>[
                for (var map in availableMaps)
                  ListTile(
                    onTap: () => map.showMarker(
                      coords: coords,
                      title: title,
                    ),
                    title: Text(map.mapName),
                    leading: SvgPicture.asset(
                      map.icon,
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  } catch (e) {
  }
}
