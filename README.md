# CoreSystem

CoreSystem is a general local AI and training loop architecture designed to provide command-line control, local small-model support, external interfaces, a persona-based god-view, media management, and training production capabilities.

## Directory Overview

- `01_bin/`: executable tool directory focused on command-driven system control, CLI utilities, and automation hooks.
- `02_local_ai/`: local small-model AI directory containing models, runtimes, and scripts.
- `03_gateway_ai/`: external AI interface directory for gateway proxies, configuration, and client access.
- `04_persona_godview/`: personal perspective and multi-role shared directory for identity, persona views, and memory sharing.
- `05_media_vault/`: media repository for raw assets, processed results, and shared links.
- `06_ai_training_lab/`: AI training lab directory for data sources, pipelines, datasets, and training jobs.

## Core Goals

- Full control: use `01_bin/` to execute local commands and automate device and workflow operations.
- Local AI: run lightweight on-device models in `02_local_ai/` to preserve privacy and offline capability.
- External interfaces: connect local systems with external LLMs and cloud services through `03_gateway_ai/`.
- Multi-role sharing: manage personas and a personal god-view in `04_persona_godview/` to unify decision-making and knowledge sharing.
- Media management: centralize media assets in `05_media_vault/` for structured processing and sharing.
- Training loop: collect data from each directory through `06_ai_training_lab/` and refine local models continuously.
