import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/Countries/result.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  late List<Result>? filteredItems;

  void searchItems(List<Result>? list, String value) {
    filteredItems = list!
        .where((element) =>
            element.countryName!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    emit(SearchResult());
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:sports_app/Data/Cubits/Search/search_cubit.dart';
// import 'package:sports_app/Data/Models/Countries/result.dart';
// import 'package:sports_app/Shared/widgets/search_text_field.dart';

// import '../Data/Cubits/Countries Cubit/countries_cubit.dart';
// import '../Shared/methods/grid_map_body.dart';

// class CountriesScreen extends StatefulWidget {
//   const CountriesScreen({super.key});

//   @override
//   State<CountriesScreen> createState() => _CountriesScreenState();
// }

// class _CountriesScreenState extends State<CountriesScreen> {
//   TextEditingController searchController = TextEditingController();
//   // late List<Result>? filteredItems;
//   // void searchItems(List<Result>? countriesList, String value) {
//   //   filteredItems = countriesList!
//   //       .where((element) =>
//   //           element.countryName!.toLowerCase().contains(value.toLowerCase()))
//   //       .toList();
//   //   setState(() {});
//   // }

//   @override
//   void initState() {
//     if (mounted) {
//       context.read<CountriesCubit>().getAllCountries();
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Countries"),
//         centerTitle: true,
//       ),
//       body: BlocBuilder<CountriesCubit, CountriesState>(
//         builder: (context, state) {
//           if (state is CountriesLoading) {
//             return const Center(
//                 child: CircularProgressIndicator(
//               color: Colors.white,
//             ));
//           } else if (state is CountriesSuccess) {
//             List<Result>? countriesList = state.response.result;

//             return Padding(
//               padding: const EdgeInsets.all(5),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                     child: BlocBuilder<SearchCubit, SearchState>(
//                       builder: (context, state) {
//                         return SearchTextField(
//                           controller: searchController,
//                           query: "country",
//                           onChanged: (String value) {
//                             context
//                                 .read<SearchCubit>()
//                                 .searchItems(countriesList, value);
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Expanded(
//                     child: AnimationLimiter(
//                       child: GridView.count(
//                         padding: const EdgeInsets.all(5),
//                         crossAxisCount: 3,
//                         crossAxisSpacing: 5,
//                         childAspectRatio: 1,
//                         mainAxisSpacing: 5,
//                         children: searchController.text.isEmpty
//                             ? countriesList!.asMap().entries.map((e) {
//                                 return countriesMapBody(e, context);
//                               }).toList()
//                             : context
//                                 .read<SearchCubit>()
//                                 .filteredItems!
//                                 .asMap()
//                                 .entries
//                                 .map((e) {
//                                 return countriesMapBody(e, context);
//                               }).toList(),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             );
//           } else {
//             return Center(
//               child: ElevatedButton(
//                   onPressed: () {
//                     context.read<CountriesCubit>().getAllCountries();
//                   },
//                   child: const Text("Try again")),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
