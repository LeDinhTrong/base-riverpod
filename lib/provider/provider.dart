import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_demo/data/repositories/item_model_repository.dart';
import '../data/model/item_model.dart';
part 'provider.freezed.dart';

@freezed
class ItemState with _$ItemState {
  const ItemState._();
  const factory ItemState.initial() = _Initial;
  const factory ItemState.loaded(List<ItemModel>? itemModel) = _Loaded;
  const factory ItemState.faulure(String failure) = _Failure;
}

class ItemNotifier extends StateNotifier<ItemState> {
  final ItemRepository _itemRepository;

  ItemNotifier(this._itemRepository) : super(const ItemState.initial()) {
    loadItem();
  }

  Future<void> loadItem() async {
    Either<String, List<ItemModel>?> failureOrSuccess = await _itemRepository.getItemByTypeId();

    if (!mounted) return;
    state = failureOrSuccess.fold((l) => ItemState.faulure(l), (r) => ItemState.loaded(r));
  }
}

final itemRepoProvider = Provider<ItemRepository>((ref) => ItemRepository());

final itemfiHistoryProvider =
    StateNotifierProvider<ItemNotifier, ItemState>((ref) => ItemNotifier(ref.watch(itemRepoProvider)));
