import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Example4 extends StatelessWidget {
  const Example4({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: ScrollableList(
              children: [
                Text(
                  "Heading 1",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 20,
                ),
                Item(),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Heading 2",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 20,
                ),
                Item(),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Heading 3",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 20,
                ),
                Item(),
              ],
            ),
          )),
    );
  }
}

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 250,
        width: 400,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
        child: ScrollableList(
          children: List.generate(
              50,
                  (index) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor:
                  Colors.accents[index % Colors.accents.length],
                  child: Text(index.toString()),
                ),
                title: Text("some random text at $index"),
              )),
        ),
      ),
    );
  }
}

class ScrollableList extends StatefulWidget {
  final List<Widget> children;
  final Axis? scrollAxis;

  const ScrollableList({super.key, this.children = const [], this.scrollAxis});

  @override
  State<ScrollableList> createState() => _ScrollableList1State();
}

class _ScrollableList1State extends State<ScrollableList> {
  late FocusNode _focusNode;
  late ScrollController _controller;
  @override
  void initState() {
    _focusNode = FocusNode();
    _controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  bool _checkIfOutOfRange() => _controller.position.outOfRange;
  void _handleDownPress() {
    if (_checkIfOutOfRange()) {
      return;
    }
    _controller.animateTo(_controller.offset + 50,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  void _handleUpPress() {
    if (_controller.offset == 0) {
      return;
    }
    _controller.animateTo(_controller.offset - 50,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _focusNode.requestFocus();
        setState(() {});
      },
      child: FocusableActionDetector(
        focusNode: _focusNode,
        shortcuts: {
          LogicalKeySet(LogicalKeyboardKey.arrowUp): ScrollUpIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowDown): ScrollDownIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowLeft): ScrollLeftIntent(),
          LogicalKeySet(LogicalKeyboardKey.arrowRight): ScrollRightIntent(),
        },
        actions: {
          ScrollUpIntent: CallbackAction<ScrollUpIntent>(
            onInvoke: (intent) {
              _handleUpPress();
              return;
            },
          ),
          ScrollDownIntent: CallbackAction<ScrollDownIntent>(
            onInvoke: (intent) {
              _handleDownPress();
              return;
            },
          ),
          ScrollRightIntent: CallbackAction<ScrollRightIntent>(
            onInvoke: (intent) {
              _handleDownPress();
              return;
            },
          ),
          ScrollLeftIntent: CallbackAction<ScrollLeftIntent>(
            onInvoke: (intent) {
              _handleUpPress();
              return;
            },
          ),
        },
        child: ListView.builder(
            controller: _controller,
            scrollDirection: widget.scrollAxis ?? Axis.vertical,
            itemCount: widget.children.length,
            itemBuilder: (context, index) {
              return widget.children[index];
            }),
      ),
    );
  }
}

class ScrollUpIntent extends Intent {}

class ScrollDownIntent extends Intent {}

class ScrollLeftIntent extends Intent {}

class ScrollRightIntent extends Intent {}
