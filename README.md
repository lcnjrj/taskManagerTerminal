# Bash Task Tracker Para Terminal

Script em **Bash** para registro manual de tempo de tarefas no terminal, com suporte a **pausa, retomada e finalização**, salvando automaticamente os dados em arquivo `.txt`.

Ideal para estudos, produtividade pessoal, acompanhamento de atividades técnicas e ambientes Linux minimalistas.

---

## 📌 Funcionalidades

- Solicita o nome da tarefa no início
- Registra:
  - Data e hora de início
  - Uptime do sistema
- Controle de tempo via teclado:
  - **p** → Pausar / Retomar
  - **f** → Finalizar tarefa
- Calcula:
  - Tempo total da tarefa
  - Tempos parciais entre pausas
- Salva tudo automaticamente em arquivo texto

---

## ⌨️ Controles

| Tecla | Ação |
|-----|-----|
| `p` | Pausar ou retomar a contagem |
| `f` | Finalizar e salvar o relatório |

*(Não é necessário pressionar Enter)*

---

## 📄 Exemplo de saída (`minha_tarefa.txt`)

```txt
Início: Tue Jan 7 11:00:00 -03 2026
Uptime: 11:00 up 2:34, 1 user, load average: 0.15, 0.20, 0.18
---
Pausado em: Tue Jan 7 11:20:10 -03 2026
---
Retomado em: Tue Jan 7 11:35:02 -03 2026
---
Fim: Tue Jan 7 12:10:00 -03 2026
Tempo Total: 01:10:58
Tempos Parciais:
- 00:20:10
- 00:35:48
