import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sports_app/Data/Models/Data%20Models/Countries/result.dart';
import 'package:sports_app/Screens/data%20screens/leagues_screen.dart';
import 'package:sports_app/Shared/widgets/search_text_field.dart';
import 'package:sports_app/Shared/widgets/grid_container.dart';

import '../../Data/Cubits/Countries Cubit/countries_cubit.dart';
import '../../Shared/methods/grid_map_body.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  TextEditingController searchController = TextEditingController();
  late List<Result>? filteredList;
  void searchItems(List<Result>? countriesList, String value) {
    filteredList = countriesList!
        .where((element) =>
            element.countryName!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    if (mounted) {
      context.read<CountriesCubit>().getAllCountries();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries"),
        centerTitle: true,
      ),
      body: BlocBuilder<CountriesCubit, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else if (state is CountriesSuccess) {
            List<Result>? countriesList = state.response.result;

            return Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: SearchTextField(
                      controller: searchController,
                      query: "country",
                      onChanged: (String value) {
                        searchItems(countriesList, value);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: AnimationLimiter(
                      child: GridView.count(
                        padding: const EdgeInsets.all(5),
                        crossAxisCount: 3,
                        crossAxisSpacing: 5,
                        childAspectRatio: 1,
                        mainAxisSpacing: 5,
                        children: searchController.text.isEmpty
                            ? countriesList!.asMap().entries.map((e) {
                                int index = e.key;
                                var value = e.value;
                                return gridMapBody(
                                    index,
                                    context,
                                    GridContainer(
                                        name: value.countryName!,
                                        logo: value.countryLogo!,
                                        nextScreen: LeaguesScreen(
                                            countryId:
                                                value.countryKey.toString(),
                                            countryName: value.countryName!,
                                            countryLogo: value.countryLogo!),
                                        imageHeight: height * 0.07,
                                        imageWidth: width * 0.4));
                              }).toList()
                            : filteredList!.asMap().entries.map((e) {
                                int index = e.key;
                                var value = e.value;
                                return gridMapBody(
                                    index,
                                    context,
                                    GridContainer(
                                        name: value.countryName!,
                                        logo: value.countryLogo!,
                                        nextScreen: LeaguesScreen(
                                            countryId:
                                                value.countryKey.toString(),
                                            countryName: value.countryName!,
                                            countryLogo: value.countryLogo!),
                                        imageHeight: height * 0.07,
                                        imageWidth: width * 0.4));
                              }).toList(),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: ElevatedButton(
                  onPressed: () {
                    context.read<CountriesCubit>().getAllCountries();
                  },
                  child: const Text("Try again")),
            );
          }
        },
      ),
    );
  }
}
