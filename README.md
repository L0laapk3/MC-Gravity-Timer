# Gravity Timer Datapack

A custom datapack for Minecraft 1.21.1 using the [Gravity Changer (Banana Fork)](https://modrinth.com/mod/gravitychanger-(banana-fork)) mod.

This pack forces everyone's gravity to change direction at regular intervals. The time between changes starts at 5 minutes, but decreases every time a player dies, checking your ability to adapt as the chaos accelerates.

Inspired by [Bubbo's YouTube Video](https://www.youtube.com/watch?v=hB-07m0xpeg). Everything was vibecoded.

## Features
- **Timer:** Randomizes every player's gravity direction when the timer reaches the limit (default: 300s).
- **Death Penalty:** Every death permanently shortens the timer limit by 30s.
- **Loss Condition:** If the limit drops to 0, the game ends.
- **In-Game Config:** Adjust time and penalties easily via the chat menu.

## Installation
1. Ensure the **Gravity Changer (Banana Fork)** mod is installed.
2. Place this folder in your world's `datapacks` directory.
3. Run `/reload` in-game.

## Usage
Upon reloading, a menu will appear in the chat.
- **Start:** `/function gravity_timer:start`
- **Stop:** `/function gravity_timer:stop`
- **Configure:** Click the `[Time]` or `[Death Penalty]` buttons in the reload menu.