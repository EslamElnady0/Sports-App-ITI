import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sports_app/Data/Models/Data%20Models/Countries/countries.dart';
import 'package:sports_app/Data/Repositries/countries_repo.dart';

import '../../Models/Data Models/Countries/result.dart';

part 'countries_state.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit() : super(CountriesInitial());

  void getAllCountries() {
    emit(CountriesLoading());
    CountriesRepo().getCountries().then((value) {
      if (value != null) {
        emit(CountriesSuccess(response: value));
      } else {
        emit(CountriesFailure());
        debugPrint("request failed");
      }
    });
  }

  late List<Result>? filteredItems;

  void searchItems(List<Result>? list, String value) {
    filteredItems = list!
        .where((element) =>
            element.countryName!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    emit(CountriesResult());
  }
}












// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:sports_app/Data/Models/Countries/result.dart';
// import 'package:sports_app/Screens/leagues_screen.dart';
// import 'package:sports_app/Shared/widgets/search_text_field.dart';
// import 'package:sports_app/Shared/widgets/grid_container.dart';

// import '../Data/Cubits/Countries Cubit/countries_cubit.dart';
// import '../Shared/methods/grid_map_body.dart';

// class CountriesScreen extends StatefulWidget {
//   const CountriesScreen({super.key});

//   @override
//   State<CountriesScreen> createState() => _CountriesScreenState();
// }

// class _CountriesScreenState extends State<CountriesScreen> {
//   TextEditingController searchController = TextEditingController();
//   List<Result>? list = [];
//   // late List<Result>? filteredList;
//   // void searchItems(List<Result>? countriesList, String value) {
//   //   filteredList = countriesList!
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
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

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
//             list = countriesList;
//             return Padding(
//               padding: const EdgeInsets.all(5),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                     child: SearchTextField(
//                       controller: searchController,
//                       query: "country",
//                       onChanged: (String value) {
//                         // searchItems(countriesList, value);
//                         context
//                             .read<CountriesCubit>()
//                             .searchItems(countriesList, value);
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Expanded(
//                     child: AnimationLimiter(
//                       child: GridView.count(
//                           padding: const EdgeInsets.all(5),
//                           crossAxisCount: 3,
//                           crossAxisSpacing: 5,
//                           childAspectRatio: 1,
//                           mainAxisSpacing: 5,
//                           children: countriesList!.asMap().entries.map((e) {
//                             int index = e.key;
//                             var value = e.value;
//                             return gridMapBody(
//                                 index,
//                                 context,
//                                 GridContainer(
//                                     name: value.countryName!,
//                                     logo: value.countryLogo!,
//                                     nextScreen: LeaguesScreen(
//                                         countryId: value.countryKey.toString(),
//                                         countryName: value.countryName!,
//                                         countryLogo: value.countryLogo!),
//                                     imageHeight: height * 0.07,
//                                     imageWidth: width * 0.4));
//                           }).toList()),
//                     ),
//                   )
//                 ],
//               ),
//             );
//           } else if (state is CountriesResult) {
//             return Padding(
//               padding: const EdgeInsets.all(5),
//               child: Column(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                     child: SearchTextField(
//                       controller: searchController,
//                       query: "country",
//                       onChanged: (String value) {
//                         // searchItems(countriesList, value);
//                       },
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Expanded(
//                       child: AnimationLimiter(
//                     child: GridView.count(
//                       padding: const EdgeInsets.all(5),
//                       crossAxisCount: 3,
//                       crossAxisSpacing: 5,
//                       childAspectRatio: 1,
//                       mainAxisSpacing: 5,
//                       children: context
//                           .read<CountriesCubit>()
//                           .filteredItems!
//                           .asMap()
//                           .entries
//                           .map((e) {
//                         int index = e.key;
//                         var value = e.value;
//                         return gridMapBody(
//                             index,
//                             context,
//                             GridContainer(
//                                 name: value.countryName!,
//                                 logo: value.countryLogo!,
//                                 nextScreen: LeaguesScreen(
//                                     countryId: value.countryKey.toString(),
//                                     countryName: value.countryName!,
//                                     countryLogo: value.countryLogo!),
//                                 imageHeight: height * 0.07,
//                                 imageWidth: width * 0.4));
//                       }).toList(),
//                     ),
//                   ))
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

