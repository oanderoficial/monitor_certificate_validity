$certificado = "Cert:\CurrentUser\My\AD7E1C28B064EF8F6003402014C3D0E3370EB58A"
$logsave = "C:\Apps\Cert\log.txt"


$comando = Get-Item $certificado
$expirar =$comando.NotAfter
$diasrestantes = ($expirar - (Get-Date)).Days

if ($diasrestantes -le 30) {
    $retorna = 1 
} else{
    $retorna = 0
}

Set-Content -Path $logsave -Value $retorna
