
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/data.dart';

part 'spoiler_notifier.g.dart';

@riverpod
Spoiler spoiler(SpoilerRef ref, String input) => Spoiler(input: input);