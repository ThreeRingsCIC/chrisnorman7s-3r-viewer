import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';
import 'loading_page.dart';
import 'settings.dart';

import 'tabs/events_tab.dart';
import 'tabs/news_tab.dart';
import 'tabs/shifts_tab.dart';
import 'tabs/volunteers_tab.dart';

Future<void> main() async {
  runApp(
    MaterialApp(
      title: appTitle,
      home: LoadingPage(),
    )
  );
  final File apiKeyFile = File(apiKeyFilename);
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (apiKeyFile.existsSync()) {
    final String apiKey = await apiKeyFile.readAsString();
    prefs.setString(apiKeyPreferenceName, apiKey);
  }
  settings.apiKey = prefs.getString(apiKeyPreferenceName);
  tabs['News'] = NewsTab();
  tabs['Events'] = EventsTab();
  tabs['Volunteers'] = const VolunteersTab('All Volunteers');
  return runApp(
    MaterialApp(
      title: appTitle,
      home: ShiftsTab(),
    )
  );
}
