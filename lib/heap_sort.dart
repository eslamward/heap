/*
Build Heap Sort Function On Heap Data Structure
 */

import 'package:heap_sort/heab.dart';

List<E> heapSort<E extends Comparable<dynamic>>(List<E> list) {
  final heap = Heap<E>(elements: list.toList(), priority: Priority.min);

  final sortedList = <E>[];
  while (!heap.isEmpty) {
    final value = heap.remove();
    sortedList.add(value!);
  }
  return sortedList;
}
