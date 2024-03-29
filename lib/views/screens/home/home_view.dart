import 'package:buck/styles/styles.dart';
import 'package:buck/views/components/add_todo_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../todo_block.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => WillPopScope(
        onWillPop: () => Future.value(false),
        child: Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () => model.showSideBar(context),
                icon: Icon(Icons.menu, color: Colors.black),
              )),
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    _topSection(),
                    TodoBlock(day: "Today", dayTodoList: model.todayTodo),
                    TodoBlock(day: "Tomorrow", dayTodoList: model.tomorrowTodo),

                    //TODO: Implement todo views
                  ],
                ),
              ),
              AddTodoButton(onTap: () => model.addTodo(context))
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  _topSection() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16)
          .add(EdgeInsets.only(bottom: 30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Tasks", style: headlineStyle),
          Icon(Icons.notifications_none, size: 30)
        ],
      ));
}
