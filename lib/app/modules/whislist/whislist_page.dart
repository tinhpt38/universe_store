
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WhisListPage extends StatefulWidget {
  const WhisListPage({super.key});

  @override
  State<WhisListPage> createState() => _WhisListPageState();
}

class _WhisListPageState extends State<WhisListPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:   Center(child: Text('WhisListPage'),),
    );
  }
}