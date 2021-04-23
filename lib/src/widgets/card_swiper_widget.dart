import 'package:flutter/material.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:carousel_slider/carousel_slider.dart';


class CardSwiper extends StatelessWidget {
  
  final List<Pelicula>? peliculas;
  
  CardSwiper({ required this.peliculas });

  
  @override
  Widget build(BuildContext context) {
    

    //peliculas![index].uniqueId = '${ peliculas![index].id }-tarjeta';
    //()=> Navigator.pushNamed(context, 'detalle', arguments: peliculas![index])

    return CarouselSlider.builder(
      itemCount: this.peliculas!.length, 
      itemBuilder:  (context, index, realIndex) => MoviePosterImage(pelicula: this.peliculas![index]),
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,

      )
    );

  }
}

class MoviePosterImage extends StatelessWidget {
  const MoviePosterImage({
    Key? key,
    required this.pelicula,
  }) : super(key: key);

  final Pelicula pelicula;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      image: NetworkImage( pelicula.getPosterImg()  ),
      placeholder: AssetImage('assets/img/no-image.jpg'),
      fit: BoxFit.cover,
    );
  }
}
