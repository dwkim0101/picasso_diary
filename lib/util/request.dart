import 'package:openai_dalle_wrapper/openai_dalle_wrapper.dart';

const apiKey = "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";
final openAi = OpenaiDalleWrapper(apiKey: apiKey);
const apiUrl = 'https://api.openai.com/v1/completions';
int currentPageIndex = 0;
