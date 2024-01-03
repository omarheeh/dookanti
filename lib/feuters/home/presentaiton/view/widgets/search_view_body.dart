import 'package:dookanti/core/cubits/page_controller/page_controler_cubit.dart';
import 'package:dookanti/core/widgets/k_spaser.dart';
import 'package:dookanti/feuters/home/data/models/product_model.dart';
import 'package:dookanti/feuters/home/presentaiton/view/home_view.dart';
import 'package:dookanti/feuters/home/presentaiton/view_model/search_cubit/search_cubit.dart';
import 'package:dookanti/feuters/products/presintation/view/widgets/show_model_button_widget.dart';
import 'package:dookanti/feuters/products/presintation/view/widgets/tab_view_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const VSpaser(2),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                BlocProvider.of<PageControlerCubit>(context)
                    .ChangePage(route: HomeView.id);
              },
              icon: const Icon(
                IconlyLight.arrowLeft2,
                size: 30,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SearchTextField(
            onSubmitted: (value) {
              BlocProvider.of<SearchCubit>(context).search(text: value);
            },
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchSucsess) {
                    return ListView.separated(
                      itemCount: state.products.length,
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            _showModalBottomShetFunction(
                                context, state.products[index]);
                          },
                          child: TabViewListViewItem(
                            productModel: state.products[index],
                          ),
                        );
                      },
                    );
                  } else if (state is SearchFailure) {
                    return Center(
                      child: Text(state.errMessage),
                    );
                  } else if (state is SearchLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> _showModalBottomShetFunction(
      BuildContext context, ProductModel productModel) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      builder: (context) {
        return Builder(builder: (context) {
          return ShowModelButtonWidget(
            productModel: productModel,
          );
        });
      },
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.onSubmitted,
  });
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                color: Colors.grey.shade400,
              ),
            ]),
        child: TextField(
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Icon(
                IconlyLight.search,
                color: Colors.black87,
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.close,
                  color: Colors.black87,
                ),
              )),
        ),
      ),
    );
  }
}
