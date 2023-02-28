import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inmobosco/Inmueble/inmueble.dart';
import 'package:inmobosco/repositories/inmbueble_repository.dart';
import 'package:inmobosco/bloc/authentication/authentication.dart';
import 'package:inmobosco/bloc/inmuebles/inmuebles_bloc.dart';
import 'package:inmobosco/bloc/inmuebles/inmuebles_event.dart';
import 'package:inmobosco/services/inmueble_service.dart';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('InmoBosco'),
        backgroundColor: Colors.red,
      ),
      body:
      BlocProvider(create: (_) => InmuebleBloc(InmuebleService())
      ..add(InmuebleFetched()),
      child: InmuebleList()),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Colors.red,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blueAccent, 
        items: const <BottomNavigationBarItem>[
        
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Lista',backgroundColor: Colors.red),
          BottomNavigationBarItem(icon: Icon(Icons.face), label: 'Perfil'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Configuracion'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Crear'), // new button
        ]
    ));
  }
}
