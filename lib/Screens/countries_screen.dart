import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sports_app/Data/Models/Countries/result.dart';
import 'package:sports_app/Shared/widgets/country_container.dart';
import 'package:sports_app/Shared/widgets/search_text_field.dart';

import '../Data/Cubits/Countries Cubit/countries_cubit.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  // TextEditingController _searchController = TextEditingController();
  // List<Result>? _filteredItems = [];

  // List<Result>? filterItems(String query, List<Result>? countryList) {
  //   List<Result>? filteredList = [];
  //   for (Result item in countryList!) {
  //     if (item.countryName!.toLowerCase().contains(query.toLowerCase())) {
  //       filteredList.add(item);
  //     }
  //   }
  //   return filteredList;
  // }

  @override
  void initState() {
    if (mounted) {
      context.read<CountriesCubit>().getAllCountries();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SearchTextField(
                    // controller: _searchController,
                    query: "country",
                    onChanged: (String value) {
                      // _filteredItems =
                      //     filterItems(_searchController.text, countriesList);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: AnimationLimiter(
                      child: GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5,
                          childAspectRatio: 1,
                          mainAxisSpacing: 5,
                          children: countriesList!.asMap().entries.map((e) {
                            int index = e.key;
                            var value = e.value;
                            return AnimationConfiguration.staggeredGrid(
                              columnCount: 3,
                              duration: const Duration(milliseconds: 1500),
                              position: index,
                              child: FadeInAnimation(
                                curve: Curves.easeIn,
                                child: SlideAnimation(
                                  duration: const Duration(milliseconds: 900),
                                  horizontalOffset:
                                      MediaQuery.of(context).size.width,
                                  verticalOffset:
                                      MediaQuery.of(context).size.height,
                                  child: CountryContainer(
                                    countryName: value.countryName!,
                                    countryId: value.countryKey.toString(),
                                    result: value,
                                  ),
                                ),
                              ),
                            );
                          }).toList()),
                    ),
                  ),
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
