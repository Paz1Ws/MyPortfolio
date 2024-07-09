import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexPagination = StateProvider<int>((ref) => 0);

final isVisible = StateProvider<bool>((ref) => true);
