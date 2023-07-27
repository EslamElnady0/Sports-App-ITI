import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app/Shared/country_container.dart';

import '../Data/Cubits/Countries Cubit/countries_cubit.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
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
      appBar: AppBar(),
      body: BlocBuilder<CountriesCubit, CountriesState>(
        builder: (context, state) {
          if (state is CountriesLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white,
            ));
          } else if (state is CountriesSuccess) {
            var countriesList = state.response.result;
            return GridView.count(
                padding: const EdgeInsets.all(10),
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                childAspectRatio: 1,
                mainAxisSpacing: 5,
                children: countriesList!.map((e) {
                  return CountryContainer(
                    countryId: e.countryKey.toString(),
                    result: e,
                  );
                }).toList());
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
