# Production workflow

## 1. Intake and inventory

Before touching the timeline, list every photo, video, audio file, subtitle file, and reference. For each visual asset record:

- content and narrative role;
- type, orientation, resolution, frame rate, container, and usable duration;
- whether motion is natural or a deliberate action;
- exact source timestamp of an action climax, such as food making contact or a push-in reaching its destination;
- speech, shake, dead time, duplication, or other unusable material.

Use stable descriptive names such as `P03_beach_sunset.jpg` and `V07_food_cheers.mp4`. Preserve a rename map so later timeline data remains traceable. Exclude talking clips when requested rather than merely muting them.

## 2. Read the reference

Measure, do not merely imitate by memory. Extract or note:

- music excerpt and its phrase boundaries;
- lyric language, line breaks, font, size, placement, outline, and shadow;
- shot-duration distribution and where photos versus videos appear;
- aspect-ratio handling, transitions, grading, and sound treatment;
- opening, buildup, climax, release, and ending.

Use these observations as constraints while improving continuity and technical finish.

## 3. Build the musical map

Transcribe the exact sung line before timing it. A wrong lyric creates the wrong accent map. Mark one visual segment with `/` and musical emphasis with brackets:

`You were [dancing] through the [light] / [ning] / [strike]`

The slash matters even when two segments are close. Brackets describe an emphasized interval, not necessarily an instantaneous drum hit. Locate candidates with waveform/onset tools, then confirm by listening repeatedly at normal and reduced speed.

Export an audit video before editing media. It should contain the chosen audio, visible segment labels, exact times, and a short flash, border, or marker at each accent. When the user says a beat is early, move it later; when late, move it earlier. Keep an explicit revision log and never silently shift approved beats.

## 4. Allocate media by interval

Use these as starting points, not rigid laws:

| Interval | Good default |
| --- | --- |
| under 0.55 s | one photo only if readable, or a tightly trimmed collision/action fragment |
| 0.55–0.90 s | photo, short action, or compact detail shot |
| 0.90–1.50 s | readable photo or short natural video |
| over 1.50 s | longer natural-motion video or an action with enough lead and tail |

Do not flash every photo for 0.3–0.5 seconds. Photos often need a somewhat longer musical gap to register. Match the longest source clips to the longest intervals before considering slow motion. Preserve an already-approved opening and ending while repairing only the problematic middle.

## 5. Time deliberate actions

For a push-in, collision, toast, door opening, jump, or similar action:

1. Identify source action start, climax, and useful tail frame.
2. Map the action across the whole emphasized word.
3. Use gentle motion before the word, about 2×–4× across the meaningful action, and a slower moving tail afterward.
4. Land the climax about 0.20–0.30 seconds before the word or segment ends, leaving time for the result to register.
5. Preserve continuous motion; do not insert long before/after freezes.

For a dense sequence such as `[on] / [yx] / [night]`, a compact collision clip can span the group if the visible movement remains legible. Trim a slightly longer source range and use one continuous speed where possible. Multiple abrupt speed changes in a few frames usually look like playback stutter.

Natural clips—waves, selfies, walking, vehicle views, ambient pans—normally stay at 1×. Reorder them into longer intervals instead of stretching them unnaturally.

## 6. Visual and audio treatment

- Preserve full horizontal and vertical frames with proportional fit and black padding.
- Group aspect-ratio changes into visual phrases.
- Apply restrained, consistent exposure, white balance, contrast, and saturation. Match adjacent shots rather than imposing one aggressive preset.
- Prefer hard cuts on dense beats; use motivated dissolves or motion transitions only when the phrase allows breathing room.
- Use lyric subtitles only when that is the requested style: white text, no outline, reference-matched size and placement.
- Fade music in and out gently, and end only after a complete sung or musical phrase. A wave clip can support the initial fade before the main peak.

## 7. Render and quality control

Inspect the actual encoded video, not only the timeline:

- duration and final lyric completeness;
- resolution, frame rate, black padding, and unexpected cropping;
- audio peaks, fade shape, and abrupt truncation;
- subtitle accuracy, timing, size, safe margins, and lack of unauthorized text;
- at least one frame from every segment and several frames around each speed ramp;
- dense beat groups at normal speed and half speed;
- collision/push-in climax against the full emphasized word;
- absence of duplicated, frozen, or stuttering frames caused by retiming.

Save each review export under a new version. The change note should say exactly what moved, such as “collision source range extended 0.18 s” or “sunshine clip replaced with a longer natural shot.”
