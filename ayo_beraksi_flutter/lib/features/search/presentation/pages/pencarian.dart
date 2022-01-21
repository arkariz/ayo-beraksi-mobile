import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/search/presentation/bloc/search_bloc.dart';
import 'package:ayo_beraksi_flutter/features/search/presentation/widgets/header_with_search.dart';
import 'package:ayo_beraksi_flutter/features/search/presentation/widgets/empty_state_search.dart';
import 'package:ayo_beraksi_flutter/features/search/presentation/widgets/last_search.dart';
import 'package:ayo_beraksi_flutter/features/search/presentation/widgets/search_notfound.dart';
import 'package:ayo_beraksi_flutter/features/search/presentation/widgets/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pencarian extends StatefulWidget {
  const Pencarian({Key? key}) : super(key: key);

  @override
  State<Pencarian> createState() => _PencarianState();
}

class _PencarianState extends State<Pencarian> {
  bool isFocused = false;
  String textSearch = '';

  final searchNode = FocusNode();

  @override
  void initState() {
    searchNode.addListener(() {
      if (searchNode.hasFocus) {
        setState(() => isFocused = true);
        BlocProvider.of<SearchBloc>(context).add(TypingSearchEvent());
      } else {
        setState(() => isFocused = false);
      }
    });

    BlocProvider.of<SearchBloc>(context).add(InitSearchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      padding: const EdgeInsets.only(
        left: kDefaultPadding,
        right: kDefaultPadding,
        top: kDefaultPadding * 2,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderwithSearch(
              searchNode: searchNode,
              searchTextField: TextField(
                focusNode: searchNode,
                onChanged: (value) => setState(() => textSearch = value),
                onSubmitted: (value) {
                  BlocProvider.of<SearchBloc>(context).add(DoSearchEvent(value));
                },
                decoration: InputDecoration(
                  hintText: "Cari",
                  hintStyle: const TextStyle(color: Colors.black12),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      BlocProvider.of<SearchBloc>(context).add(DoSearchEvent(textSearch));
                    },
                    child: const Icon(
                      Icons.search_outlined,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                if (state is SearchInit) {
                  return const EmptyStateSearch();
                }
                if (state is Searching) {
                  return const LastSearch();
                }
                if (state is SearchFound) {
                  return Padding(
                    padding: const EdgeInsets.only(top: kDefaultPadding),
                    child: SearchResult(foundLaporan: state.laporanList!.laporanList),
                  );
                }
                if (state is SearchNotFoundState) {
                  return const SearchNotFound();
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
