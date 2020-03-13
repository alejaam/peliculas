import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  // const CardSwiper({Key key}) : super(key: key);

  //Definimos la lista final porque no va a cambiar
  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    // Mediaquery da información de las dimensiones del dispotsitivo
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      //Debemos especificar dimensiones, de lo contrario no sabe donde pintarse

      child: Swiper(
        itemWidth: _screenSize.width * 0.7, //Ocupa todo el ancho de la pagina
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          // Metemos dentro del ClipRRect nuestra imagen para poder ponerle borde redondeado
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.fill,
                image: NetworkImage(peliculas[index].getPosterImg())),
            // child: Center(child: Text(peliculas[index].toString()),),
          );
        },
        // autoplay: true ,
        itemCount: peliculas.length,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
        //Para tener el efecto "Tinder" declaramos lo siguiente
      ),
    );
  }
}
