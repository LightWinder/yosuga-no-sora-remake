# Asset layout

All asset paths and filenames must use ASCII. New descriptive names use
lowercase snake_case; legacy engine IDs such as `B27A`, `FRM_0501`, and
`AK020335` keep their existing case because scenarios generate many of them
dynamically.

## Runtime directories

- `audio_ogg/`: BGM, sound effects, ambience, and voices. Keep each `.sli`
  loop sidecar next to its matching `.ogg`.
- `bg_1920/`: full-screen and scrolling backgrounds (`B*`).
- `event_1920/`: event CGs (`E*`).
- `character_1920/`: composed character images (`C*`).
- `ui_1920/`: runtime UI grouped by screen or feature.
  - `main_menu/`, `adv_menu/`, `save_load/`, `save_load_hd/`
  - `settings/graphic/`, `settings/system/`, `settings/voices/portraits/`
  - `appreciation/`, `confirm/`, `name/`
- `rule/`: transition masks.
- `frame/` and `frame_m2/`: legacy frame assets.
- `thumb/`: gallery and recollection thumbnails.
- `font/`: prerendered font caches.

## Maintenance rules

1. Runtime code references the canonical directories above; do not keep
   design-export or language-named duplicate folders beside them.
2. A basename must be unique inside an auto-path group unless the caller uses
   an explicit relative path.
3. Before deleting numbered voices, characters, thumbnails, frames, rules, or
   `.sli` files, check their generator tables and filename patterns as well as
   literal script references.
4. Put source artwork and mockups outside `content-data/`; this directory is
   for runtime-ready assets only.
