import 'package:flutter/material.dart';

import 'pagination.dart';

@immutable
class Paging<E> {
  const Paging({
    required this.pagination,
    required this.items,
  });
  final Pagination pagination;
  final List<E> items;
}
