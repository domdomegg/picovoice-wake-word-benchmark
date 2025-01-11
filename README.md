---
license: apache-2.0
language:
- en
task_categories:
- audio-classification
- automatic-speech-recognition
size_categories:
- 1K<n<10K
---

# Picovoice Wake Word Benchmark Dataset

This dataset contains a collection of wake word recordings used for benchmarking wake word detection systems. The dataset has been reformatted from the original [Picovoice Wake Word Benchmark repository](https://github.com/Picovoice/wake-word-benchmark) for easier use with Hugging Face's ecosystem.

## Dataset Description

The dataset contains over 300 recordings of six different wake words from more than 50 distinct speakers. These recordings were originally used to benchmark different wake word detection engines.

### Wake Words Included

- Alexa
- Computer
- Jarvis
- Smart Mirror
- Snowboy
- View Glass

### Data Format

- Audio files standardized to 16kHz, 16-bit, mono WAV format
- Files are organized by wake word category
- Each recording contains a clear utterance of the wake word

## Original Source & Attribution

This dataset was created and published by [Picovoice Inc.](https://picovoice.ai) as part of their wake word detection benchmarking framework. All credit for data collection and curation goes to Picovoice.

The original data was published under the Apache 2.0 License and was used to benchmark various wake word detection engines including Porcupine (by Picovoice), Snowboy, and PocketSphinx.

## License

This dataset is distributed under the same Apache 2.0 License as the original repository.

## Dataset Structure

The dataset is organized into directories by wake word:
```
picovoice-wake-word-benchmark/
├── alexa/
├── computer/
├── jarvis/
├── smart mirror/
├── snowboy/
└── view_glass/
```

Each directory contains WAV recordings of the respective wake word from different speakers.
