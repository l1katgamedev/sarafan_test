import 'package:flutter/material.dart';
import 'package:sarafan_test/presentation/screens/add_task_screen.dart';
import 'package:sarafan_test/presentation/screens/completed.dart';
import 'package:sarafan_test/presentation/screens/unpcompleted.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: const AddTaskScreen(),
        ),
      ),
    );
  }

  int currentTab = 0;

  final List<Widget> tabs = const [
    Uncompleted(),
    Completed(),
  ];

  @override
  void initState(){
    super.initState();
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Uncompleted();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'To Do App',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(context),
        tooltip: 'Add Task',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: Colors.cyan,
        notchMargin: 6,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = const Uncompleted();
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.assignment_outlined,
                      color: currentTab == 0 ? Colors.white : Colors.cyanAccent,
                    ),
                    Text(
                      'Незаконченные',
                      style: TextStyle(
                          fontSize: 16,
                          color: currentTab == 0
                              ? Colors.white
                              : Colors.cyanAccent),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = const Completed();
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.assignment_turned_in_rounded,
                      color: currentTab == 1 ? Colors.white : Colors.cyanAccent,
                    ),
                    Text(
                      'Завершенные',
                      style: TextStyle(
                          fontSize: 16,
                          color: currentTab == 1
                              ? Colors.white
                              : Colors.cyanAccent),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
