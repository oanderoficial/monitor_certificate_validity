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

```ps1

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
```

<h2>Comandos úteis: </h2>

 *  Listar certificados pessoais
   ```ps1
Get-ChildItem Cert:\LocalMachine\My
```

*  Listar certificados de raiz
 ```ps1
Get-ChildItem Cert:\LocalMachine\Root
```

*  Listar certificados de autoridades de certificação
 ```ps1
Get-ChildItem Cert:\LocalMachine\CA
```

* Listar todos os certificados da máquina local
```ps1
Get-ChildItem Cert:\LocalMachine
```


