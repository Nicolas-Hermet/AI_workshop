# Atelier — donner accès à l'appli aux participants

Runbook pour exposer le serveur Rails aux collègues le jour de l'atelier.

## Principe

Les machines des participants (gérées par Airbus) bloquent les services de tunnel
(ngrok, Cloudflare Tunnel, Tailscale…) → **403 Forbidden**. Inutile de réessayer
un tunnel : c'est filtré par catégorie.

➡️ La solution : **tout le monde sur le même wifi**, accès direct en réseau local.

## Procédure (5 minutes)

### 1. Même wifi pour tout le monde

Ta machine **et** celles des participants sur le **même réseau wifi** (ex. wifi LTRC).

### 2. Lancer Rails en écoute sur tout le réseau

```sh
bin/rails server -b 0.0.0.0 -p 3000
```

Le `-b 0.0.0.0` est indispensable : sans lui, Puma n'écoute que sur `localhost`
et personne d'autre ne peut se connecter.

### 3. Récupérer l'IP locale de ta machine

```sh
ipconfig getifaddr en0
```

Renvoie une IP du type `10.x.x.x` ou `192.168.x.x`. C'est l'adresse à partager.

### 4. Autoriser le pare-feu macOS

Au démarrage du serveur, macOS demande
*« Voulez-vous que "ruby" accepte les connexions entrantes ? »* → **Autoriser**.

Pas de popup et ça ne marche pas ? Désactiver le pare-feu le temps de l'atelier :
*Réglages Système → Réseau → Pare-feu*.

### 5. Les participants ouvrent l'appli

Dans leur navigateur :

```
http://TON-IP:3000
```

⚠️ Bien `http://` (pas `https`) et avec `:3000`.

## Si ça ne marche pas

**Test isolation wifi** — depuis la machine d'un participant :

```sh
ping TON-IP
```

- ✅ Ça répond → le réseau est bon, le problème est ailleurs (pare-feu, `-b 0.0.0.0` oublié).
- ❌ Pas de réponse → le wifi isole les appareils entre eux (*AP/client isolation*).
  **Plan B :** créer un partage de connexion depuis ton téléphone ; ta machine Rails
  **et** les participants s'y connectent. Vous êtes alors sur ton réseau, sans filtrage
  ni isolation.

## Notes

- En développement, Rails autorise déjà les accès **par IP** : pas besoin de toucher
  à `config.hosts` (le blocage « Blocked hosts » ne vise que les noms de domaine).
- Accès en `http` simple, sans TLS — normal pour du dev local.
