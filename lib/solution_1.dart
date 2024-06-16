import 'package:flutter/material.dart';


class Example1 extends StatelessWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.separated(
              primary: true,
              itemBuilder: (context, index) {
                return ListViewItem(index: index);
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: 200)),
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
