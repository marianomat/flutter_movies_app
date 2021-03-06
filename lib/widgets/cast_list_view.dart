import 'dart:math';

import 'package:clase_3/models/actor_model.dart';
import 'package:clase_3/models/cast_model.dart';
import 'package:clase_3/models/pelicula_model.dart';
import 'package:clase_3/pages/actor_detalle.dart';
import 'package:clase_3/pages/pelicula_detalle.dart';
import 'package:clase_3/providers/cast_provider.dart';
import 'package:clase_3/providers/peliculas_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clase_3/pages/actor_detalle.dart';
import 'package:clase_3/models/actor_model.dart';

class CastListView extends StatelessWidget {
  final List<CastActor> actores;

  CastListView({Key? key, required this.actores}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: actores.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ActorDetalle(
                                actorid: actores[index].id,
                              ),
                            ),
                          );
                        },
                        child: FadeInImage(
                            placeholder:
                                const AssetImage("assets/images/no-image.png"),
                            fit: BoxFit.cover,
                            image:
                                actores[index % actores.length].getActorImg()),
                      ),
                    ),
                  ),
                ),
                Text(actores[index % actores.length].name),
                Text(actores[index % actores.length].originalName)
              ],
            );
          }),
    );
  }
}
