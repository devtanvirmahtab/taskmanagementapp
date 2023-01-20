import 'package:flutter/material.dart';
import 'package:taskmanagementapp/screens/add_newtask_screen.dart';
import 'package:taskmanagementapp/screens/cancel_task_screen.dart';
import 'package:taskmanagementapp/screens/completed_task_screen.dart';
import 'package:taskmanagementapp/screens/inprogress_task_screen.dart';
import 'package:taskmanagementapp/screens/new_task_screen.dart';

import '../widgets/reusable_appbar.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  int currentSelectedScreen = 0;
  List<Widget> screens= [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelTaskScreen(),
    InprogressTaskScreeen()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: ReusableAppBar(context),
      body: screens[currentSelectedScreen],
      floatingActionButton: currentSelectedScreen == 0 ? FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewTaskScreen()));
        },
      ) : SizedBox(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentSelectedScreen,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index){
          currentSelectedScreen = index;
          setState(() {

          });
          print(index);
        },
        items: const[
          BottomNavigationBarItem(icon: Icon(Icons.task),label: 'New'),
          BottomNavigationBarItem(icon: Icon(Icons.task_rounded),label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.task_alt),label: 'Cancelled'),
          BottomNavigationBarItem(icon: Icon(Icons.add_task),label: 'In progress'),
        ],
      ),
    );
  }


}
