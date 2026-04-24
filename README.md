# Crompressor GUI

> Interface gráfica nativa para o motor de compressão [Crompressor](https://github.com/MrJc01/crompressor).

---

## O que é?

O **Crompressor GUI** é uma aplicação desktop que fornece uma interface visual completa para o motor de compressão CROM. Ele combina um backend Go (servindo uma API REST local) com um frontend React moderno, renderizado nativamente via Chromium embarcado (Lorca).

### Funcionalidades

| Módulo | Descrição |
|--------|-----------|
| **Compressor** | Pack/Unpack de arquivos com seleção visual de codebook e modo (Edge/Archive) |
| **Vault Manager** | Montagem e desmontagem de drives VFS (FUSE) soberanos |
| **Brain Library** | Gerenciamento visual de codebooks — treinar, importar, selecionar |
| **Swarm Monitor** | Visualização de peers P2P conectados, latência e status da rede |
| **Clone Lab** | Laboratório de clonagem e experimentação com compressão |
| **Crypto** | Criptografia AES-256-GCM de arquivos com interface visual |

---

## Pré-requisitos

- **Go 1.22+** instalado
- **Node.js 18+** e npm (para compilar o frontend)
- **Google Chrome** ou **Chromium** instalado (usado pelo Lorca para renderização nativa)
- O motor [crompressor](https://github.com/MrJc01/crompressor) como dependência Go

---

## Instalação

```bash
git clone https://github.com/MrJc01/crompressor-gui
cd crompressor-gui

# Compilar o frontend
make build-ui

# Compilar o backend
make build
```

---

## Uso

```bash
# Iniciar a aplicação
make dev

# Ou diretamente:
./bin/crompressor_gui
```

A interface abrirá automaticamente em uma janela nativa. Caso o Chromium não seja detectado, um fallback abrirá o navegador padrão em `http://localhost:9100`.

---

## Arquitetura

```
crompressor-gui/
│
├── cmd/gui/            ← Backend Go (HTTP handlers, WebSocket, Lorca)
│   └── main.go
│
├── pkg/sdk/            ← SDK que orquestra o motor crompressor
│   ├── api.go          ← Interfaces (Compressor, Vault, Swarm, Identity)
│   ├── compressor.go   ← Implementação Pack/Unpack/Train/Verify
│   ├── vault.go        ← VFS FUSE + Kill-Switch soberano
│   ├── swarm.go        ← P2P GossipSub + Bitswap
│   ├── crypto.go       ← AES-256-GCM
│   ├── identity.go     ← Ed25519 Keypair
│   └── events.go       ← Event Bus para WebSocket
│
├── ui/                 ← Frontend React + Vite + Tailwind
│   ├── src/
│   │   ├── App.tsx
│   │   ├── components/
│   │   └── hooks/
│   ├── index.html
│   └── package.json
│
├── go.mod
├── Makefile
└── README.md
```

### Endpoints da API REST

| Método | Endpoint | Descrição |
|--------|----------|-----------|
| GET | `/api/health` | Status do servidor |
| GET | `/api/list?dir=` | Listar arquivos de um diretório |
| GET | `/api/info?path=` | Informações de um arquivo |
| POST | `/api/pack` | Comprimir arquivo (`input`, `output`, `codebook`, `mode`) |
| POST | `/api/unpack` | Descomprimir arquivo |
| POST | `/api/train` | Treinar codebook a partir de um diretório |
| POST | `/api/verify` | Verificar integridade (SHA-256 match) |
| POST | `/api/mount` | Montar drive VFS soberano |
| POST | `/api/unmount` | Desmontar drive VFS |
| POST | `/api/encrypt` | Criptografar arquivo |
| POST | `/api/decrypt` | Descriptografar arquivo |
| POST | `/api/swarm/start` | Iniciar nó P2P |
| POST | `/api/swarm/stop` | Parar nó P2P |
| GET | `/api/swarm/peers` | Listar peers conectados |
| POST | `/api/identity/generate` | Gerar par de chaves Ed25519 |
| WS | `/ws` | WebSocket para eventos em tempo real |

---

## Ecossistema

| Repositório | Papel |
|-------------|-------|
| [crompressor](https://github.com/MrJc01/crompressor) | Motor core (CLI + biblioteca) |
| [crompressor-gui](https://github.com/MrJc01/crompressor-gui) | Interface gráfica (este repo) |
| [crompressor-matematica](https://github.com/MrJc01/crompressor-matematica) | Estudo matemático e benchmarks |
| [crompressor-neuronio](https://github.com/MrJc01/crompressor-neuronio) | Pesquisa neural |
| [crompressor-sinapse](https://github.com/MrJc01/crompressor-sinapse) | Transporte P2P |

---

## Licença

MIT — veja [LICENSE](LICENSE).
