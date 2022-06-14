import 'package:heap_sort/heab.dart';
import 'package:heap_sort/heap_sort_in_place.dart';

void main(List<String> arguments) {
  Heap heap = Heap<int>(elements: [10, 15, 5, 100, 7, 1000, 1]);
  heap.insert(10);
  heap.insert(15);
  heap.insert(5);
  heap.insert(100);
  heap.insert(7);
  heap.insert(1000);

  heap.insert(1);

  List<int> list = [10, 15, 5, 100, 7, 1000, 1];
  print(list);
  print("------");
  list.heapSort();
  print(list);
  print("**");
}
