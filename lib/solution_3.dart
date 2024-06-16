import 'package:flutter/material.dart';
class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> {
  late ScrollController _controller;
  late FocusNode _focusNode;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: KeyboardListener(
          autofocus: true,
          focusNode: _focusNode,
          onKeyEvent: (value) {
            if (_controller.position.outOfRange) {
              return;
            }
            final offset = _controller.offset;
            if (value.physicalKey.debugName == "Arrow Down") {
              _controller.animateTo(offset + 50,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear);
            }
            if (value.physicalKey.debugName == "Arrow Up") {
              _controller.animateTo(offset - 50,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear);
            }
          },
          child: ListView.separated(
            controller: _controller,
            itemBuilder: (context, index) {
              return ListViewItem(index: index);
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            itemCount: 200,
          ),
        ),
      ),
    );
  }
}

class ListViewItem extends StatelessWidget {
  final int index;
  const ListViewItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      alignment: Alignment.center,
      child: SizedBox(
        width: 300,
        height: 75,
        child: Card(
          child: ListTile(
            title: Text(
              "At Index $index",
              style: const TextStyle(fontSize: 22),
            ),
            subtitle: const Text("some random text"),
          ),
        ),
      ),
    );
  }
}