#Nombre servidor
$Server

#Nombre por defecto de la instancia
$SQLInstance

#Poner por defecto MSSQLSERVER si no MSSQL$<nombre_instancia>
$SQLService


#Status de la conexion
   if((test-connection -ComputerName $Server -count 1 -ErrorAction SilentlyContinue))
        {
        #Status de servicio sql
          $service = Get-WmiObject Win32_Service -ComputerName $server |where-object {$_.name -eq "$SQLService" -and $_.State -eq 'Running'}
          #Disponivilidad de la instancia
          if ($Service -ne $NULL)  
                {      
                Write-Host 1              
              }
          else 
            { 
                Write-Host 0
            }

    }               
    else
        {
            Write-Host 0
                        
        }
