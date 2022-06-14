enum Priority { min, max }

class Heap<E extends Comparable<dynamic>> {
  Heap({List<E>? elements, this.priority = Priority.max}) {
    this.elements = elements ?? [];
    _heapFromList();
  }
  late final List<E> elements;
  Priority priority;

  bool get isEmpty => elements.isEmpty;
  int? get length => isEmpty ? null : elements.length;
  E? get peek => isEmpty ? null : elements.first;

  void _heapFromList() {
    if (isEmpty) return;
    int middle = length! ~/ 2 - 1;

    for (int start = middle; start >= 0; start--) {
      _siftDown(start);
    }
  }

  int _leftChildIndex(int parentIndex) {
    return parentIndex * 2 + 1;
  }

  int _rightChildIndex(int parentIndex) {
    return parentIndex * 2 + 2;
  }

  int _parentIndex(int childIndex) {
    return (childIndex - 1) ~/ 2;
  }

  void _swap(int indexA, indexB) {
    var temp = elements[indexA];
    elements[indexA] = elements[indexB];
    elements[indexB] = temp;
  }

  bool _hasHighPriority(E valueA, E valueB) {
    if (priority == Priority.max) {
      return valueA.compareTo(valueB) > 0;
    }
    return valueA.compareTo(valueB) < 0;
  }

  int _highPriority(int indexA, int indexB) {
    if (indexA >= elements.length) return indexB;
    E valueA = elements[indexA];
    E valueB = elements[indexB];
    bool highProirity = _hasHighPriority(valueA, valueB);
    return highProirity ? indexA : indexB;
  }

  void _siftDown(int parent) {
    while (true) {
      var _left = _leftChildIndex(parent);
      var _right = _rightChildIndex(parent);
      var high = _highPriority(_left, parent);
      high = _highPriority(_right, high);
      if (parent == high) break;
      _swap(parent, high);
      parent = high;
    }
  }

  _siftUp(int start) {
    var child = start;
    var parent = _parentIndex(child);
    while (child > 0 && child == _highPriority(child, parent)) {
      _swap(child, parent);
      child = parent;
      parent = _parentIndex(child);
    }
  }

  void insert(E value) {
    elements.add(value);
    int child = elements.length - 1;
    _siftUp(child);
  }

  E? remove() {
    var root = 0;
    _swap(root, elements.length - 1);
    final value = elements.removeLast();
    _siftDown(root);
  }

  E? removeAt(int index) {
    if (index >= elements.length || index < 0) return null;
    _swap(index, elements.length - 1);
    final value = elements.removeLast();
    _siftDown(index);
    return value;
  }

  int search(E value, {int start = 0}) {
    if (start >= elements.length) return -1;
    if (_hasHighPriority(value, elements[start])) return -1;
    if (value == elements[start]) return start;
    var left = search(value, start: _leftChildIndex(start));
    if (left != -1) return left;
    return search(value, start: _rightChildIndex(start));
  }

  @override
  String toString() {
    return elements.toString();
  }
}
