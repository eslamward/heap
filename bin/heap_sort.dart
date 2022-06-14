import 'package:heap_sort/heab_sort.dart';

void main(List<String> arguments) {
  Heap heap = Heap<int>(elements: [10, 15, 5, 100, 7, 1000, 1]);
  heap.insert(10);
  heap.insert(15);
  heap.insert(5);
  heap.insert(100);
  heap.insert(7);
  heap.insert(1000);

  heap.insert(1);
  print(heap);
  print(heap);
  print(heap.search(10));
  print(heap);
}
