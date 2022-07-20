import 'package:flutter/material.dart';

@immutable
class QueryParam {
  const QueryParam({
    required this.q,
    this.sort,
    this.order,
    this.perPage,
    this.page,
  });
  final String q;
  final String? sort;
  final String? order;
  final int? perPage;
  final int? page;
}
