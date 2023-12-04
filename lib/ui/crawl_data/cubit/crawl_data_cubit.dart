import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_tv/config/injection.dart';
import 'package:watch_tv/data/network/helper/network_extensions.dart';
import 'package:watch_tv/data/repository/iptv_source_repo.dart';

part 'crawl_data_state.dart';

class CrawlDataCubit extends Cubit<CrawlDataState> {
  CrawlDataCubit() : super(const CrawlDataInitial());

  final IptvSourceRepo _iptvSourceRepo = getIt<IptvSourceRepo>();

  Future<void> getChannelList() async {
    emit(const CrawlDataLoading());
    _iptvSourceRepo.getListChannel().easyCompose(
      (response) {
        emit(const CrawlDataSuccess());
      },
      onError: (error) {
        emit(CrawlDataFailed('$error'));
      },
    );
  }
}
