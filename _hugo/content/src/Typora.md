# Typora

- [Install Typora on Linux](http://support.typora.io/Typora-on-Linux/)

- [Tutorials: Typora Styles](http://support.typora.io/style/)

- [How to Install Typora – A Minimal Markdown Editor in Ubuntu](http://ubuntuhandbook.org/index.php/2016/09/install-typora-minimal-markdown-editor/):

Typora features:
===============

- Github Flavored Markdown and extra functions including code, fences, tables, lists, footnotes, math blocks, etc.
- The real live preview.
- Shortcut keys
- Native features on mac, such as auto-save, version control, spell check, etc.
- Custom themes controlled by css files.
- Export as PDF or HTML.
- And much more.

Install Typora
==============

## Ubuntu

1. Add repository:
  `sudo add-apt-repository 'deb https://typora.io linux/'`
2. Setup the key:
  `sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BA300B7755AFCFAE`
3. Finally update and install this simple markdown editor:
```
sudo apt update
sudo apt install typora
```

## Fedora

- [Please provide an AppImage for Linux](https://github.com/typora/typora-issues/issues/583)

1. [Download AppImage](https://bintray.com/probono/AppImages/Typora/0.9.29.glibc2.11#files)

2. [How to run an AppImage?](http://appimage.org/):
- Make it executable
  `chmod a+x Subsurface*.AppImage`
- and run
  `./Subsurface*.AppImage`


3. [Use Typora from Shell](http://support.typora.io/Use-Typora-From-Shell-or-cmd/)

After install typora on Linux, user could run typora directly in terminal, for example:

`typora ~/Document/test.md`

Or run it from icon.
