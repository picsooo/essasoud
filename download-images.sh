#!/usr/bin/env bash
# Rapatrie toutes les images hotlinkées depuis esasoud.net dans ./assets/img
# et réécrit index.html pour pointer vers les fichiers locaux.
# Usage : bash download-images.sh
set -e
mkdir -p assets/img
urls=$(grep -ohE 'https://www\.esasoud\.net/[^"]+\.(jpg|png)' index.html produit.html assets/css/style.css | sort -u)
for u in $urls; do
  f="assets/img/$(basename "$u")"
  echo "→ $f"
  curl -sSL "$u" -o "$f"
  # échappe les / pour sed
  esc=$(printf '%s' "$u" | sed 's/[\/&]/\\&/g')
  sed -i.bak "s/$esc/$f/g" index.html produit.html assets/css/style.css
done
rm -f index.html.bak produit.html.bak assets/css/style.css.bak
echo "OK — images locales dans assets/img, index.html et produit.html mis à jour."
