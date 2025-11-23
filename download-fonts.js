// Script to download Noto Sans SC fonts for OG image generation
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const FONTS_DIR = path.join(__dirname, "public", "fonts");
// Using Google Fonts direct download links
const FONTS = [
  {
    name: "NotoSansSC-Regular.ttf",
    // This will be fetched from Google Fonts API
    weight: 400,
  },
  {
    name: "NotoSansSC-Bold.ttf",
    weight: 700,
  },
];

async function getFontUrl(weight) {
  const cssResp = await fetch(
    `https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@${weight}&display=swap`,
  );
  if (!cssResp.ok) {
    throw new Error("Failed to fetch Google Fonts CSS");
  }
  const cssText = await cssResp.text();
  const urlMatch = cssText.match(/url\((https:[^)]+\.(?:woff2|ttf))\)/);
  if (!urlMatch) {
    throw new Error("Could not find font URL in CSS");
  }
  return urlMatch[1];
}

async function downloadFont(weight, dest) {
  console.log(`Downloading ${path.basename(dest)}...`);
  const url = await getFontUrl(weight);
  const response = await fetch(url);
  if (!response.ok) {
    throw new Error(`Failed to download: ${response.statusText}`);
  }
  const buffer = Buffer.from(await response.arrayBuffer());
  fs.writeFileSync(dest, buffer);
  console.log(`✓ Downloaded ${path.basename(dest)}`);
}

async function main() {
  // Create fonts directory if it doesn't exist
  if (!fs.existsSync(FONTS_DIR)) {
    fs.mkdirSync(FONTS_DIR, { recursive: true });
    console.log(`Created directory: ${FONTS_DIR}`);
  }

  // Download fonts
  for (const font of FONTS) {
    const destPath = path.join(FONTS_DIR, font.name);
    if (fs.existsSync(destPath)) {
      console.log(`✓ ${font.name} already exists, skipping...`);
      continue;
    }
    try {
      await downloadFont(font.weight, destPath);
    }
    catch (error) {
      console.error(`✗ Failed to download ${font.name}:`, error.message);
    }
  }

  console.log("\n✓ Font setup complete!");
}

main().catch(console.error);
