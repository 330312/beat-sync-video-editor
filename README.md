# Beat Sync Video Editor

[中文说明](README.zh-CN.md)

A reusable Codex skill for turning a folder of photos and videos plus a music track into a polished beat-synced montage. It builds a human-audited lyric/beat map before editing, assigns media by interval length, aligns deliberate visual climaxes with musical accents, and verifies the encoded result.

## Highlights

- Inventories photos, videos, and audio with FFprobe metadata.
- Separates beat detection from human timing approval.
- Supports lyric notation where `/` starts a new visual segment and `[word]` marks an emphasized interval.
- Matches short accents with readable photos or compact action clips and long intervals with natural-motion footage.
- Retimes deliberate actions such as push-ins and food collisions while keeping waves, selfies, walking, and pans natural.
- Preserves complete horizontal and vertical frames with proportional fit and black padding.
- Supports clean bilingual lyric subtitles, versioned exports, and render QA.
- Keeps source media local; media files are excluded from this repository.

## Installation

Copy this folder into your personal Codex skills directory:

```text
~/.codex/skills/beat-sync-video-editor/
```

Restart or open a new Codex task if the skill is not discovered immediately.

## Requirements

- Codex with local file access
- FFmpeg and FFprobe for media inspection and rendering
- PowerShell for the included inventory helper
- A local editor or CapCut Mate when its API and public media URLs are available

## Usage

Provide a folder containing source media and music, then ask:

```text
Use $beat-sync-video-editor to make a beat-synced montage from this folder.
First produce an auditable beat map, then render the final video after approval.
```

You can also provide a reference video and constraints such as aspect ratio, subtitle style, excluded clips, narrative order, or target duration.

## Workflow

1. Inventory and optionally rename assets while preserving a rename map.
2. Analyze the reference style and select a complete musical phrase.
3. Transcribe lyrics and build a non-uniform beat map.
4. Review exact cue times with an audit video or timing table.
5. Assign photos and videos by interval length and usable motion.
6. Align action climaxes near the end of emphasized words with controlled speed ramps.
7. Render versioned outputs and inspect audio, subtitles, framing, motion, and dense beat groups.

## Repository structure

```text
beat-sync-video-editor/
├── SKILL.md
├── agents/openai.yaml
├── references/
│   ├── beat-map.md
│   └── workflow.md
└── scripts/analyze_media.ps1
```

## Media inventory helper

```powershell
.\scripts\analyze_media.ps1 -Root "D:\path\to\media" -Output ".\media-inventory.json"
```

The script records file type, duration, dimensions, orientation, frame rate, audio presence, and file size. Content meaning and exact visual climax timestamps still require visual review.

## Editing principles

- Do not distribute cuts uniformly from BPM alone.
- Keep motion active throughout the emphasized word.
- Place a deliberate action climax roughly 0.20–0.30 seconds before the interval ends.
- Prefer reordering a longer clip over freezing or heavily slowing a short one.
- Avoid multiple abrupt speed zones in very short, low-frame-count clips.
- End music only after a complete lyrical or musical phrase and use gentle fades.

## Privacy

The repository contains only the reusable skill instructions and helper script. User media, rendered videos, beat-review exports, subtitles, and project-specific inventories are ignored by default.
