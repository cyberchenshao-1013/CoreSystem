# 06_ai_training_lab

`06_ai_training_lab/` is the local production directory that builds a training data loop, covering everything from raw input to local model training.

## Structure

- `01_sources/`: temporary storage for raw input data such as conversations, logs, documents, or collected content.
- `02_pipelines/`: automation scripts for cleaning, slicing, transforming formats, and generating training sets.
- `03_datasets/`: generated training dataset files in formats such as JSONL and ShareGPT.
- `04_training_jobs/`: local fine-tuning scripts and experiment configurations.

## Goal

Create a reproducible data loop so local AI systems can iterate and improve continuously using daily interactions and multi-source inputs.
