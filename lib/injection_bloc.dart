import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manican/core/components/app_cubit/cubit.dart';
import 'package:manican/core/components/app_cubit/states.dart';
import 'package:manican/core/constance/appLink.dart';
import 'package:manican/core/theme/app_theme.dart';
import 'package:manican/di/appInitializer.dart';
import 'package:manican/features/authentication/presentation/bloc/cubit.dart';
import 'package:manican/features/before_after/presentation/bloc/cubit/before_after_cubit.dart';
import 'package:manican/features/booking/presentation/bloc/cubit/booking_bolc_cubit.dart';
import 'package:manican/features/branches/presentation/bloc/branches_bloc/branches_bloc.dart';
import 'package:manican/features/complaints/presentation/bloc/cubit.dart';
import 'package:manican/features/employees/presentation/bloc/cubit.dart';
import 'package:manican/features/offers/presentation/bloc/offer_bloc/offer_bloc.dart';
import 'package:manican/features/services/presentation/bloc/cubit/service_bolc_cubit.dart';
import 'package:manican/features/statistic/presentation/bloc/statistic_bloc/statistic_bloc.dart';
import 'package:manican/shared_screen/wait_update_screen.dart';
import 'package:manican/di/injectionContainer.dart' as di;

Widget buildBlocProviders(BuildContext context) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => di.sl<LoginCubit>()),
      BlocProvider(create: (context) => di.sl<StatisticBloc>()),
      BlocProvider(create: (context) => di.sl<BranchesBloc>()),
      BlocProvider(create: (context) => di.sl<BookingBloc>()),
      BlocProvider(create: (context) => di.sl<BeforeAfterBloc>()),
      BlocProvider(create: (context) => di.sl<OffersBloc>()),
      BlocProvider(create: (context) => di.sl<ServiceBloc>()),
      BlocProvider(create: (context) => AppCubit()),
      BlocProvider(
          create: (context) => di.sl<EmployeesCubit>()
            ..getAllEmployees(int.parse(AppLink.branchId))),
      BlocProvider(
          create: (context) => di.sl<ComplaintsCubit>()
            ..getAllComplaints(int.parse(AppLink.branchId))),
    ],
    child: MaterialApp(
      title: 'AlMALIKAN WEBSITE',
      theme: appTheme,
      locale: context.locale,
      builder: (context, child) => Overlay(
        initialEntries: [
          OverlayEntry(
            builder: (context) => Navigator(
              onGenerateRoute: (settings) => MaterialPageRoute(
                builder: (context) => LayoutBuilder(
                  builder: (context, constraints) {
                    double screenWidth = constraints.maxWidth;
                    if (screenWidth >= 900) {
                      return BlocBuilder<AppCubit, AppStates>(
                        builder: (context, state) {
                          AppCubit cubit = AppCubit.get(context);

                          if (AppInitializer.isHaveAuth) {
                            return cubit.screens[cubit.selectedScreenIndex];
                          } else {
                            return AppInitializer.startScreen;
                          }
                        },
                      );
                    } else {
                      return const WaitUpdateScreen();
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
    ),
  );
}
