import 'package:creative_cave/core/extensions/context_extension.dart';
import 'package:creative_cave/core/services/injection_container.dart';
import 'package:creative_cave/src/auth/data/models/user_model.dart';

import 'package:creative_cave/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:creative_cave/src/auth/presentation/views/sign_in_view.dart';
import 'package:creative_cave/src/auth/presentation/views/sign_up_view.dart';
import 'package:creative_cave/src/dashboard/presentation/views/dashboard.dart';
import 'package:creative_cave/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:creative_cave/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:creative_cave/src/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fui;
import 'package:creative_cave/src/settings/views/settings_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'router.main.dart';
