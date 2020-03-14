import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  // const MovieHorizontal({Key key}) : super(key: key);

  final List<Pelicula> peliculas;

  MovieHorizontal({ @required this.peliculas });//entre llaves es como si fuera opcional

  @override
  Widget build(BuildContext context) {
    // Si queremos el 20% necesitamos saber cuanto mide la pantalla
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.2,
      // PageView nos sirve para deslizar widgets o páginas
      child: PageView(
        pageSnapping: false,
        controller: PageController(
          initialPage: 1,
          viewportFraction: 0.3,
        ),
        children: _tarjetas(context)
      ),
    );
  }

  List<Widget> _tarjetas(context) {
    return peliculas.map((pelicula){
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(pelicula.title,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,)
          ],
        ),
      );
    }).toList(); //Retorna una nueva lista que se transorma en un listado de widgets
  }
}