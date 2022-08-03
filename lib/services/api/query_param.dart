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

  Map<String, String> get toMap {
    final sort = this.sort;
    final order = this.order;
    final perPage = this.perPage;
    final page = this.page;
    return {
      'q': q,
      if (sort != null) 'sort': sort,
      if (order != null) 'order': order,
      if (perPage != null) 'perPage': perPage.toString(),
      if (page != null) 'page': page.toString(),
    };
  }
}
