
import 'package:clean_architecture_example/features/NumberTrivia/presentation/pages/number_trivia_page.dart';
import 'package:clean_architecture_example/features/User/bloc/userbloc.dart';
import 'package:clean_architecture_example/features/User/ui/screens/home_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavBarUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CustomNavBarUser();
  }
}

class _CustomNavBarUser extends State<CustomNavBarUser> {
  int indexTap = 0;
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: 0, keepPage: true);

    void onTapTapped(int index) {
      setState(() {
        indexTap = index;
        controller.animateToPage(index,
            duration: Duration(milliseconds: 200), curve: Curves.ease);
      });
    }

    void pageChanged(int index) {
      setState(() {
        indexTap = index;
      });
    }

    final pageView = PageView(
      controller: controller,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[NumberTriviaPage(),HomeUser()],
    );

    return MultiBlocProvider(
      child: Scaffold(
        body: pageView,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              primaryColor: Colors.black),
          child: BottomNavigationBar(
            onTap: (index) {
              onTapTapped(index);
            },
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("")),
              BottomNavigationBarItem(icon: Icon(Icons.person), title: Text(""))
            ],
          ),
        ),
      ),
      providers: [
        BlocProvider<UserBloc>(create: (BuildContext context) => UserBloc(),)
      ],
    );
  }
}
