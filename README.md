Terminal Rainbow Pro 🌈
Terminal Rainbow Pro is a Bash script that adds vibrant, customizable color effects to your terminal output. With multiple themes, color modes, and animation options, it transforms plain text into a visually stunning display. Perfect for scripting, demos, or just adding some flair to your terminal!
Features

Themes: Choose from a variety of color schemes like rainbow, neon, cold, fire, ice, pastel, and matrix.
Color Modes: Apply colors by character (char), word (word), or line (line).
Animations: Add dynamic effects with pulse (fading in/out) or wave (cycling colors).
Bold Text: Emphasize your output with bold formatting.
Output Saving: Save raw input text to a file for later use.
Pipe Support: Works with piped input (e.g., echo "Hello" | ./rainbow.sh).
Customizable Delay: Control animation speed with a delay parameter.

Installation

Download the Script:
curl -O https://raw.githubusercontent.com/your-repo/terminal-rainbow-pro/main/rainbow.sh


Make it Executable:
chmod +x rainbow.sh


Run it:
./rainbow.sh -h



No dependencies are required beyond Bash, making it lightweight and portable.
Usage
./rainbow.sh [options] [text]

Options



Option
Description
Example



-t THEME
Select a color theme: rainbow, neon, cold, fire, ice, pastel, matrix
-t fire


-m MODE
Color mode: char (per character), word (per word), line (per line)
-m word


-p
Enable pulse animation (fades text in/out)
-p


-w
Enable wave animation (cycles colors)
-w


-b
Enable bold text
-b


-o FILE
Save raw input to a file
-o output.txt


-v
Show version
-v


-h
Show help
-h


Examples

Basic Usage:
./rainbow.sh "Hello, World!"

Outputs "Hello, World!" in the default rainbow theme, colored by character.

Piped Input with Pastel Theme:
echo "Pretty text" | ./rainbow.sh -t pastel -m word -b

Colors each word in the pastel theme with bold formatting.

Wave Animation with Fire Theme:
./rainbow.sh -t fire -m char -w "Hot stuff 🔥"

Animates "Hot stuff 🔥" with cycling colors in the fire theme.

Save Output to File:
echo "Save me" | ./rainbow.sh -t neon -o raw.txt

Displays "Save me" in the neon theme and saves the raw input to raw.txt.


Themes



Theme
Description
Colors



rainbow
Classic rainbow effect
Red, Yellow, Green, Cyan, Blue, Magenta


neon
Bright, vibrant hues
Magenta, Cyan, Yellow


cold
Cool tones
Blue, Cyan, White


fire
Warm, fiery colors
Red, Bright Red, Yellow, Bright Yellow


ice
Icy, pale shades
Cyan, Bright Cyan, White


pastel
Soft, muted colors
Light Magenta, Light Cyan, Light Gray, Light Yellow


matrix
Green digital rain vibe
Green, Dark Green


Animations

Pulse: Text fades in and out by toggling between normal and dim text.
Wave: Colors cycle through the selected theme, creating a wave-like effect.

Note: Pulse and wave animations cannot be used together.
Requirements

Bash: The script requires a Bash shell (/bin/bash). It checks for this automatically and will exit if run with a different shell.
Terminal: A terminal that supports ANSI color codes (most modern terminals do).

Limitations

Animations may not display correctly in non-interactive terminals or terminals with limited ANSI support.
The script assumes a UTF-8 compatible terminal for proper character rendering.
Large inputs with animations may cause slight performance delays due to terminal rendering.

Contributing
Contributions are welcome! To contribute:

Fork the repository.
Create a feature branch (git checkout -b feature/new-cool-thing).
Commit your changes (git commit -m "Add new cool thing").
Push to the branch (git push origin feature/new-cool-thing).
Open a pull request.

Please include tests and update this README if you add new features.
License
This project is licensed under the MIT License. See the LICENSE file for details.

Version
Current version: 1.6
Run ./rainbow.sh -v to check the version.

🌟 Make your terminal shine with Terminal Rainbow Pro! 🌟
