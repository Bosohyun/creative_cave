import 'package:creative_cave/src/auth/data/datasources/auth_remote_dart_source.dart';
import 'package:creative_cave/src/auth/data/repos/auth_repo_impl.dart';
import 'package:creative_cave/src/auth/domain/repos/auth_repo.dart';
import 'package:creative_cave/src/auth/domain/usecases/forgot_password.dart';
import 'package:creative_cave/src/auth/domain/usecases/sign_in.dart';
import 'package:creative_cave/src/auth/domain/usecases/sign_in_google.dart';
import 'package:creative_cave/src/auth/domain/usecases/sign_up.dart';
import 'package:creative_cave/src/auth/domain/usecases/update_user.dart';
import 'package:creative_cave/src/auth/presentation/bloc/auth_bloc.dart';

import 'package:get_it/get_it.dart';

part 'injection_container.main.dart';
