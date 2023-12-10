import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_tv/base/base_screen.dart';
import 'package:watch_tv/resources/R.dart';
import 'cubit/crawl_data_cubit.dart';

class CrawlDataScreen extends BaseScreen {
  const CrawlDataScreen({super.key});

  @override
  State<CrawlDataScreen> createState() => _CrawlDataScreenState();
}

class _CrawlDataScreenState extends BaseState<CrawlDataScreen, CrawlDataCubit> {
  @override
  onCreateView() {
    cubit = CrawlDataCubit();
  }

  @override
  onViewCreated() {}

  @override
  Widget buildContent(BuildContext context) {
    return BlocConsumer<CrawlDataCubit, CrawlDataState>(
      listener: (context, state) {
        if (state is CrawlDataSuccess) {
          // replaceScreen(ChannelListScreen(channels: cubit.channels));
        }
        if (state is CrawlDataFailed) {
          final snackBar = SnackBar(content: Text(state.message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                  onPressed: () {
                    cubit.getChannelList();
                  },
                  child: Text(R.string.btn_crawl_data),
                ),
                if (state is CrawlDataLoading) const CircularProgressIndicator()
              ],
            ),
          ),
        );
      },
    );
  }
}
