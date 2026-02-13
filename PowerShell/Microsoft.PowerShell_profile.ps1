# Définir l'alias 'code' pour lancer VSCodium
Set-Alias -Name code -Value "C:\Users\svogrig\AppData\Local\Programs\VSCodium\VSCodium.exe"

# Fonction pour interroger Git sur la branche actuelle
function Get-GitBranch {
    $branch = $(git rev-parse --abbrev-ref HEAD 2>$null)

    if ($LASTEXITCODE -eq 0 -and $branch) {
        if ($branch -eq "HEAD") {
            $sha = $(git rev-parse --short HEAD 2>$null)
            return "(Détaché: $sha)"
        }
        return "($branch)"
    }
    return ""
}

# Fonction spéciale pour personnaliser l'invite de commande
function prompt {
    $currentTime = Get-Date -Format 'HH:mm'
    $currentPath = (Get-Location).ProviderPath
    $gitInfo = Get-GitBranch

    Write-Host -NoNewline -ForegroundColor Yellow "$currentTime "
    Write-Host -NoNewline -ForegroundColor Magenta "$currentPath "

    if ($gitInfo) {
        Write-Host -NoNewline -ForegroundColor Cyan "$gitInfo"
    }

    Write-Host -NoNewline -ForegroundColor Gray "> "

    return " "
}

$Host.UI.RawUI.CursorSize = 1
