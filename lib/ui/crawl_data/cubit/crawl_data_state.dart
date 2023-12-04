part of 'crawl_data_cubit.dart';

sealed class CrawlDataState extends Equatable {
  const CrawlDataState();

  @override
  List<Object> get props => [];
}

final class CrawlDataInitial extends CrawlDataState {
  const CrawlDataInitial();
}

final class CrawlDataLoading extends CrawlDataState {
  const CrawlDataLoading();
}

final class CrawlDataSuccess extends CrawlDataState {
  const CrawlDataSuccess();
}

final class CrawlDataFailed extends CrawlDataState {
  final String message;
  const CrawlDataFailed(this.message);

  @override
  List<Object> get props => [message];
}
