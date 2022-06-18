import 'package:clase_3/pages/pelicula_detalle.dart';
import 'package:flutter/material.dart';

import '../models/actor_model.dart';

class actorInfo extends StatelessWidget {
  actorInfo({Key? key, required this.actor}) : super(key: key);
  late Actor actor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(actor.name),
          //Un Appbar tiene una barra de acciones. Son a grandes rasgos botones
          //Los Actions esperan un widget para la parte grafica y un método onPress
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
                  child: SizedBox(
                    height: 300,
                    width: 150,
                    child: FadeInImage(
                      image: actor.getPhoto(),
                      placeholder:
                          const AssetImage('assets/images/no-image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Nombre: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: actor.name,
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Fecha de nacimiento: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: actor.getBirthDay(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Fecha defuncion: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: actor.getDeathDay(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(actor.biography, style: TextStyle(fontSize: 18)),
            ),
          ],
        ));
  }
}
