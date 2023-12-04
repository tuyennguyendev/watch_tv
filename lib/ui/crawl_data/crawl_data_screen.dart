import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_tv/base/base_screen.dart';
import 'package:watch_tv/resources/R.dart';
import 'package:watch_tv/ui/crawl_data/cubit/crawl_data_cubit.dart';
import 'package:watch_tv/utils/widgets/loading_widget.dart';

class CrawlDataScreen extends BaseScreen {
  const CrawlDataScreen({super.key});

  @override
  State<CrawlDataScreen> createState() => _CrawlDataScreenState();
}

class _CrawlDataScreenState extends BaseState<CrawlDataScreen, CrawlDataCubit> {
  @override
  initCubit() {
    cubit = CrawlDataCubit();
  }

  @override
  setup() {}

  @override
  Widget buildContent(BuildContext context) {
    return BlocBuilder<CrawlDataCubit, CrawlDataState>(
      builder: (context, state) {
        return Scaffold(
          body: LoadingWidget(
            showLoading: state is CrawlDataLoading,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  cubit.getChannelList();
                },
                child: Text(R.string.btn_crawl_data),
              ),
            ),
          ),
        );
      },
    );
  }
}
