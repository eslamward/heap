/* Implement Heap Sort on place */

extension HeapSort<E extends Comparable> on List<E> {
  int _leftChildIndex(int parentIndex) {
    return parentIndex * 2 + 1;
  }

  int _lrightChildIndex(int parentIndex) {
    return parentIndex * 2 + 2;
  }

  int _parentIndex(int childIndex) {
    return childIndex - 1 ~/ 2;
  }

  void _swap(int indexA, indexB) {
    var temp = this[indexA];
    this[indexA] = this[indexB];
    this[indexB] = temp;
  }

  void _siftDown({required int start, required int end}) {
    var parent = 0;

    var highPriority = parent;
    while (true) {
      final left = _leftChildIndex(parent);
      final right = _lrightChildIndex(parent);
      if (left < end && this[left].compareTo(this[parent]) > 0) {
        highPriority = left;
      }
      if (right < end && this[right].compareTo(this[highPriority]) > 0) {
        highPriority = right;
      }
      if (parent == highPriority) break;
      _swap(parent, highPriority);
      parent = highPriority;
    }
  }

  void heapSort() {
    if (isEmpty) return;
    final middel = length ~/ 2 - 1;
    for (int start = middel; start >= 0; start--) {
      _siftDown(start: start, end: length);
    }
    for (int end = length - 1; end > 0; end--) {
      _swap(0, end);
      _siftDown(start: 0, end: end);
    }
  }
}
