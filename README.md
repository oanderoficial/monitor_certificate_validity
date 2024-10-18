# Monitor certificate validity

Monitorar validade de um certificado no Windows.


```ps1
# Configura a política de execução para a sessão atual
Set-ExecutionPolicy RemoteSigned -Scope Process -Force

$certificado = "Cert:\LocalMachine\Root\AD7E1C28B064EF8F6003402014C3D0E3370EB58A"
$logsave = "C:\Zabbix\scripts\cert.log"
 
$comando = Get-Item $certificado
$expirar = $comando.NotAfter
$diasrestantes = ($expirar - (Get-Date)).Days
 
$retorna = $diasrestantes
 
Set-Content -Path $logsave -Value $retorna
```
