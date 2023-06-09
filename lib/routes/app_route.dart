import 'package:finalquiz/screens/questionPage.dart';
import 'package:finalquiz/screens/resultPage.dart';
import 'package:finalquiz/screens/startPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import './app_route_constant.dart';

class MyAppRoute {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: MyAppRouteConstraint.startPageName,
      path: '/',
      pageBuilder: (context, state) {
        return MaterialPage(child: StartPage());
      },
    ),
    GoRoute(
      name: MyAppRouteConstraint.questionRouteName,
      path: '/question',
      pageBuilder: (context, state) {
        return MaterialPage(child: QuestionPage());
      },
    ),
    GoRoute(
        name: MyAppRouteConstraint.resultRouteName,
        path: '/result',
        pageBuilder: (context, state) {
          return MaterialPage(child: ResultPage());
        })
  ]);
}
