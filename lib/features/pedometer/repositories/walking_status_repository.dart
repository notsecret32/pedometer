import 'dart:developer';

import 'package:pedometer_app/core/enums/walking_status.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'walking_status_repository.g.dart';

@riverpod
class WalkingStatusRepository extends _$WalkingStatusRepository {
  @override
  WalkingStatus build() => WalkingStatus.pause;

  Future<void> setWalkingStatus(WalkingStatus status) async {
    log('Walking Status was $state');
    state = status;
    log('Walking Status now $state');
  }
}
