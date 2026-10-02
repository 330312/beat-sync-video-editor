# Beat-map format

Keep the beat map in CSV, JSON, Markdown, or another editable text format. Use one shared timeline zero point for the audio, audit video, subtitles, and edit timeline.

## Canonical fields

| Field | Meaning |
| --- | --- |
| `segment` | Stable segment identifier |
| `start` / `end` | Visual segment boundaries in seconds |
| `phrase` | Exact lyric or musical phrase |
| `beat_time` | Audible accent or emphasized interval start |
| `beat_role` | downbeat, syllable, vocal accent, fill, or phrase ending |
| `asset` | Stable photo/video identifier |
| `source_start` | Source in-point for video |
| `source_climax` | Source time of contact, maximum push-in, or other climax |
| `source_end` | Source out-point |
| `speed_plan` | Natural, constant speed, or explicit ramp description |
| `notes` | Approval state and user feedback |

## Example

| segment | start | end | phrase | beat_time | asset | speed_plan | notes |
| --- | ---: | ---: | --- | ---: | --- | --- | --- |
| 11 | 14.43 | 14.79 | in the `[on]` | 14.43 | V03_food_collision | continuous action | first dense accent |
| 12 | 14.79 | 15.18 | `[yx]` | 14.79 | V03_food_collision | continuous action | slightly wider spacing |
| 13 | 15.18 | 15.83 | `[night]` | 15.18 | V03_food_collision | moving tail | hold the result legibly |

## Invariants

- Segments are ordered and do not overlap unless an intentional overlay is documented.
- Their total duration matches the selected music excerpt.
- Every video climax lies within its assigned emphasized interval.
- Dense groups remain readable at normal playback speed.
- Reordering media does not alter approved beat times.
- All timing revisions retain the previous value in a change log.

Example revision log:

| cue | old | new | reason |
| --- | ---: | ---: | --- |
| dancing | 9.155 | 9.395 | original marker was early |
| make | 22.840 | 22.720 | moved 0.12 s earlier after review |
