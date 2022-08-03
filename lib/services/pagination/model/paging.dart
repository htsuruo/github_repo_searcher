class Paging<E> {
  const Paging({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });
  final int totalCount;
  final bool incompleteResults;
  final List<E> items;

  // ignore: sort_constructors_first
  factory Paging.fromJson(
    Map<String, dynamic> json,
    E Function(Map<String, dynamic> json) fromJsonE,
  ) {
    final items = json['items'] as List;
    final itemsJson =
        items.map((dynamic e) => e as Map<String, dynamic>).toList();
    return Paging<E>(
      totalCount: json['total_count'] as int,
      incompleteResults: json['incomplete_results'] as bool,
      items: itemsJson.map(fromJsonE).toList(),
    );
  }
}
