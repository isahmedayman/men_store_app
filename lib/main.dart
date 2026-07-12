import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/network/dio_client.dart';
import 'package:men_store_app/core/network/dummy_dio_client.dart';
import 'package:men_store_app/core/routing/app_router.dart';
import 'package:men_store_app/features/address_book/data/data_source/address_remote_data_source.dart';
import 'package:men_store_app/features/address_book/data/repositories/address_repository.dart';
import 'package:men_store_app/features/address_book/presentation/manager/address_cubit.dart';
import 'package:men_store_app/features/auth/presentation/manager/log_in_cubit.dart';
import 'package:men_store_app/features/cart/data/repositories/cart_repository.dart';
import 'package:men_store_app/features/cart/presentation/manager/cart_cubit.dart';
import 'package:men_store_app/features/products/data/data_sources/product_remote_data_source.dart';
import 'package:men_store_app/features/products/data/repositories/product_repository.dart';
import 'package:men_store_app/features/products/presentation/manager/products_cubit.dart';

void main() {
  final productRepository = ProductRepository(
    ProductRemoteDataSourceImpl(DioClient().dio),
  );
  final addressRepository = AddressRepository(
    AddressRemoteDataSourceImpl(DioClient().dio),
  );
  final cartRepository = CartRepository(
    CartRemoteDataSourceImpl(DummyDioClient().dio),
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductsCubit(productRepository)..loadHomeData(),
        ),

        BlocProvider(
          create: (_) => AddressCubit(addressRepository)..loadAddresses(),
        ),

        BlocProvider(create: (_) => CartCubit(cartRepository)..loadCart()),

        BlocProvider(create: (_) => LogInCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp.router(
        title: 'Men Store App',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
