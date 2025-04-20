
# 🌈 Terminal Rainbow Pro

**Terminal Rainbow Pro** is a pure Bash script that adds vibrant, customizable color effects to your terminal output. Whether you're running a script, creating demos, or just want to bring some flair to your shell, this tool makes your terminal output come alive.

---

## ✨ Features

- 🎨 **Themes:** Choose from vivid color schemes like `rainbow`, `neon`, `cold`, `fire`, `ice`, `pastel`, and `matrix`.
- 🧱 **Color Modes:** Apply colors by character, word, or line.
- 🔁 **Animations:** Add dynamic effects like **pulse** (fades text in/out) or **wave** (color cycling).
- 💪 **Bold Output:** Make your text stand out with bold formatting.
- 💾 **Output Saving:** Save raw input text to a file.
- 📥 **Pipe Support:** Accept input via standard input (`stdin`), perfect for piping.
- ⏱️ **Customizable Delay:** Fine-tune animation speed with a delay parameter.
- ⚡ **No Dependencies:** Lightweight and portable. Requires only Bash and a color-capable terminal.

---

## 📦 Installation

```bash
# Download the script
curl -O https://raw.githubusercontent.com/your-repo/terminal-rainbow-pro/main/rainbow.sh

# Make it executable
chmod +x rainbow.sh

# Run the help command
./rainbow.sh -h
```

---

## 🚀 Usage

```bash
./rainbow.sh [options] [text]
```

You can also pipe input:

```bash
echo "Hello" | ./rainbow.sh -t neon -b
```

---

## 🔧 Options

| Option        | Description                                                               | Example                        |
|---------------|---------------------------------------------------------------------------|--------------------------------|
| `-t THEME`    | Select a color theme: `rainbow`, `neon`, `cold`, `fire`, `ice`, `pastel`, `matrix` | `-t fire`                      |
| `-m MODE`     | Set color mode: `char`, `word`, `line`                                    | `-m word`                      |
| `-p`          | Enable **pulse** animation (fades text in/out)                            | `-p`                           |
| `-w`          | Enable **wave** animation (cycles through theme colors)                   | `-w`                           |
| `-b`          | Enable **bold** text formatting                                            | `-b`                           |
| `-o FILE`     | Save raw input (uncolored) to a file                                       | `-o output.txt`                |
| `-v`          | Show version information                                                   | `-v`                           |
| `-h`          | Show help message                                                          | `-h`                           |

> ⚠️ Note: `-p` (pulse) and `-w` (wave) **cannot be used together**.

---

##  Examples

### 🌈 Basic Output

```bash
./rainbow.sh "Hello, World!"
```

Prints “Hello, World!” using the default `rainbow` theme, colored by character.

### 🎨 Piped Input with Style

```bash
echo "Pretty text" | ./rainbow.sh -t pastel -m word -b
```

Colors each word in pastel theme with bold formatting.

### 🔥 Animated Text

```bash
./rainbow.sh -t fire -m char -w "Hot stuff 🔥"
```

Animates the text in a fiery wave of colors.

### 💾 Save Input to File

```bash
echo "Save me" | ./rainbow.sh -t neon -o raw.txt
```

Displays colored text and saves the raw (uncolored) version to `raw.txt`.

---

## 🎨 Themes

| Theme    | Description             | Colors Used                                      |
|----------|-------------------------|--------------------------------------------------|
| rainbow  | Classic rainbow effect  | Red, Yellow, Green, Cyan, Blue, Magenta          |
| neon     | Bright, punchy hues     | Magenta, Cyan, Yellow                            |
| cold     | Cool, icy tones         | Blue, Cyan, White                                |
| fire     | Warm, hot colors        | Red, Bright Red, Yellow, Bright Yellow           |
| ice      | Pale, frozen shades     | Cyan, Bright Cyan, White                         |
| pastel   | Soft, subtle tones      | Light Magenta, Light Cyan, Light Yellow, Gray    |
| matrix   | Hacker-style green rain | Green, Dark Green (faint)                        |

---

## 🎞️ Animations

- **Pulse:** Text fades in and out using brightness/dim effects.
- **Wave:** Theme colors cycle across characters, creating a wave-like motion.

> ⚠️ Pulse and wave are **mutually exclusive**.

---

## 💻 Requirements

- **Bash:** Must be executed using `/bin/bash`.
- **Terminal Support:** Compatible with most modern terminals supporting ANSI colors.
- **UTF-8 Encoding:** Recommended for proper rendering of special characters.

---

## ⚠️ Limitations

- Animations may not display correctly in non-interactive or limited terminals.
- Large inputs with animations may cause minor performance lags.
- Wave/pulse effects rely on ANSI escape sequences and terminal behavior.

---

## 🤝 Contributing

Contributions are welcome! 🚀

1. Fork the repo.
2. Create a feature branch:  
   `git checkout -b feature/amazing-idea`
3. Make your changes and commit:  
   `git commit -m "Add amazing idea"`
4. Push to your branch:  
   `git push origin feature/amazing-idea`
5. Open a pull request! 🎉

> Please include tests and update this README when you add features.

---

## 📜 License

**MIT License** – See [LICENSE](LICENSE) for full terms.

---

## 🧭 Version

Current version: **1.6**

Check your version:

```bash
./rainbow.sh -v
```

---

> 🌟 Make your terminal shine with **Terminal Rainbow Pro** – because even your scripts deserve style! 🌟

---
