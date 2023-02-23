import 'package:flutter/material.dart';
import 'package:inmobosco/models/inmuebles.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({super.key, required this.post});

  final InmuebleResponse post;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${post.tipo}', style: textTheme.bodySmall),
        title: Text('${post.ubicacion}'),
        isThreeLine: true,
        subtitle: Text('${post.descripcion}'),
        dense: true,
      ),
    );
  }
}

