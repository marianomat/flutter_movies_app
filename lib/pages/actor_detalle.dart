import 'package:clase_3/models/cast_model.dart';
import 'package:clase_3/models/pelicula_model.dart';
import 'package:clase_3/providers/actor_provider.dart';
import 'package:clase_3/providers/cast_provider.dart';
import 'package:clase_3/widgets/actor_info.dart';
import 'package:flutter/material.dart';

import '../models/actor_model.dart';
import '../widgets/cast_list_view.dart';

class ActorDetalle extends StatelessWidget {
  ActorDetalle({Key? key, required this.actorid}) : super(key: key);
  final int actorid;

  late final actorProvider = ActorProvider();

  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    return _Actor(context);
  }

  Widget _Actor(BuildContext context) {
    return FutureBuilder(
      future: actorProvider.getActor(actorid),
      builder: (BuildContext context, AsyncSnapshot<Actor> snapshot) {
        if (snapshot.hasData) {
          return actorInfo(actor: snapshot.data!);
        } else {
          return const SizedBox(
              height: 500.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
