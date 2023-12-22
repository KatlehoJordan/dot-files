# MS Office Themes

This folder is a copy of `~/AppData/Roaming/Microsoft/Templates` from my Dell computer used through 2023.

I thought it had MS Office themes for Microsoft word, powerpoint, and excel. The only one that clearly works is for Word.

## MS Word

`Normal.dotm` seems to have the template for Word. After copying this to `~/AppData/Roaming/Microsoft/Templates` opening Word will open a copy of this file which has your colors and fonts.

## MS Powerpoint and Excel

Copying the contents of `~/AppData/Roaming/Microsoft/Templates/Document Themes` will make your colors and fonts available in Powerpoint and Excel. One must actively select the 'DGL' theme in those software to access your theme, but it should be available.

## MS Excel

Excel macros are saved in visual basic (VB) scripts that can be used in all workbooks. To make them accessible in all Excel files, they need to be saved in `PERSONAL.XLSB`. This is usually saved in folder called `XLSTART`, for example in `~/AppData/Romaing/Microsoft/Excel/XLSTART`.

To find the location, though, regardless of the specific location, one can:

- Open up Excel
- Open up a VBA script editor (e.g., with `alt+F11`)
- Open up the 'immediate window' (e.g., with `ctrl+g`)
- Run this code: `? application.StartupPath`

After adding the VBA script/s to the `PERSONAL.XLSB` file, you can create the shortcut links in Excel by modifying the Excel options.

The `Module1.vb` included herein is the plaintext version of the VBA scripts I typically pull into `PERSONAL.XLSB`.

## Theme details

### Colors

- dk1: 000000 (Black)
- lt1: FFFFFF (White)
- dk2: 150E37 (Dark Blue)
- lt2: FCFDBF (Light Yellow)
- accent1: 3B0F70 (Dark Purple)
- accent2: 641A80 (Dark Purple)
- accent3: 8C2381 (Dark Purple)
- accent4: B63679 (Pink)
- accent5: DE4968 (Red)
- accent6: F76F5C (Red)
- hlink: FE9F6D (Light Orange)
- folHlink: FECE91 (Light Orange)

### Fonts

- majorFont: Georgia
- minorFont: Bahnschrift
- not included, but used for monospace: Consolas

## Other changes to make when setting up new computer

- Language packages for Microsoft Office
  - Swedish
  - Catalan
- Auto-complete rules
  - two hyphens to make en-dash
  - three hyphens to make em-dash
