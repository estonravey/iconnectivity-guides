# How to Write a Guide

Notes for whoever edits the guides. This file isn't shown on the website.

## Folder layout

Each product has its own folder inside `guides`, with the guide and its images together:

```
guides/
  guides.json
  playaudio2d/
    playaudio2d-user-guide-2026.md
    images/
      00-scene/...
      hp/...
```

## Headings and the contents window

- `#` is the guide title. Use it once, on the first line.
- `##` headings (Introduction, Getting Started, Controls…) are the main entries in the left contents window.
- `###` headings are listed indented beneath them.
- `####` and `#####` headings appear in the guide but not in the contents window.

The contents window is built automatically, so don't add a table of contents, section numbers or `<a name>` anchors to the file. If you edit in VS Code, turn off the "Markdown All in One" automatic table of contents for these files, or it will add them back.

## Adding a new guide

1. Create a folder in `guides`, such as `mioxl`, with the `.md` file and an `images` folder inside it.
2. Add a line for it to `guides.json`:

```json
{ "id": "mioxl", "title": "mioXL", "file": "mioxl/mioxl-user-guide.md", "group": "MIDI Interfaces" }
```

3. Commit the change on GitHub.

The `id` appears in the web address (`/user-guide#mioxl`), so keep it short, lowercase and without spaces. `group` puts guides under a heading in the Guide menu. The order in `guides.json` is the order in the menu and of the Previous / Next buttons.

## PDF download

To offer a downloadable PDF of a guide, add `pdf` to the guide's line in `guides.json`. A "Download PDF" button then appears under the guide's title, and the same PDF is shown under **PDF download** in the contents window while that guide is selected. Guides without `pdf` show neither.

The PDF can be stored in the repository, next to the guide:

```json
{ "id": "playaudio2d", "title": "PlayAUDIO2D", "file": "playaudio2d/playaudio2d-user-guide-2026.md", "group": "Audio Interfaces",
  "pdf": "playaudio2d/playaudio2d-user-guide-2026.pdf", "pdfSize": "6.8 MB" }
```

Or it can be a full web address, such as a PDF uploaded to Squarespace:

```json
  "pdf": "https://www.iconnectivity.com/s/playaudio2d-user-guide.pdf"
```

- `pdfSize` is optional and is shown next to the link.
- A PDF stored in the repository must be under 20 MB. Use a web address for larger files.
- Use a file name without spaces.
- When you replace a PDF stored in the repository, purge it at jsDelivr like any other file, or people may get the old copy for up to 12 hours.

## Images

Reference images relative to the guide file. The text in square brackets is shown as the caption under the picture:

```markdown
![Safe Mode screen](images/05%20safemode/safemode%2001.png)
```

- Write each space in a file or folder name as `%20`, as above. Using names without spaces (`safe-mode-01.png`) avoids this.
- Screenshots of the unit's 256 × 64 display are recognized automatically. They're shown at double size, crisp, on a black panel.
- Large screenshots open at full size when clicked.
- Keep each image under 20 MB (the hosting service won't serve larger files). Images under 1 MB load fastest.

## Notes

Start a paragraph with `> **Note:**` to make a highlighted note:

> **Note:** This is how a note looks.

## Linking

- To a section of the same guide: `[Updating Firmware](#updating-playaudio2d-firmware)`
- To another guide: `[mioXL guide](../mioxl/mioxl-user-guide.md)`

A section's link name is its heading in lowercase, with spaces replaced by hyphens and punctuation removed.

## Hidden comments

Lines like this are kept in the file but never shown on the website. They're useful for reminders:

```markdown
[Comment]: # (NEED LINK to Auracle X manual)
```
