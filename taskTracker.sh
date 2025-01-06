#!/bin/bash

# Solicita o nome da tarefa
read -p "Digite o nome da tarefa: " nome_tarefa

# Cria o nome do arquivo
nome_arquivo="$nome_tarefa.txt"

# Registra informações iniciais
data_inicio=$(date)
uptime=$(uptime)
echo "Início: $data_inicio" >> "$nome_arquivo"
echo "Uptime: $uptime" >> "$nome_arquivo"
echo "---" >> "$nome_arquivo"

# Inicializa variáveis de tempo
tempo_inicio=$(date +%s)
tempo_pausado=0
tempo_total=0
tempos_parciais=()

# Função para formatar o tempo em HH:MM:SS
formata_tempo() {
  segundos=$1
  horas=$((segundos / 3600))
  minutos=$(( (segundos % 3600) / 60 ))
  segundos=$((segundos % 60))
  printf "%02d:%02d:%02d" "$horas" "$minutos" "$segundos"
}


# Loop principal
while true; do
  read -n 1 -s -p "" tecla # Lê um caractere sem exibir e sem Enter

  if [[ "$tecla" == "p" ]]; then
    if [[ "$tempo_pausado" == 0 ]]; then # Pausa
      tempo_pausa=$(date +%s)
      echo "Pausado em: $(date)" >> "$nome_arquivo"
       echo "---" >> "$nome_arquivo"

      tempo_pausado=1
    else # Continua
      tempo_continua=$(date +%s)
      tempo_total=$((tempo_total + tempo_continua - tempo_pausa))
      tempos_parciais+=($((tempo_continua - tempo_pausa)))

      echo "Retomado em: $(date)" >> "$nome_arquivo"
       echo "---" >> "$nome_arquivo"
      tempo_pausado=0
    fi
  elif [[ "$tecla" == "f" ]]; then # Finaliza
    tempo_fim=$(date +%s)
    if [[ "$tempo_pausado" == 0 ]]; then #Para caso não tenha sido pausado antes de finalizar
        tempo_total=$((tempo_total + tempo_fim - tempo_inicio))
        tempos_parciais+=($((tempo_fim - tempo_inicio)))
    fi

    echo "Fim: $(date)" >> "$nome_arquivo"
    echo "Tempo Total: $(formata_tempo "$tempo_total")" >> "$nome_arquivo"
    echo "Tempos Parciais:" >> "$nome_arquivo"
    for tempo_parcial in "${tempos_parciais[@]}"; do
        echo "- $(formata_tempo "$tempo_parcial")" >> "$nome_arquivo"
    done
    exit 0
  fi
done
