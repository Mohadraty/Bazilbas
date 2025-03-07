import 'package:bazilbas/bloc/home_bloc/home_cubit.dart';
import 'package:bazilbas/bloc/home_bloc/home_states.dart';
import 'package:bazilbas/components/prodict_viow.dart';
import 'package:bazilbas/content/home_content.dart';
import 'package:bazilbas/core/color_app.dart';
import 'package:bazilbas/widgets/hero_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BlocConsumer<HomeCubit, HomeStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = HomeCubit.get(context);
            return Scaffold(
              backgroundColor: ColorApp.backGround,
              appBar: HeroAppBar(context),
              body: HomeContent(
                cubit: cubit,
                body: productApiModel == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : !cubit.showOrders
                        ? GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: cubit.categorizer()!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return ProdictView(
                                productDetails: cubit.categorizer()![index]!,
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: ordersModel!.orders!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                child: ListTile(
                                    subtitle: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ordersModel!.orders![index]!.status!,
                                        ),
                                        Text(
                                          'last modified at: ${ordersModel!.orders![index]!.dateModified}',
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                      ],
                                    ),
                                    title: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ordersModel!.orders![index]!.price! +
                                              ' EGP',
                                        ),
                                        Text(
                                          'created at: ${ordersModel!.orders![index]!.dateCreated}',
                                          style: const TextStyle(fontSize: 11),
                                        ),
                                      ],
                                    )),
                              );
                            },
                          ),
              ),
            );
          }),
    );
  }
}
