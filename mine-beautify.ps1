$ascii = @"
_______ __                               ___ __
|   |   |__|.-----.-----.----.----.---.-.'  _|  |_
|       |  ||     |  -__|  __|   _|  _  |   _|   _|
|__|_|__|__||__|__|_____|____|__| |___._|__| |____|
 ______                     __   __   ___
|   __ \.-----.---.-.--.--.|  |_|__|.'  _|.--.--.
|   __ <|  -__|  _  |  |  ||   _|  ||   _||  |  |
|______/|_____|___._|_____||____|__||__|  |___  |
                    made by: mohan        |_____|
"@

Write-Host -Foreground Blue $ascii

Write-Host -ForegroundColor Green "[+] Iniciando instalacao..."
# URL do arquivo para download
$url = "https://cdn.modrinth.com/data/LMIZZNxZ/versions/By3oTltx/superDuperVanilla.zip"

# Diretório de Downloads do usuário
$downloadsDirectory = [System.Environment]::GetFolderPath("Desktop")

# Nome do arquivo após o download
$fileName = "superDuperVanilla.zip"

# Caminho completo do arquivo após o download
$filePath = Join-Path -Path $downloadsDirectory -ChildPath $fileName

# Caminho para a pasta .minecraft/shaders
$minecraftShadersDirectory = "$env:APPDATA\.minecraft\shaders"

Write-Host -ForegroundColor Yellow "[!] Verificando se possui a pasta shaders na .minecraft..."
if (-not (Test-Path $minecraftShadersDirectory)) {
    Write-Host -ForegroundColor Red "[-] Pasta shaders nao encontrada."
    Write-Host -ForegroundColor Blue "[*] Criando pasta shaders na .minecraft..."

    New-Item -Path $minecraftShadersDirectory -ItemType Directory -Force
}

Write-Host -ForegroundColor Green "[+] Pasta identificada em $minecraftShadersDirectory"


# Realiza o download do arquivo
Write-Host -ForegroundColor BLue "[*] Realizando download do Shaders do site Modrinth..."
Invoke-WebRequest -Uri $url -OutFile $filePath
Write-Host -ForegroundColor Green "[+] Download realizado com sucesso!"

try {
    # Move o arquivo para a pasta .minecraft/shaders
    Write-Host -ForegroundColor Blue "[*] Movendo arquivo para a pasta..."
    Move-Item -Path $filePath -Destination $minecraftShadersDirectory -ErrorACtion Stop

    Write-Host -ForegroundColor Green "[+] Arquivo baixado e instalado com sucesso! Aperte Enter para encerrar a aplicação"
    Read-Host 

} catch {

    Write-Host -ForegroundColor Red "[-] Um erro ocorreu. Aperte enter para encerrar a aplicacao"
    Read-Host
}
