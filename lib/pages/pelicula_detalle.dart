import 'package:clase_3/models/cast_model.dart';
import 'package:clase_3/models/pelicula_model.dart';
import 'package:clase_3/providers/cast_provider.dart';
import 'package:flutter/material.dart';

import '../widgets/cast_list_view.dart';

class PeliculaDetalle extends StatelessWidget {
  PeliculaDetalle({Key? key, required this.pelicula}) : super(key: key);
  final Pelicula pelicula;
  late final castProvider = CastProvider();

  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(pelicula.title),
        //Un Appbar tiene una barra de acciones. Son a grandes rasgos botones
        //Los Actions esperan un widget para la parte grafica y un método onPress
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(children: [
        SizedBox(
            width: _screen.width,
            height: _screen.height * 0.3,
            child: FadeInImage(
              image: pelicula.getBackDropImg(),
              placeholder: const AssetImage('assets/images/no-image.png'),
              fit: BoxFit.cover,
            )),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
              child: SizedBox(
                height: 300,
                width: 150,
                child: FadeInImage(
                  image: pelicula.getPosterImg(),
                  placeholder: const AssetImage('assets/images/no-image.png'),
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
                    Text("RATING: " + pelicula.voteAverage.toString(),
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Text("Titulo original: " + pelicula.originalTitle,
                        style: TextStyle(fontSize: 18)),
                    Text("Fecha de lanzamiento: " + pelicula.originalTitle,
                        style: TextStyle(fontSize: 18)),
                    Text("Adultos " + (pelicula.adult ? "SI" : "NO"),
                        style: TextStyle(fontSize: 18))
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(pelicula.overview, style: TextStyle(fontSize: 18)),
        ),
        _listViewCast(context),
      ]),
    );
  }

  Widget _listViewCast(BuildContext context) {
    return FutureBuilder(
      future: castProvider.getCast(pelicula.id),
      builder: (BuildContext context, AsyncSnapshot<List<CastActor>> snapshot) {
          print(snapshot.data);
        if (snapshot.hasData) {
          return CastListView(actores: snapshot.data!);
        } else {
          return const SizedBox(
              height: 500.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
