# ESASOUD — maquette page d'accueil

Proposition de refonte de la page d'accueil de [esasoud.net](https://www.esasoud.net) réalisée par Webminds Digital Solutions.
Site statique, aucune dépendance à installer :

- `index.html` — page d'accueil
- `assets/css/style.css` — feuille de style commune
- `produit.html` — exemple de fiche produit (Caddy Arc 151i / 201i) : sélecteur de modèle, tableau technique complet, PDF, demande de devis
- `download-images.sh` — rapatrie les photos du site actuel en local

## Déploiement

0. **D'abord** rapatrier les images en local (obligatoire, voir ci-dessous) : `bash download-images.sh`
1. Pousser ce dossier sur un dépôt GitHub.
2. Sur [vercel.com](https://vercel.com) → *Add New Project* → importer le dépôt.
3. Framework preset : **Other**. Build command et output directory : laisser vide.
4. Deploy. L'URL de prévisualisation est prête en ~30 secondes.

## Images

Les fichiers HTML pointent vers les photos d'esasoud.net (hero, catégories, produit, galerie, logos partenaires).
Deux choses peuvent les empêcher de s'afficher : l'aperçu intégré de certaines apps bloque les images externes,
et un serveur Joomla peut refuser le hotlink. D'où le script, à lancer une fois depuis le dossier du projet :

```bash
bash download-images.sh
```

Il télécharge toutes les images dans `assets/img/` et réécrit les chemins dans `index.html`, `produit.html` et `assets/css/style.css`.
Après ça, le site est 100 % autonome.

## À valider avec le client

- **E-mail de contact** : `contact@esasoud.net` est un placeholder (le site actuel affiche encore l'e-mail du template, support@torbara.com).
- **Descriptions des 4 gammes** : rédigées d'après l'offre ESAB standard, à ajuster selon le catalogue réel.
- **Chiffres** : 5 agences, 7 marques (ESAB + 6 partenaires affichés sur le site), 4 gammes — issus du site actuel.
- **Formulaire de contact et newsletter** : affichage uniquement, pas d'envoi (à brancher sur Brevo / e-mail lors du projet).
- **Fiche technique PDF** du Caddy Arc : lien vers le PDF hébergé sur le site actuel.

## Ce qui a été corrigé par rapport au site actuel

- Textes de démonstration restés en ligne (lorem ipsum, « Douglas Payne / Volleyball ») supprimés.
- Catalogue vide (1 seul produit publié sur 4 catégories) remplacé par une présentation des gammes + produit vedette avec caractéristiques réelles.
- Responsive mobile, menu, appels directs (`tel:`), itinéraires Google Maps pour chaque agence.
- Performance : pas de Joomla, pas de jQuery, une seule requête HTML.
