import 'package:flutter/material.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  late FocusScopeNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusScopeNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            _focusNode.requestFocus();
            setState(() {});
          },
          child: FocusScope(
            node: _focusNode,
            child: ListView.separated(
                primary: _focusNode.hasFocus,
                itemBuilder: (context, index) {
                  return ListViewItem(index: index);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: 200),
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