# ⚙️ Configuration VSCodium

Ce dossier contient les fichiers de synchronisation pour **VSCodium**. L'utilisation de liens symboliques permet de lier ces fichiers directement aux emplacements système sans avoir à les copier manuellement après chaque modification.

---

## 📂 Chemins cibles par OS

Les fichiers de configurations de VSCodium se trouvent habituellement dans les dossiers suivants :

| Système | Chemin du dossier User |
| :--- | :--- |
| Windows | %APPDATA%\VSCodium\User\ |
| Linux / WSL2 | ~/.config/VSCodium/User/ |
| macOS | ~/Library/Application Support/VSCodium/User/ |

---

## 🛠️ Mise en place des liens symboliques

### 🐧 Sur Linux / WSL2

#### 1. Aller dans le dossier de config de VSCodium
``` bash
cd ~/.config/VSCodium/User/
```

#### 2. Sauvegarder l'existant si nécessaire
``` bash
mv settings.json settings.json.bak
mv keybindings.json keybindings.json.bak
```

#### 3. Créer le lien symbolique
Remplacer <REPO_PATH> par le chemin réel.
``` bash
ln -s /<REPO_PATH>/vscodium/settings.json settings.json
ln -s /<REPO_PATH>/vscodium/keybindings.json keybindings.json
ln -s /<REPO_PATH>/vscodium/snippets/ snippets
```

### 🪟 Sur Windows (PowerShell)
Lancer PowerShell en Administrateur :

#### 1. Se déplacer dans le dossier User de VSCodium
``` powershell
cd "$env:APPDATA\VSCodium\User"
```

#### 2. Renommer l'ancien fichier
``` powershell
Rename-Item -Path "settings.json" -NewName "settings.json.bak"
```

#### 3. Créer le lien
Remplacer <REPO_PATH> par le chemin réel.
``` powershell
New-Item -Path "settings.json" -ItemType SymbolicLink -Value "C:\<REPO_PATH>\vscodium\settings.json"
New-Item -Path "keybindings.json" -ItemType SymbolicLink -Value "C:\<REPO_PATH>\vscodium\keybindings.json"
New-Item -ItemType SymbolicLink -Path "snippets" -Value "C:\<REPO_PATH>\vscodium\snippets"
```

---

## 📝 Contenu du dossier
* settings.json : Préférences globales, thème et configuration des extensions.
* keybindings.json : Raccourcis clavier personnalisés.
* snippets/ : Dossier contenant vos extraits de code par langage.
