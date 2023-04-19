
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart';

MultiBlocProvider provideApp(Widget child) => MultiBlocProvider(
      providers: [
       // BlocProvider(create: (_) => getIt<AuthCubit>()),
      ],
      child: child,
    );
